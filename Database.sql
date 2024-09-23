-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 23, 2024 at 04:32 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TK2`
--

-- --------------------------------------------------------

--
-- Table structure for table `Karyawan`
--

CREATE TABLE `Karyawan` (
  `idKaryawan` int(11) NOT NULL,
  `namaKaryawan` varchar(100) NOT NULL,
  `alamatKaryawan` varchar(255) DEFAULT NULL,
  `handphoneKaryawan` varchar(15) DEFAULT NULL,
  `pendidikanKaryawan` varchar(100) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `idLevel` int(11) DEFAULT NULL,
  `proses` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Karyawan`
--

INSERT INTO `Karyawan` (`idKaryawan`, `namaKaryawan`, `alamatKaryawan`, `handphoneKaryawan`, `pendidikanKaryawan`, `username`, `password`, `idLevel`, `proses`) VALUES
(1, 'Agung Budiman', 'Jakarta', '081234567890', 'S1 Teknik Informatika', 'agung123', 'pass123', 1, NULL),
(2, 'Bambang', 'Bandung', '081234567891', 'S1 Manajemen', 'bambang123', 'pass123', 1, NULL),
(3, 'Claura', 'Surabaya', '081234567892', 'S1 Akuntansi', 'claura123', 'pass123', 1, NULL),
(4, 'Dinda Melia', 'Medan', '081234567893', 'S1 Psikologi', 'dinda123', 'pass123', 1, NULL),
(5, 'Erlangga', 'Semarang', '081234567894', 'S1 Hukum', 'erlangga123', 'pass123', 1, NULL),
(6, 'Fortuna', 'Yogyakarta', '081234567895', 'S1 Desain Komunikasi Visual', 'fortuna123', 'pass123', 1, NULL),
(7, 'Gania Gia', 'Bali', '081234567896', 'S1 Ilmu Komunikasi', 'gania123', 'pass123', 1, NULL),
(8, 'Hilda Husna', 'Palembang', '081234567897', 'S1 Teknik Sipil', 'hilda123', 'pass123', 1, NULL),
(9, 'Ilham Mutas', 'Makassar', '081234567898', 'S1 Pendidikan', 'ilham123', 'pass123', 1, NULL),
(10, 'Jennie', 'Batam', '081234567899', 'S1 Ekonomi', 'jennie123', 'pass123', 1, NULL),
(11, 'Lalisa', 'Pontianak', '081234567800', 'S2 Manajemen', 'lisa123', 'pass123', 1, NULL),
(12, 'Meira', 'Banjarmasin', '081234567801', 'S2 Teknologi Informasi', 'meira123', 'pass123', 1, NULL),
(13, 'Nanika', 'Jakarta', '081234567802', 'S2 Manajemen Sumber Daya Manusia', 'nanika123', 'pass123', 2, NULL),
(14, 'Owen Gilbert', 'Bandung', '081234567803', 'S2 Keuangan', 'owen123', 'pass123', 2, NULL),
(15, 'Pharita', 'Denpasar', '081234567804', 'S2 Psikologi', 'pharita123', 'pass123', 2, NULL),
(16, 'Qin Halim', 'Yogyakarta', '081234567805', 'S2 Komunikasi', 'qin123', 'pass123', 2, NULL),
(17, 'Rama Hartono', 'Jakarta', '081234567806', 'S3 Manajemen Bisnis', 'rama123', 'pass123', 3, NULL),
(18, 'Silham Sani', 'Surabaya', '081234567807', 'S3 Teknologi Informasi', 'silham123', 'pass123', 3, NULL),
(19, 'Tania Amara', 'Jakarta', '081234567808', 'S3 Administrasi Bisnis', 'tania123', 'pass123', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Kriteria`
--

CREATE TABLE `Kriteria` (
  `idKriteria` int(11) NOT NULL,
  `namaKriteria` varchar(100) NOT NULL,
  `jenis` enum('Benefit','Cost') NOT NULL,
  `bobot` decimal(5,2) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Kriteria`
--

INSERT INTO `Kriteria` (`idKriteria`, `namaKriteria`, `jenis`, `bobot`, `keterangan`) VALUES
(1, 'KPI', 'Benefit', 35.00, 'Kinerja karyawan berdasarkan indikator kinerja utama'),
(2, 'Attitude', 'Benefit', 20.00, 'Sikap dan perilaku karyawan di tempat kerja'),
(3, 'Layanan', 'Benefit', 15.00, 'Kualitas layanan yang diberikan kepada pelanggan'),
(4, 'Presensi', 'Cost', 10.00, 'Tingkat kehadiran karyawan'),
(5, 'Ketelitian', 'Benefit', 20.00, 'Akurasi dan ketelitian dalam pekerjaan');

-- --------------------------------------------------------

--
-- Table structure for table `Level`
--

CREATE TABLE `Level` (
  `idLevel` int(11) NOT NULL,
  `namaLevel` varchar(100) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Level`
--

INSERT INTO `Level` (`idLevel`, `namaLevel`, `keterangan`) VALUES
(1, 'Staff', 'Hanya dapat mengisikan data diri dan tidak dapat memberikan nilai'),
(2, 'Supervisor', 'Dapat memberikan nilai untuk Attitude, Layanan, dan Ketelitian'),
(3, 'Manager', 'Dapat memberikan nilai KPI dan Presensi serta meng-approve semua penilaian'),
(4, 'Direktur', 'Menghitung nilai akhir dan memberikan reward kepada karyawan terbaik');

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

CREATE TABLE `penilaian` (
  `idPenilaian` int(11) NOT NULL,
  `idKaryawan` int(11) DEFAULT NULL,
  `KPI` float DEFAULT NULL,
  `Attitude` float DEFAULT NULL,
  `Layanan` float DEFAULT NULL,
  `Presensi` float DEFAULT NULL,
  `Ketelitian` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penilaian`
--

INSERT INTO `penilaian` (`idPenilaian`, `idKaryawan`, `KPI`, `Attitude`, `Layanan`, `Presensi`, `Ketelitian`) VALUES
(1, 1, 50, 50, 50, 80, 70),
(2, 2, 60, 70, 90, 90, 60),
(3, 3, 70, 80, 60, 70, 80),
(4, 4, 60, 70, 90, 90, 60),
(5, 5, 40, 80, 60, 60, 90),
(6, 6, 50, 50, 50, 80, 70),
(7, 7, 80, 60, 70, 70, 80),
(8, 8, 50, 50, 50, 80, 70),
(9, 9, 70, 60, 70, 90, 30),
(10, 10, 60, 70, 90, 90, 60),
(11, 11, 50, 50, 50, 80, 70),
(12, 12, 60, 70, 90, 90, 60);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Karyawan`
--
ALTER TABLE `Karyawan`
  ADD PRIMARY KEY (`idKaryawan`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `idLevel` (`idLevel`);

--
-- Indexes for table `Kriteria`
--
ALTER TABLE `Kriteria`
  ADD PRIMARY KEY (`idKriteria`);

--
-- Indexes for table `Level`
--
ALTER TABLE `Level`
  ADD PRIMARY KEY (`idLevel`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`idPenilaian`),
  ADD KEY `idKaryawan` (`idKaryawan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Karyawan`
--
ALTER TABLE `Karyawan`
  MODIFY `idKaryawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `Kriteria`
--
ALTER TABLE `Kriteria`
  MODIFY `idKriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Level`
--
ALTER TABLE `Level`
  MODIFY `idLevel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `idPenilaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Karyawan`
--
ALTER TABLE `Karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`idLevel`) REFERENCES `Level` (`idLevel`);

--
-- Constraints for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`idKaryawan`) REFERENCES `karyawan` (`idKaryawan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
