<?php
include 'connect.php';
    $id_pinjam = $_GET['id_peminjaman'];
    $query = mysqli_execute_query($connect, "SELECT * FROM peminjaman WHERE id_peminjaman=?", [$id_pinjam]);
    $pinjam= mysqli_fetch_assoc($query);

if(mysqli_num_rows($query) < 1 ) {
    die("data tidak ditemukan...");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Link CSS sendiri -->
    <link rel="stylesheet" href="style.css">

    <!-- Link Icon -->
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">

    <title>Barang</title>
</head>
<body>

    <div class="sidebar">

        <!-- Brand -->
        <div class="sidebar-brand">
            <h2>
                <div class="brand">
                    <i class="lab la-wolf-pack-battalion"></i>
                    <div class="brand-name">Nugas</div>
                </div>
                <i class="las la-bars" id="btn"></i>
            </h2>
        </div>

        <!-- Menu -->

        <ul class="nav_list">
            <li>
                <a href="home.php" class="menu">
                    <i class="las la-home"></i>
                    <span class="links_name">Dashboard</span>
                </a>
                <span class="tooltip">Dashboard</span>
            </li>
            <li class="dua">
                <a id="btn1" class="menu">
                    <i class="las la-users"></i>
                    <span class="links_name">Master</span>
                </a>
                <ul>
                    <li>
                        <a href="pegawai.php">
                            <i class="las la-users"></i>
                            Pegawai
                        </a>
                    </li>
                    <li>
                        <a href="pengguna.php">
                            <i class="las la-user"></i>
                            Pengguna
                        </a>
                    </li>
                    <li>
                        <a href="barang.php">
                            <i class="las la-laptop"></i>
                            Barang
                        </a>
                    </li>
                </ul>
                <span class="tooltip">Master</span>
            </li>
            <li class="tiga">
                <a href="inventori.php" class="menu">
                    <i class="las la-box"></i>
                    <span class="links_name">Inventori</span>
                </a>
                <span class="tooltip">Inventori</span>
            </li>
            <li class="empat">
                <a href="peminjaman.php"  class="menu">
                    <i class="las la-receipt"></i>
                    <span class="links_name">Peminjaman</span>
                </a>
                <span class="tooltip">Peminjaman</span>
            </li>
            <li class="bawah">
                <a class="menu" id="btn2">
                    <i class="at">@</i>
                    <span class="links_name">Happy^2</span>
                </a>
                <span class="tooltip">Copyright</span>
            </li>
        </ul>
    </div>

    <div class="main-content">

        <header>
            <div class="header-title">
                <h2>
                    <label for="">
                        Form Peminjaman
                    </label>
                </h2>
            </div>
            <div class="user-wrapper">
                <img src="gambar/poto.png" alt="">
                <div>
                    <h4>Admin</h4>
                    <small>Super admin</small>
                </div>
            </div>
        </header>

        <main>
            <div class="container">
                <form action="edit.php" method="POST">
                    <input type="hidden" name="id_peminjaman" value="<?php echo $pinjam['id_peminjaman']?>"/>
                    <input type="hidden" name="jenis_id" value="<?php echo $pinjam['no_pengguna']?>">
                    <input type="hidden" name="tgl_pinjam" value="<?php echo $pinjam['tgl_pinjam']?>">
                    <div class="form_group">
                        <label>Pengembalian</label>
                        <select class="form_field" name="dikembalikan" id="dikembalikan" value="<?php echo $pinjam['dikembalikan']?>">
                            <option value="SUDAH">
                                SUDAH
                            </option>
                            <option value="BELUM">
                                BELUM
                            </option>
                        </select>
                    </div>
                    <input type="submit" name="simpanpeminjaman" value="Ubah" class="button button-main"/>
                </form>
            </div>
        </main>
    </div>
    <script src="nyam.js"></script>
</body>
</html>