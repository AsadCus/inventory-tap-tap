<?php
include 'connect.php';
 
$id_peminjaman = isset($_POST['id_peminjaman']) ? $_POST['id_peminjaman'] : '';
$id_barang = isset($_POST['id_barang']) ? $_POST['id_barang'] : '';
$jumlah_dipinjam = isset($_POST['jumlah_dipinjam']) ? $_POST['jumlah_dipinjam'] : '';
$no_pengguna = isset($_POST['no_pengguna']) ? $_POST['no_pengguna'] : '';
$tgl_pinjam = isset($_POST['tgl_pinjam']) ? $_POST['tgl_pinjam'] : '';
$dikembalikan = isset($_POST['dikembalikan']) ? $_POST['dikembalikan'] : '';

// $sql = "INSERT INTO peminjaman (id_peminjaman, id_barang, jumlah_dipinjam, no_pengguna, tgl_pinjam, dikembalikan) VALUES ('$id_peminjaman', '$id_barang', '$jumlah_dipinjam', '$no_pengguna', '$tgl_pinjam', '$dikembalikan')";
// $query = mysqli_query($connect, $sql);

$query = mysqli_execute_query($connect, "INSERT INTO peminjaman (id_peminjaman, no_pengguna) VALUES (?,?)", [$id_peminjaman, $no_pengguna]);
if ($query) {
    $query = mysqli_execute_query($connect, "INSERT INTO detail_peminjaman (id_peminjaman, id_barang, jumlah_dipinjam) VALUES (?,?,?)", [$id_peminjaman, $id_barang, $jumlah_dipinjam]);
    if ($query) {
        // header('Location: peminjaman.php');
        $sql = "SELECT pengguna.nama_pengguna, pengguna.no_pengguna, pengguna.fileActualExt, barang.nama_barang, detail_peminjaman.jumlah_dipinjam,peminjaman.id_peminjaman, peminjaman.tgl_pinjam FROM pengguna, barang, detail_peminjaman, peminjaman
        WHERE pengguna.no_pengguna = peminjaman.no_pengguna &&
        barang.id_barang = detail_peminjaman.id_barang &&
        peminjaman.id_peminjaman = detail_peminjaman.id_peminjaman &&
        peminjaman.id_peminjaman = ?";

        $query = mysqli_execute_query($connect, $sql, [$id_peminjaman]);
        while($resi = mysqli_fetch_array($query)){
        
            echo "<div class='resi-large'>";
            echo "<img class='resi-pp' src='uploads/".$resi['no_pengguna'].".".$resi['fileActualExt']."' alt='profilepic'>";
            echo "<p>".$resi['nama_pengguna']."</p>";
            echo "</div>";
            echo "<div class='resi-small'>";
            echo "<p>ID Peminjaman: ".$resi['id_peminjaman']."</p>";
            echo "<p>Nama Barang: ".$resi['nama_barang']."</p>";
            echo "<p>Jumlah Pinjam: ".$resi['jumlah_dipinjam']."</p>";
            echo "<p>Tanggal Pinjam: ".$resi['tgl_pinjam']."</p>";
            echo "</div>";
        };
    }else {
        header('Location: simpan.php?status=gagal-di-detail-peminjaman');
    };
}else {
    header('Location: simpan.php?status=gagal-di-peminjaman');
}
?>