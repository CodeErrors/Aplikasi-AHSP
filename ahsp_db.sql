-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Des 2021 pada 09.14
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ahsp_db`
--
CREATE DATABASE IF NOT EXISTS `ahsp_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ahsp_db`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ahsp`
--

CREATE TABLE `ahsp` (
  `id` int(11) NOT NULL,
  `kode_lvl_4` varchar(128) NOT NULL,
  `id_alat` int(11) NOT NULL,
  `id_bahan` int(11) NOT NULL,
  `id_upah` int(11) NOT NULL,
  `koefesien` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ahsp`
--

INSERT INTO `ahsp` (`id`, `kode_lvl_4`, `id_alat`, `id_bahan`, `id_upah`, `koefesien`) VALUES
(180, '2.2.1.1', 18, 0, 0, '1'),
(181, '2.2.1.1', 17, 0, 0, '2'),
(182, '2.2.1.1', 0, 11, 0, '3'),
(183, '2.2.1.1', 0, 0, 12, '4'),
(195, '2.2.1.2', 18, 0, 0, '1'),
(196, '2.2.1.2', 17, 0, 0, '2'),
(197, '2.2.1.2', 0, 11, 0, '3'),
(198, '2.2.1.2', 0, 10, 0, '4'),
(199, '2.2.1.2', 0, 0, 12, '5'),
(200, '2.2.1.2', 0, 0, 13, '6'),
(201, '2.2.1.2', 0, 0, 14, '7'),
(202, '2.2.1.3', 18, 0, 0, '0.1'),
(203, '2.2.1.3', 17, 0, 0, '0.2'),
(204, '2.2.1.3', 0, 11, 0, '0.5'),
(205, '2.2.1.3', 0, 10, 0, '0.7'),
(206, '2.2.1.3', 0, 0, 12, '0.6'),
(207, '2.2.1.3', 0, 0, 13, '0.3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ahsp_level_1`
--

CREATE TABLE `ahsp_level_1` (
  `id` int(11) NOT NULL,
  `kode_lvl_1` varchar(128) NOT NULL,
  `divisi` varchar(128) NOT NULL,
  `uraian` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ahsp_level_1`
--

INSERT INTO `ahsp_level_1` (`id`, `kode_lvl_1`, `divisi`, `uraian`) VALUES
(58, '1', 'Divisi 1', 'Design Development'),
(59, '2', 'Divisi 2', 'Sitework'),
(60, '3', 'Divisi 3', 'Pekerjaan Struktural'),
(61, '4', 'Divisi 4', 'Pekerjaan Arsitektur'),
(62, '5', 'Divisi 5', 'Pekerjaan Mekanikal'),
(63, '6', 'Divisi 6', 'Pekerjaan Elektrikal'),
(64, '7', 'Divisi 7', 'Fasilitas Eksterior Bangunan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ahsp_level_2`
--

CREATE TABLE `ahsp_level_2` (
  `id` int(11) NOT NULL,
  `kode_lvl_1` varchar(128) NOT NULL,
  `kode_lvl_2` varchar(128) NOT NULL,
  `uraian` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ahsp_level_2`
--

INSERT INTO `ahsp_level_2` (`id`, `kode_lvl_1`, `kode_lvl_2`, `uraian`) VALUES
(26, '1', '1.2', 'Asuransi dan Jaminan'),
(27, '2', '2.1', 'Setting-out'),
(29, '2', '2.2', 'Site-work'),
(30, '2', '2.3', 'Mobilisasi dan demobilisasi'),
(31, '3', '3.2', 'Pekerjaan Struktural di Bawah Tanah'),
(32, '1', '1.3', 'Shop drawing dan as-built drawing'),
(33, '1', '1.4', 'Site Management'),
(34, '1', '1.5', 'Dokumentasi Proyek'),
(35, '2', '2.4', 'Pembersihan Lahan dan Removal'),
(36, '2', '2.5', 'Gajian, pemotongan, timbunan, dan buangan'),
(38, '3', '3.3', 'Rangka Atap'),
(39, '4', '4.1', 'Beton'),
(40, '4', '4.2', 'Logam'),
(41, '4', '4.3', 'Kayu dan Plastik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ahsp_level_3`
--

CREATE TABLE `ahsp_level_3` (
  `id` int(11) NOT NULL,
  `kode_lvl_2` varchar(128) NOT NULL,
  `kode_lvl_3` varchar(128) NOT NULL,
  `uraian` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ahsp_level_3`
--

INSERT INTO `ahsp_level_3` (`id`, `kode_lvl_2`, `kode_lvl_3`, `uraian`) VALUES
(8, '2.2', '2.2.1', 'Pekerjaan Persiapan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ahsp_level_4`
--

CREATE TABLE `ahsp_level_4` (
  `id` int(11) NOT NULL,
  `kode_lvl_3` varchar(128) NOT NULL,
  `kode_lvl_4` varchar(128) NOT NULL,
  `uraian` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ahsp_level_4`
--

INSERT INTO `ahsp_level_4` (`id`, `kode_lvl_3`, `kode_lvl_4`, `uraian`) VALUES
(5, '2.2.1', '2.2.1.1', 'Pembuatan 1 m2 pagar sementara dari kayu'),
(18, '2.2.1', '2.2.1.2', 'Tes'),
(21, '2.2.1', '2.2.1.3', 'Pembangunan Jembatan 10m');

-- --------------------------------------------------------

--
-- Struktur dari tabel `alat`
--

CREATE TABLE `alat` (
  `id` int(11) NOT NULL,
  `uraian` varchar(128) NOT NULL,
  `kode` varchar(128) NOT NULL,
  `satuan` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `alat`
--

INSERT INTO `alat` (`id`, `uraian`, `kode`, `satuan`) VALUES
(17, 'Sekop', 'SK1', 'Unit'),
(18, 'Cangkul', 'CK1', 'Unit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bahan`
--

CREATE TABLE `bahan` (
  `id` int(11) NOT NULL,
  `uraian` varchar(128) NOT NULL,
  `kode` varchar(128) NOT NULL,
  `satuan` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bahan`
--

INSERT INTO `bahan` (`id`, `uraian`, `kode`, `satuan`) VALUES
(10, 'Semen', 'SM1', 'KG'),
(11, 'Besi', 'BS1', 'Batang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `biodata`
--

CREATE TABLE `biodata` (
  `id` int(11) NOT NULL,
  `nip` varchar(128) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` varchar(128) NOT NULL,
  `image` varchar(255) NOT NULL,
  `alamat` varchar(128) NOT NULL,
  `id_daerah` int(11) NOT NULL,
  `no_telp` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `biodata`
--

INSERT INTO `biodata` (`id`, `nip`, `nama`, `tgl_lahir`, `jenis_kelamin`, `image`, `alamat`, `id_daerah`, `no_telp`) VALUES
(1, '123', 'Dwi Harsyah Prasetya', '2002-02-10', 'Laki-laki', '3122700-200.png', 'Jl. Pakri 1 Rusunawa Polda Sumsel No.103 Kel Duku Kec Ilir Timur II', 5, '082376287800'),
(24, '321', 'Ade Prastyo', '2001-01-01', 'Laki-laki', 'default.jpg', 'Jl. Kebenaran', 5, '1234567890'),
(25, '111', 'Fanisa Diva', '2001-01-01', '', 'default.jpg', '', 5, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `daerah`
--

CREATE TABLE `daerah` (
  `id` int(11) NOT NULL,
  `daerah` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `daerah`
--

INSERT INTO `daerah` (`id`, `daerah`) VALUES
(3, 'Lahat'),
(4, 'Muara Enim'),
(5, 'Palembang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `harga`
--

CREATE TABLE `harga` (
  `id` int(11) NOT NULL,
  `id_alat` int(11) NOT NULL,
  `id_bahan` int(11) NOT NULL,
  `id_upah` int(11) NOT NULL,
  `kategori` varchar(128) NOT NULL,
  `id_daerah` int(11) NOT NULL,
  `harga` int(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `harga`
--

INSERT INTO `harga` (`id`, `id_alat`, `id_bahan`, `id_upah`, `kategori`, `id_daerah`, `harga`) VALUES
(86, 0, 10, 0, 'Bahan', 5, 12000),
(87, 0, 11, 0, 'Bahan', 5, 13000),
(88, 0, 0, 12, 'Upah', 5, 50000),
(89, 0, 0, 13, 'Upah', 5, 20000),
(90, 0, 0, 14, 'Upah', 5, 15000),
(91, 17, 0, 0, 'Alat', 5, 9000),
(92, 18, 0, 0, 'Alat', 5, 8000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `upah`
--

CREATE TABLE `upah` (
  `id` int(11) NOT NULL,
  `uraian` varchar(128) NOT NULL,
  `kode` varchar(128) NOT NULL,
  `satuan` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `upah`
--

INSERT INTO `upah` (`id`, `uraian`, `kode`, `satuan`) VALUES
(12, 'Mandor', 'MN1', 'OH'),
(13, 'Pekerja', 'PK1', 'OH'),
(14, 'Tukang Batu', 'TB1', 'OH');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nip` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role_id` int(1) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nip`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(1, '123', '$2y$10$EWZnvUaA5jq0Ii4allefbOSmKRG0epmBKL0cuqqVoWzx6Sh5s1A.C', 1, 1, 1630833298),
(28, '321', '$2y$10$JdPfQ1PNFqjmFoUCBVwrre.ZeUlXOGsLMflnWrZUAMc64RvFOZGT6', 2, 1, 1638245855),
(29, '111', '$2y$10$uEuYBaLv6j5hPfkrO66RpukL4gq1rb8Y.M5WmAFDeYwv/.R4r2rKy', 3, 1, 1638247799);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Admin\r\n'),
(2, 'Operator'),
(3, 'User');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ahsp`
--
ALTER TABLE `ahsp`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ahsp_level_1`
--
ALTER TABLE `ahsp_level_1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_lvl_1` (`kode_lvl_1`);

--
-- Indeks untuk tabel `ahsp_level_2`
--
ALTER TABLE `ahsp_level_2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_lvl_1` (`kode_lvl_1`),
  ADD KEY `kode_lvl_2` (`kode_lvl_2`);

--
-- Indeks untuk tabel `ahsp_level_3`
--
ALTER TABLE `ahsp_level_3`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ahsp_level_4`
--
ALTER TABLE `ahsp_level_4`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `alat`
--
ALTER TABLE `alat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bahan`
--
ALTER TABLE `bahan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `biodata`
--
ALTER TABLE `biodata`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `daerah`
--
ALTER TABLE `daerah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `harga`
--
ALTER TABLE `harga`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `upah`
--
ALTER TABLE `upah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `ahsp`
--
ALTER TABLE `ahsp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT untuk tabel `ahsp_level_1`
--
ALTER TABLE `ahsp_level_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT untuk tabel `ahsp_level_2`
--
ALTER TABLE `ahsp_level_2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `ahsp_level_3`
--
ALTER TABLE `ahsp_level_3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `ahsp_level_4`
--
ALTER TABLE `ahsp_level_4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `alat`
--
ALTER TABLE `alat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `bahan`
--
ALTER TABLE `bahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `biodata`
--
ALTER TABLE `biodata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `daerah`
--
ALTER TABLE `daerah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `harga`
--
ALTER TABLE `harga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT untuk tabel `upah`
--
ALTER TABLE `upah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
