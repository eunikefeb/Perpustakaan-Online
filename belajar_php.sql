-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2021 at 06:04 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belajar_php`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `nama_buku` varchar(100) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `nama_buku`, `deskripsi`, `foto`) VALUES
(17, 'Buku Cerita Nusantara', '-', 'buku cerita nusantara.jpg'),
(18, 'Antares', '-', 'antares.jpg'),
(19, 'Alkitab', '-', 'alkitab.jpg'),
(24, 'Buku Saku', '-', 'buku saku.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `detail_peminjaman_buku`
--

CREATE TABLE `detail_peminjaman_buku` (
  `id_peminjaman_buku` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_peminjaman_buku`
--

INSERT INTO `detail_peminjaman_buku` (`id_peminjaman_buku`, `id_buku`, `qty`) VALUES
(1, 3, 1),
(2, 3, 1),
(3, 1, 1),
(4, 2, 2),
(5, 2, 1),
(6, 1, 1),
(7, 1, 1),
(8, 2, 1),
(9, 17, 1),
(10, 17, 2),
(11, 19, 1),
(12, 20, 1),
(13, 17, 1),
(14, 19, 2),
(15, 19, 1),
(16, 18, 1),
(17, 17, 1),
(18, 19, 1),
(19, 18, 1),
(20, 24, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(20) DEFAULT NULL,
  `kelompok` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `kelompok`) VALUES
(1, 'XI RPL 1', '1'),
(2, 'XI RPL 2', '2'),
(3, 'XI RPL 3', '3');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman_buku`
--

CREATE TABLE `peminjaman_buku` (
  `id_peminjaman_buku` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjaman_buku`
--

INSERT INTO `peminjaman_buku` (`id_peminjaman_buku`, `id_siswa`, `tanggal_pinjam`, `tanggal_kembali`) VALUES
(10, 4, '2021-09-22', '2021-09-27'),
(13, 4, '2021-09-28', '2021-10-03'),
(18, 6, '2021-09-28', '2021-10-03'),
(19, 6, '2021-09-28', '2021-10-03'),
(20, 4, '2021-09-28', '2021-10-03');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian_buku`
--

CREATE TABLE `pengembalian_buku` (
  `id_peminjaman_buku` int(11) NOT NULL,
  `nama_buku` varchar(100) NOT NULL,
  `denda` int(11) NOT NULL,
  `tanggal_pengembalian` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengembalian_buku`
--

INSERT INTO `pengembalian_buku` (`id_peminjaman_buku`, `nama_buku`, `denda`, `tanggal_pengembalian`) VALUES
(1, '0', 0, '2021-09-13'),
(2, '0', 0, '2021-09-13'),
(3, '0', 0, '2021-09-13'),
(4, '', 70000, '2021-09-14'),
(5, '', 70000, '2021-09-14'),
(6, '', 0, '2021-09-14'),
(7, '', 0, '2021-09-14'),
(8, '', 0, '2021-09-17'),
(9, '', 0, '2021-09-22'),
(10, '', 0, '2021-09-26'),
(11, '', 0, '2021-09-26'),
(12, '', 0, '2021-09-26'),
(13, '', 0, '2021-09-28'),
(14, '', 0, '2021-09-28'),
(15, '', 0, '2021-09-28'),
(16, '', 0, '2021-09-28'),
(17, '', 0, '2021-09-28'),
(18, '', 0, '2021-09-28'),
(19, '', 0, '2021-09-28'),
(20, '', 0, '2021-09-28');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama_siswa` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama_siswa`, `tanggal_lahir`, `gender`, `alamat`, `username`, `password`, `id_kelas`) VALUES
(3, 'Louis', '2004-01-02', 'L', 'Malang', 'Louis', 'e8a648d12f20bd03c38f27d425f20664', 1),
(4, 'Jane', '2004-02-04', 'P', 'Tulungagung', 'Jane', '5570c0cd80d575f9db152f9cc8bf1c6a', 1),
(6, 'Jagat', '2021-09-15', 'L', 'Banjarmasin', 'Jagat', '34f453ba9c5c4d51e949b47c59707738', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `detail_peminjaman_buku`
--
ALTER TABLE `detail_peminjaman_buku`
  ADD PRIMARY KEY (`id_peminjaman_buku`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `peminjaman_buku`
--
ALTER TABLE `peminjaman_buku`
  ADD PRIMARY KEY (`id_peminjaman_buku`);

--
-- Indexes for table `pengembalian_buku`
--
ALTER TABLE `pengembalian_buku`
  ADD PRIMARY KEY (`id_peminjaman_buku`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `detail_peminjaman_buku`
--
ALTER TABLE `detail_peminjaman_buku`
  MODIFY `id_peminjaman_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `peminjaman_buku`
--
ALTER TABLE `peminjaman_buku`
  MODIFY `id_peminjaman_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pengembalian_buku`
--
ALTER TABLE `pengembalian_buku`
  MODIFY `id_peminjaman_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
