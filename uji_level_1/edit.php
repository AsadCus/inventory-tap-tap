<?php
include 'connect.php';

// EDIT PEMINJAMAN
if (isset($_POST['simpanpeminjaman'])) {
    $id_pinjam = $_POST['id_peminjaman'];
    $no_p = $_POST['no_pengguna'];
    $tgl = $_POST['tgl_pinjam'];
    $kembali = $_POST['dikembalikan'];

    $query = mysqli_execute_query($connect, "UPDATE peminjaman SET dikembalikan=? WHERE id_peminjaman=?", [$kembali, $id_pinjam]);
    if ($query) {
        header('Location: peminjaman.php');
    }else {
        header('Location: edit.php?status=gagal');
    }
}

// EDIT PENGGUNA
if (isset($_POST['simpanpengguna'])) {
    $no_p = $_POST['no_pengguna'];
    $nama_p = $_POST['nama_pengguna'];
    $ktg = $_POST['kategori'];

    $query = mysqli_execute_query($connect, "UPDATE pengguna SET nama_pengguna=?, kategori=? WHERE no_pengguna=?", [$nama_p, $ktg, $no_p]);
    if ($query) {
        header('Location: pengguna.php');
    }else {
        header('Location: edit.php?status=gagal');
    }
}

// EDIT PEGAWAI
if (isset($_POST['simpanpegawai'])) {
    $id_p = $_POST['id_pegawai'];
    $nama_p = $_POST['nama_pegawai'];

    $query = mysqli_execute_query($connect, "UPDATE pegawai SET nama_pegawai=? WHERE id_pegawai=?", [$nama_p, $id_p]);
    if ($query) {
        header('Location: pegawai.php');
    }else {
        header('Location: edit.php?status=gagal');
    }
}

// EDIT BARANG
if (isset($_POST['simpanbarang'])) {
    $id_b = $_POST['id_barang'];
    $nama_b = $_POST['nama_barang'];

    $query = mysqli_execute_query($connect, "UPDATE barang SET nama_barang=? WHERE id_barang=?", [$nama_b, $id_b]);
    if ($query) {
        header('Location: barang.php');
    }else {
        header('Location: edit.php?status=gagal');
    }
}

// EDIT INVENTORI
if (isset($_POST['simpaninventori'])) {
    $id_iv = $_POST['id_inventori'];
    $id_b = $_POST['id_barang'];
    $jumlah_b = $_POST['jumlah_barang'];
    $kondisi = $_POST['kondisi'];

    $query = mysqli_execute_query($connect, "UPDATE inventori SET jumlah_barang=?, kondisi=? WHERE id_inventori=?", [$jumlah_b, $kondisi, $id_iv]);
    if ($query) {
        header('Location: inventori.php');
    }else {
        header('Location: edit.php?status=gagal');
    }
}

?>