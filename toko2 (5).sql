-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2022 at 05:14 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko2`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(10) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(1, 'makanan', '2022-05-11 20:57:32', '2022-05-11 20:57:32'),
(2, 'minuman', '2022-05-12 05:55:21', '2022-05-12 05:55:21'),
(3, 'sembako', '2022-05-27 04:07:20', '2022-05-27 04:07:20');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id_member` int(10) UNSIGNED NOT NULL,
  `kode_member` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_member`, `kode_member`, `nama`, `alamat`, `telepon`, `created_at`, `updated_at`) VALUES
(1, '00001', 'kukuh', 'su', '00001', '2022-05-22 08:41:24', '2022-05-22 11:54:53'),
(3, '00002', 'kukuh', 'n', '00001', '2022-05-22 12:21:24', '2022-05-22 12:21:24'),
(4, '00003', 'hhhh', 'n', '0000', '2022-05-22 12:22:37', '2022-05-22 12:22:37');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_04_01_032828_tambah_kolom_baru_to_users_table', 1),
(7, '2022_04_01_034729_buat_kategori_tabel', 1),
(8, '2022_04_06_073515_buat_produk_table', 1),
(9, '2022_04_06_074235_buat_member_table', 1),
(10, '2022_04_11_124746_buat_supplier_table', 1),
(11, '2022_04_11_125710_buat_pembelian_detail_table', 1),
(12, '2022_04_11_125828_buat_pembelian_table', 1),
(13, '2022_04_11_130807_buat_penjualan_table', 1),
(14, '2022_04_11_130930_buat_penjualan_detail_table', 1),
(15, '2022_04_11_131808_buat_setting_table', 1),
(16, '2022_04_11_132230_buat_pengeluaran_table', 1),
(17, '2022_04_13_070601_create_sessions_table', 1),
(18, '2022_05_12_040312_tambah_foreign_key_to_produk_table', 2),
(19, '2022_05_12_100624_tambah_kode_produka_to_produk_table', 3),
(20, '2022_05_12_103346_tambah_kode_produka_to_produk_table', 4),
(21, '2022_05_23_123540_tambah_diskon_to_setting_table', 5),
(22, '2022_05_23_154955_edit_id_member_to_penjualan_table', 6),
(23, '2022_05_30_234010_add_column_to_users_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(10) UNSIGNED NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `total_item` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `diskon` tinyint(4) NOT NULL DEFAULT 0,
  `bayar` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_supplier`, `total_item`, `total_harga`, `diskon`, `bayar`, `created_at`, `updated_at`) VALUES
(29, 2, 1, 3000, 0, 3000, '2022-05-14 19:28:18', '2022-05-14 19:28:33'),
(30, 1, 10, 150000, 10, 135000, '2022-05-16 05:06:59', '2022-05-16 05:07:35'),
(32, 1, 0, 0, 0, 0, '2022-05-16 20:01:26', '2022-05-16 20:01:26'),
(34, 1, 0, 0, 0, 0, '2022-05-16 22:35:28', '2022-05-16 22:35:28'),
(35, 1, 12, 20220, 10, 18198, '2022-05-16 22:35:29', '2022-05-16 22:36:01'),
(36, 1, 0, 0, 0, 0, '2022-05-17 00:36:08', '2022-05-17 00:36:08'),
(37, 1, 0, 0, 0, 0, '2022-05-17 00:36:39', '2022-05-17 00:36:39'),
(38, 1, 0, 0, 0, 0, '2022-05-17 01:40:54', '2022-05-17 01:40:54'),
(39, 1, 20, 60000, 10, 54000, '2022-05-17 01:50:21', '2022-05-17 01:50:46'),
(40, 1, 0, 0, 0, 0, '2022-05-21 08:31:42', '2022-05-21 08:31:42'),
(43, 3, 1, 30000, 20, 24000, '2022-05-21 22:48:43', '2022-05-21 22:48:55'),
(44, 2, 2, 60000, 10, 54000, '2022-05-21 22:49:40', '2022-05-21 22:49:52'),
(45, 1, 10, 2220, 10, 2198, '2022-05-21 23:13:10', '2022-05-21 23:13:28'),
(47, 2, 1, 222, 10, 200, '2022-05-21 23:15:30', '2022-05-21 23:15:42'),
(48, 1, 0, 0, 0, 0, '2022-05-21 23:16:29', '2022-05-21 23:16:29'),
(49, 1, 0, 0, 0, 0, '2022-05-22 11:44:34', '2022-05-22 11:44:34'),
(50, 2, 1, 30000, 10, 27000, '2022-05-23 05:54:24', '2022-05-23 05:54:33'),
(51, 1, 1, 222, 5, 211, '2022-05-23 08:10:20', '2022-05-23 08:10:30'),
(52, 1, 0, 0, 0, 0, '2022-05-23 08:24:40', '2022-05-23 08:24:40'),
(53, 1, 0, 0, 0, 0, '2022-05-23 10:00:07', '2022-05-23 10:00:07'),
(54, 1, 0, 0, 0, 0, '2022-05-23 23:17:00', '2022-05-23 23:17:00'),
(56, 1, 2, 444, 10, 400, '2022-06-04 18:36:35', '2022-06-04 18:39:00'),
(58, 1, 1, 30000, 0, 30000, '2022-06-06 19:56:50', '2022-06-06 20:00:18'),
(59, 1, 1, 2400, 0, 2400, '2022-06-07 20:38:50', '2022-06-07 20:39:07');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_detail`
--

CREATE TABLE `pembelian_detail` (
  `id_pembelian_detail` int(10) UNSIGNED NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembelian_detail`
--

INSERT INTO `pembelian_detail` (`id_pembelian_detail`, `id_pembelian`, `id_produk`, `harga_beli`, `jumlah`, `subtotal`, `created_at`, `updated_at`) VALUES
(16, 25, 11, 15000, 2, 30000, '2022-05-14 17:37:39', '2022-05-14 17:37:46'),
(18, 26, 11, 15000, 10, 150000, '2022-05-14 19:23:40', '2022-05-14 19:23:45'),
(19, 27, 11, 15000, 2, 30000, '2022-05-14 19:24:36', '2022-05-14 19:24:43'),
(20, 28, 10, 222, 10, 2220, '2022-05-14 19:26:19', '2022-05-14 19:26:25'),
(21, 29, 13, 3000, 1, 3000, '2022-05-14 19:28:22', '2022-05-14 19:28:22'),
(22, 30, 11, 15000, 10, 150000, '2022-05-16 05:07:04', '2022-05-16 05:07:10'),
(24, 32, 10, 222, 10, 2220, '2022-05-16 20:01:35', '2022-05-16 20:02:25'),
(25, 33, 10, 222, 10, 2220, '2022-05-16 21:49:28', '2022-05-16 21:49:33'),
(26, 35, 10, 222, 1, 222, '2022-05-16 22:35:39', '2022-05-23 10:18:37'),
(27, 35, 11, 15000, 3, 45000, '2022-05-16 22:35:39', '2022-05-23 19:15:31'),
(28, 35, 13, 3000, 1, 3000, '2022-05-16 22:35:41', '2022-05-16 22:35:41'),
(30, 39, 13, 3000, 20, 60000, '2022-05-17 01:50:26', '2022-05-17 01:50:39'),
(35, 42, 33, 30000, 1, 30000, '2022-05-21 22:47:07', '2022-05-21 22:47:07'),
(36, 43, 33, 30000, 1, 30000, '2022-05-21 22:48:47', '2022-05-21 22:48:47'),
(37, 44, 33, 30000, 1, 30000, '2022-05-21 22:49:44', '2022-05-21 22:49:44'),
(38, 44, 33, 30000, 1, 30000, '2022-05-21 22:49:46', '2022-05-21 22:49:46'),
(39, 45, 10, 222, 10, 2220, '2022-05-21 23:13:14', '2022-05-21 23:13:19'),
(40, 47, 10, 222, 1, 222, '2022-05-21 23:15:34', '2022-05-21 23:15:34'),
(41, 50, 33, 30000, 1, 30000, '2022-05-23 05:54:28', '2022-05-23 05:54:28'),
(42, 51, 10, 222, 1, 222, '2022-05-23 08:10:25', '2022-05-23 08:10:25'),
(43, 52, 33, 30000, 3, 90000, '2022-05-23 08:24:45', '2022-05-23 08:24:52'),
(44, 54, 10, 222, 101, 22422, '2022-05-23 23:17:03', '2022-05-23 23:20:25'),
(45, 56, 10, 222, 2, 444, '2022-06-04 18:37:39', '2022-06-04 18:37:41'),
(46, 57, 33, 30000, 10, 300000, '2022-06-05 19:29:07', '2022-06-05 19:29:10'),
(47, 58, 33, 30000, 1, 30000, '2022-06-06 20:00:17', '2022-06-06 20:00:17'),
(48, 59, 35, 2400, 1, 2400, '2022-06-07 20:38:54', '2022-06-07 20:38:54');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(10) UNSIGNED NOT NULL,
  `id_member` int(11) DEFAULT NULL,
  `total_item` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `diskon` tinyint(4) NOT NULL DEFAULT 0,
  `bayar` int(11) NOT NULL DEFAULT 0,
  `diterima` int(11) NOT NULL DEFAULT 0,
  `id_user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_member`, `total_item`, `total_harga`, `diskon`, `bayar`, `diterima`, `id_user`, `created_at`, `updated_at`) VALUES
(42, 3, 4, 120000, 5, 114000, 140000, 2, '2022-05-24 08:01:59', '2022-05-24 08:09:44'),
(45, 4, 1, 30000, 5, 28500, 100000, 2, '2022-05-24 08:52:48', '2022-05-24 08:53:10'),
(48, 4, 10, 2220, 5, 2109, 20000, 2, '2022-05-24 10:13:04', '2022-05-24 10:13:43'),
(52, 1, 1, 222, 5, 211, 1000, 2, '2022-05-24 20:00:37', '2022-05-24 20:04:10'),
(59, 3, 1, 222, 5, 211, 1000, 1, '2022-05-24 21:09:10', '2022-05-24 21:09:37'),
(60, 1, 1, 222, 5, 211, 1000, 2, '2022-05-25 04:39:06', '2022-05-25 04:40:00'),
(179, 3, 2, 60000, 5, 57000, 100000, 2, '2022-05-28 21:28:48', '2022-05-28 21:29:11'),
(182, 3, 1, 30000, 5, 28500, 100000, 2, '2022-05-29 01:45:49', '2022-05-29 01:46:03'),
(222, NULL, 1, 3000, 0, 3000, 3000, 2, '2022-06-07 20:40:09', '2022-06-07 20:40:29'),
(223, NULL, 10, 30000, 0, 30000, 30000, 2, '2022-06-07 20:45:53', '2022-06-07 20:46:10');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `id_penjualan_detail` int(10) UNSIGNED NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `diskon` tinyint(4) NOT NULL DEFAULT 0,
  `subtotal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualan_detail`
--

INSERT INTO `penjualan_detail` (`id_penjualan_detail`, `id_penjualan`, `id_produk`, `harga_jual`, `jumlah`, `diskon`, `subtotal`, `created_at`, `updated_at`) VALUES
(57, 38, 10, 222, 2, 0, 444, '2022-05-24 07:20:30', '2022-05-24 07:20:33'),
(58, 40, 10, 222, 1, 0, 222, '2022-05-24 07:40:05', '2022-05-24 07:40:05'),
(61, 41, 33, 30000, 3, 0, 90000, '2022-05-24 07:58:28', '2022-05-24 07:58:31'),
(63, 42, 33, 30000, 4, 0, 120000, '2022-05-24 08:08:58', '2022-05-24 08:09:11'),
(64, 44, 10, 222, 2, 0, 444, '2022-05-24 08:51:39', '2022-05-24 08:51:42'),
(65, 45, 33, 30000, 1, 0, 30000, '2022-05-24 08:52:52', '2022-05-24 08:52:52'),
(67, 46, 10, 222, 10, 0, 2220, '2022-05-24 09:35:55', '2022-05-24 09:35:58'),
(69, 48, 10, 222, 10, 0, 2220, '2022-05-24 10:13:15', '2022-05-24 10:13:18'),
(70, 52, 10, 222, 1, 0, 222, '2022-05-24 20:04:03', '2022-05-24 20:04:03'),
(71, 59, 10, 222, 1, 0, 222, '2022-05-24 21:09:18', '2022-05-24 21:09:18'),
(72, 60, 10, 222, 1, 0, 222, '2022-05-25 04:39:10', '2022-05-25 04:39:10'),
(123, 137, 33, 30000, 1000, 0, 30000000, '2022-05-28 11:20:33', '2022-05-28 11:20:36'),
(124, 139, 33, 30000, 1000, 0, 30000000, '2022-05-28 11:23:32', '2022-05-28 11:23:35'),
(125, 140, 33, 30000, 1, 5, 30000, '2022-05-28 11:24:27', '2022-05-28 11:24:37'),
(126, 141, 33, 30000, 1, 0, 30000, '2022-05-28 11:25:53', '2022-05-28 11:25:53'),
(127, 143, 33, 30000, 10000, 0, 300000000, '2022-05-28 18:03:00', '2022-05-28 18:03:05'),
(128, 144, 33, 30000, 10000, 0, 300000000, '2022-05-28 18:04:51', '2022-05-28 18:04:55'),
(129, 145, 33, 30000, 1000, 0, 30000000, '2022-05-28 18:06:31', '2022-05-28 18:06:35'),
(136, 152, 33, 30000, 1, 0, 30000, '2022-05-28 18:27:25', '2022-05-28 18:27:25'),
(137, 153, 33, 30000, 1, 0, 30000, '2022-05-28 18:27:54', '2022-05-28 18:27:54'),
(141, 157, 33, 30000, 3, 5, 90000, '2022-05-28 18:47:54', '2022-05-28 18:48:05'),
(150, 168, 10, 222, 1, 0, 222, '2022-05-28 21:10:51', '2022-05-28 21:10:51'),
(159, 179, 33, 30000, 2, 5, 60000, '2022-05-28 21:28:51', '2022-05-28 21:29:11'),
(161, 182, 33, 30000, 1, 5, 30000, '2022-05-29 01:45:53', '2022-05-29 01:46:03'),
(164, 188, 33, 30000, 2, 0, 60000, '2022-05-31 17:49:39', '2022-05-31 17:49:43'),
(167, 191, 33, 30000, 1, 0, 30000, '2022-06-04 19:19:39', '2022-06-04 19:19:39'),
(169, 193, 33, 30000, 1, 0, 30000, '2022-06-05 19:28:41', '2022-06-05 19:28:41'),
(170, 194, 10, 222, 1, 0, 222, '2022-06-07 17:49:13', '2022-06-07 17:49:31'),
(172, 195, 10, 222, 1, 0, 222, '2022-06-07 17:53:29', '2022-06-07 17:54:30'),
(173, 196, 10, 222, 1, 0, 222, '2022-06-07 18:18:46', '2022-06-07 18:18:46'),
(178, 197, 10, 222, 2, 0, 444, '2022-06-07 18:41:27', '2022-06-07 18:42:24'),
(179, 198, 10, 222, 1000, 0, 222000, '2022-06-07 18:48:23', '2022-06-07 18:48:27'),
(180, 199, 33, 30000, 10, 0, 300000, '2022-06-07 18:49:34', '2022-06-07 18:49:38'),
(181, 200, 10, 222, 1000, 0, 222000, '2022-06-07 18:49:49', '2022-06-07 18:49:51'),
(182, 201, 10, 222, 10000, 0, 2220000, '2022-06-07 18:51:22', '2022-06-07 18:51:26'),
(183, 202, 10, 222, 100, 0, 22200, '2022-06-07 18:52:16', '2022-06-07 18:52:18'),
(184, 204, 10, 222, 1, 0, 222, '2022-06-07 18:59:43', '2022-06-07 18:59:43'),
(187, 211, 33, 30000, 150, 0, 4500000, '2022-06-07 19:25:14', '2022-06-07 19:25:23'),
(188, 213, 33, 30000, 300, 0, 9000000, '2022-06-07 19:31:11', '2022-06-07 19:31:20'),
(190, 217, 10, 222, 1, 0, 222, '2022-06-07 19:33:59', '2022-06-07 19:33:59'),
(191, 218, 33, 30000, 1, 0, 30000, '2022-06-07 19:34:30', '2022-06-07 19:34:30'),
(193, 221, 35, 3000, 1, 0, 3000, '2022-06-07 20:39:18', '2022-06-07 20:39:18'),
(195, 222, 35, 3000, 1, 0, 3000, '2022-06-07 20:40:21', '2022-06-07 20:40:21'),
(196, 223, 35, 3000, 10, 0, 30000, '2022-06-07 20:45:58', '2022-06-07 20:46:01');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(10) UNSIGNED NOT NULL,
  `id_kategori` int(10) UNSIGNED NOT NULL,
  `kode_produk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_produk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `diskon` tinyint(4) NOT NULL DEFAULT 0,
  `harga_jual` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `kode_produk`, `nama_produk`, `merk`, `harga_beli`, `diskon`, `harga_jual`, `stok`, `created_at`, `updated_at`) VALUES
(10, 2, 'P000001', 'Oki jeli', 'wdwd', 222, 0, 222, 100, '2022-05-12 05:13:33', '2022-06-07 19:34:16'),
(33, 2, 'P000011', 'teh pucuk', 'indofood', 30000, 0, 30000, 100, '2022-05-21 15:27:33', '2022-06-07 19:34:51'),
(35, 2, 'P000034', 'golda', 'indofood', 2400, 0, 3000, 0, '2022-06-07 20:12:04', '2022-06-07 20:46:10');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('GUkzsC7fn491jZMVwYJAUO00S97xCN9em5TBGcJ7', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWnc1WUhFb3QwQ3Y3NDJGc3A0Y3lHTkV6SVR4cmR4RGE3a241VUJHaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1655090431),
('hl0ezs5gLCbM5hvmjw878q7ThLgCCu7OspM6pENz', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXVQVm0yRm5QZXp6MDFrSDBFWDAzTXBiSEd0bFhFWW1URXI5cEVtVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3QvcG9zZ28vcHVibGljL2xvZ2luIjt9fQ==', 1655090460),
('wQynPEk1T5wWtO77meUk2AL7QD67XOkvwYVB66hR', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRExoVHRLS0V1TkZ5eEdPaW9xY3k4eE5yZDhhOTNWMW5Xa21IUEFVciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1654655708),
('XtxOLZbjPIMBPMe3O9P1SKWx1ZssdyyBlUhpUnC9', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiRGNRdkdGVTdqNURHQUVoT2RpaWcza1RKZUlONVVZbUxDdmJxdkVZRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3QvcG9zZ28vcHVibGljL2xhcG9yYW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MTI6ImlkX3Blbmp1YWxhbiI7aToyMjM7czo1OiJhbGVydCI7YTowOnt9czoxMjoiaWRfcGVtYmVsaWFuIjtpOjU5O3M6MTE6ImlkX3N1cHBsaWVyIjtzOjE6IjEiO30=', 1654660138);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(10) UNSIGNED NOT NULL,
  `nama_perusahaan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_nota` tinyint(4) NOT NULL,
  `diskon` smallint(6) NOT NULL DEFAULT 0,
  `path_logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_kartu_member` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id_setting`, `nama_perusahaan`, `alamat`, `telepon`, `tipe_nota`, `diskon`, `path_logo`, `path_kartu_member`, `created_at`, `updated_at`) VALUES
(1, 'POSgo', 'JL cinangsi cibogo subang', '08533322211', 1, 5, '/img/logo.png', '/img/member.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama`, `alamat`, `telepon`, `created_at`, `updated_at`) VALUES
(1, 'cahyudin', 'subang jaya', '08520020564', '2022-05-11 20:57:20', '2022-05-11 20:57:20'),
(2, 'rafki', 'bekasi', '0009', '2022-05-13 00:44:02', '2022-05-13 00:44:02'),
(3, 'sudra', 'subang', '08520020564', '2022-05-16 22:34:40', '2022-05-16 22:34:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `foto`, `level`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Pegawai', 'pegawai@gmail.com', NULL, '$2a$10$gg4HEI8lPVOmftFu3r/NBudWNFXvkBHTPLqqj5I0T9B8dOPAguJRG', '/img/logo-20220530091051.jpg', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-11 20:51:08', '2022-05-30 02:10:51'),
(2, 'admin', 'admin@gmail.com', NULL, '$2y$10$V84L.1P5lPUC1N843Wz7/Oyw6I.N0Vi1yFriDgv5b.1GHuRUI1072', '/img/logo-20220530091433.jpg', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-11 20:59:46', '2022-05-30 02:14:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD UNIQUE KEY `kategori_nama_kategori_unique` (`nama_kategori`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`),
  ADD UNIQUE KEY `member_kode_member_unique` (`kode_member`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD PRIMARY KEY (`id_pembelian_detail`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indexes for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD PRIMARY KEY (`id_penjualan_detail`),
  ADD KEY `id_penjualan` (`id_penjualan`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD UNIQUE KEY `produk_nama_produk_unique` (`nama_produk`),
  ADD UNIQUE KEY `produk_kode_produk_unique` (`kode_produk`),
  ADD KEY `produk_id_kategori_foreign` (`id_kategori`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  MODIFY `id_pembelian_detail` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  MODIFY `id_penjualan_detail` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
