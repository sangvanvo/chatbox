-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2023 at 09:41 AM
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
-- Database: `chatbot`
--

-- --------------------------------------------------------

--
-- Table structure for table `cong_viec`
--

CREATE TABLE `cong_viec` (
  `id` int(11) NOT NULL,
  `vi_tri` varchar(255) NOT NULL,
  `nghanh_nghe` varchar(255) NOT NULL,
  `muc_luong` varchar(50) NOT NULL,
  `bang_cap` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `khach_hang`
--

CREATE TABLE `khach_hang` (
  `id` int(11) NOT NULL,
  `ho_ten` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mat_khau` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loi_khuyen`
--

CREATE TABLE `loi_khuyen` (
  `id` int(11) NOT NULL,
  `h_su_nghiep` varchar(255) NOT NULL,
  `khoa_hoc` varchar(255) NOT NULL,
  `pt_nghe_nghiep` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `viec_lam`
--

CREATE TABLE `viec_lam` (
  `id` int(11) NOT NULL,
  `ten_cong_viec` int(11) NOT NULL,
  `muc_luong` int(11) NOT NULL,
  `dia_diem` int(11) NOT NULL,
  `tt_cong_viec` int(11) NOT NULL,
  `tt_lien_he` int(11) NOT NULL,
  `mo_ta_cong_viec` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cong_viec`
--
ALTER TABLE `cong_viec`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `khach_hang`
--
ALTER TABLE `khach_hang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loi_khuyen`
--
ALTER TABLE `loi_khuyen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `viec_lam`
--
ALTER TABLE `viec_lam`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cong_viec`
--
ALTER TABLE `cong_viec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `khach_hang`
--
ALTER TABLE `khach_hang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loi_khuyen`
--
ALTER TABLE `loi_khuyen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `viec_lam`
--
ALTER TABLE `viec_lam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
