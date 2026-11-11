-- MySQL dump 10.13  Distrib 8.0.45, for macos15 (x86_64)
--
-- Host: localhost    Database: db_ujilevel_starbhak_2021
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `db_ujilevel_starbhak_2021`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_ujilevel_starbhak_2021` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_ujilevel_starbhak_2021`;

--
-- Table structure for table `barang`
--

DROP TABLE IF EXISTS `barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barang` (
  `id_barang` varchar(3) NOT NULL,
  `nama_barang` varchar(30) DEFAULT NULL,
  `stok` int DEFAULT NULL,
  `tersedia` int DEFAULT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang`
--

LOCK TABLES `barang` WRITE;
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
INSERT INTO `barang` VALUES ('B01','Laptop Acer',12,7),('B02','Infocus In124',12,12),('B03','Epson EB-X100',10,10),('B04','Laptop Asus',10,10);
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_peminjaman`
--

DROP TABLE IF EXISTS `detail_peminjaman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail_peminjaman` (
  `id_peminjaman` varchar(3) NOT NULL,
  `id_barang` varchar(3) NOT NULL,
  `jumlah_dipinjam` int DEFAULT NULL,
  PRIMARY KEY (`id_peminjaman`,`id_barang`),
  KEY `id_peminjaman` (`id_peminjaman`),
  KEY `id_barang` (`id_barang`),
  CONSTRAINT `dp_fk1` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id_peminjaman`),
  CONSTRAINT `dp_fk2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_peminjaman`
--

LOCK TABLES `detail_peminjaman` WRITE;
/*!40000 ALTER TABLE `detail_peminjaman` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_peminjaman` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017*/ /*!50003 TRIGGER `mengurangi` AFTER INSERT ON `detail_peminjaman` FOR EACH ROW BEGIN
UPDATE barang
SET tersedia = tersedia - new.jumlah_dipinjam
WHERE id_barang = new.id_barang;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017*/ /*!50003 TRIGGER `pembatas` AFTER INSERT ON `detail_peminjaman` FOR EACH ROW BEGIN
IF ((SELECT tersedia FROM barang WHERE barang.id_barang = NEW.id_barang) < 0) THEN
DELETE FROM detail_peminjaman
WHERE id_peminjaman = NEW.id_peminjaman;
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017*/ /*!50003 TRIGGER `tambah` AFTER DELETE ON `detail_peminjaman` FOR EACH ROW BEGIN
UPDATE barang SET tersedia = tersedia + OLD.jumlah_dipinjam
WHERE id_barang = OLD.id_barang;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inventori`
--

DROP TABLE IF EXISTS `inventori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventori` (
  `id_inventori` int NOT NULL AUTO_INCREMENT,
  `id_barang` varchar(3) NOT NULL,
  `jenis_barang` varchar(20) DEFAULT NULL,
  `jumlah_barang` int DEFAULT '0',
  `kondisi` enum('BAIK','RUSAK','DIPERBAIKI') DEFAULT 'BAIK',
  PRIMARY KEY (`id_inventori`),
  KEY `id_barang` (`id_barang`),
  CONSTRAINT `inv_fk1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventori`
--

LOCK TABLES `inventori` WRITE;
/*!40000 ALTER TABLE `inventori` DISABLE KEYS */;
INSERT INTO `inventori` VALUES (1,'B01','Laptop',6,'BAIK'),(2,'B01','Laptop',3,'RUSAK'),(3,'B01','Laptop',3,'DIPERBAIKI'),(4,'B02','Proyektor',12,'BAIK'),(5,'B03','Proyektor',10,'BAIK'),(6,'B04','Laptop',10,'BAIK');
/*!40000 ALTER TABLE `inventori` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017*/ /*!50003 TRIGGER `inventori2` AFTER UPDATE ON `inventori` FOR EACH ROW BEGIN
  UPDATE barang
  SET tersedia = (SELECT COALESCE(SUM(jumlah_barang),0) FROM inventori
                  WHERE id_barang = NEW.id_barang AND kondisi = 'BAIK')
  WHERE id_barang = NEW.id_barang;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pegawai` (
  `id_pegawai` varchar(3) NOT NULL,
  `nama_pegawai` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegawai`
--

LOCK TABLES `pegawai` WRITE;
/*!40000 ALTER TABLE `pegawai` DISABLE KEYS */;
INSERT INTO `pegawai` VALUES ('S01','Admin'),('S02','Admin-2'),('S03','Admin-3'),('S04','Admin-4'),('S05','Admin-5'),('S06','Admin-6'),('S07','Admin-7');
/*!40000 ALTER TABLE `pegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peminjaman`
--

DROP TABLE IF EXISTS `peminjaman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peminjaman` (
  `id_peminjaman` varchar(3) NOT NULL,
  `no_pengguna` varchar(10) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT (curdate()),
  `dikembalikan` varchar(10) DEFAULT 'BELUM',
  PRIMARY KEY (`id_peminjaman`),
  KEY `no_pengguna` (`no_pengguna`),
  CONSTRAINT `peminjaman_fk1` FOREIGN KEY (`no_pengguna`) REFERENCES `pengguna` (`no_pengguna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peminjaman`
--

LOCK TABLES `peminjaman` WRITE;
/*!40000 ALTER TABLE `peminjaman` DISABLE KEYS */;
/*!40000 ALTER TABLE `peminjaman` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017*/ /*!50003 TRIGGER `hapus` AFTER UPDATE ON `peminjaman` FOR EACH ROW BEGIN

DECLARE status varchar(10);

SET status = new.dikembalikan;

IF (status = "SUDAH") THEN
	DELETE FROM detail_peminjaman
    WHERE id_peminjaman = NEW.id_peminjaman;
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pengguna`
--

DROP TABLE IF EXISTS `pengguna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengguna` (
  `no_pengguna` varchar(10) NOT NULL,
  `nama_pengguna` varchar(20) DEFAULT NULL,
  `kategori` enum('Murid','Guru','Ruang') DEFAULT NULL,
  `fileActualExt` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`no_pengguna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengguna`
--

LOCK TABLES `pengguna` WRITE;
/*!40000 ALTER TABLE `pengguna` DISABLE KEYS */;
INSERT INTO `pengguna` VALUES ('0000000001','Asad','Murid','jpeg'),('0000000002','Joy','Murid','jpg'),('0000000003','Zein','Murid','jpg'),('0009251346','Pak Puguh','Guru','png');
/*!40000 ALTER TABLE `pengguna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_ujilevel_starbhak_2021'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
