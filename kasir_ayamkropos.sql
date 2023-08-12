-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Agu 2023 pada 09.00
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir_ayamkropos`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `adjusted_products`
--

CREATE TABLE `adjusted_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `adjustment_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `adjusted_products`
--

INSERT INTO `adjusted_products` (`id`, `adjustment_id`, `product_id`, `quantity`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 6, 'sub', '2023-08-07 23:01:02', '2023-08-07 23:01:02'),
(2, 2, 1, 5, 'add', '2023-08-10 01:30:46', '2023-08-10 01:30:46'),
(3, 3, 6, 15, 'add', '2023-08-10 21:43:30', '2023-08-10 21:43:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `adjustments`
--

CREATE TABLE `adjustments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `adjustments`
--

INSERT INTO `adjustments` (`id`, `date`, `reference`, `note`, `created_at`, `updated_at`) VALUES
(1, '2023-08-08', 'STK-00001', NULL, '2023-08-07 23:01:02', '2023-08-07 23:01:02'),
(2, '2023-08-10', 'STK-00002', NULL, '2023-08-10 01:30:46', '2023-08-10 01:30:46'),
(3, '2023-08-11', 'STK-00003', NULL, '2023-08-10 21:43:30', '2023-08-10 21:43:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_code` varchar(7) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `category_code`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'CA_01', 'Random', '2023-08-07 17:13:57', '2023-08-07 17:13:57'),
(2, 'CA_02', 'Frozen Food', '2023-08-07 19:06:09', '2023-08-07 19:06:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_name` varchar(20) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol` varchar(3) NOT NULL,
  `thousand_separator` varchar(1) NOT NULL,
  `decimal_separator` varchar(1) NOT NULL,
  `exchange_rate` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `currencies`
--

INSERT INTO `currencies` (`id`, `currency_name`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'Rupiah Indonesia', 'IDR', 'Rp', ',', '.', NULL, '2023-08-07 17:13:57', '2023-08-07 17:13:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `Kota` varchar(20) NOT NULL,
  `Kelurahan` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `customer_email`, `customer_phone`, `Kota`, `Kelurahan`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Devina', 'devinaf36@gmail.com', '089533346353', 'Depok', 'Cimanggis', 'Jalan Margonda Raya No.100', '2023-08-07 18:38:59', '2023-08-07 18:38:59'),
(2, 'Pelanggan2', 'customermail2@gmail.com', '08282991829', 'Depok', 'Mekarsari', 'Jalan ABC No.5', '2023-08-07 18:40:47', '2023-08-07 18:40:47'),
(3, 'Pelanggan3', 'customermail3@gmail.com', '08736437382', 'Depok', 'Mekarsari', 'Jalan ABC No.7', '2023-08-07 18:42:08', '2023-08-07 18:42:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(10) NOT NULL,
  `details` text DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `expenses`
--

INSERT INTO `expenses` (`id`, `category_id`, `date`, `reference`, `details`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-08-01', 'EXP-00001', 'Stiker Logo', 1200000, '2023-08-10 15:58:10', '2023-08-10 15:58:10'),
(2, 2, '2023-08-10', 'EXP-00002', 'Minyak 2L 1', 3000000, '2023-08-10 16:02:14', '2023-08-10 16:02:14'),
(3, 1, '2023-08-11', 'EXP-00003', 'Ikan Bandeng', 3000000, '2023-08-10 17:48:32', '2023-08-10 17:48:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(20) NOT NULL,
  `category_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `category_name`, `category_description`, `created_at`, `updated_at`) VALUES
(1, 'Bahan Baku', 'Ikan, Ayam, Bumbu, dan keperluan modal utama', '2023-08-07 19:07:15', '2023-08-10 16:00:38'),
(2, 'Operasional', 'Gas, Minyak Goreng, Listrik, dll', '2023-08-10 15:59:36', '2023-08-10 15:59:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_07_14_145038_create_categories_table', 1),
(5, '2021_07_14_145047_create_products_table', 1),
(6, '2021_07_15_211319_create_media_table', 1),
(7, '2021_07_16_010005_create_uploads_table', 1),
(8, '2021_07_16_220524_create_permission_tables', 1),
(9, '2021_07_22_003941_create_adjustments_table', 1),
(10, '2021_07_22_004043_create_adjusted_products_table', 1),
(11, '2021_07_28_192608_create_expense_categories_table', 1),
(12, '2021_07_28_192616_create_expenses_table', 1),
(13, '2021_07_29_165419_create_customers_table', 1),
(14, '2021_07_29_165440_create_suppliers_table', 1),
(15, '2021_07_31_015923_create_currencies_table', 1),
(16, '2021_07_31_140531_create_settings_table', 1),
(17, '2021_07_31_201003_create_sales_table', 1),
(18, '2021_07_31_212446_create_sale_details_table', 1),
(19, '2021_08_07_192203_create_sale_payments_table', 1),
(20, '2021_08_08_021108_create_purchases_table', 1),
(21, '2021_08_08_021131_create_purchase_payments_table', 1),
(22, '2021_08_08_021713_create_purchase_details_table', 1),
(23, '2021_08_08_175345_create_sale_returns_table', 1),
(24, '2021_08_08_175358_create_sale_return_details_table', 1),
(25, '2021_08_08_175406_create_sale_return_payments_table', 1),
(26, '2021_08_08_222603_create_purchase_returns_table', 1),
(27, '2021_08_08_222612_create_purchase_return_details_table', 1),
(28, '2021_08_08_222646_create_purchase_return_payments_table', 1),
(29, '2021_08_16_015031_create_quotations_table', 1),
(30, '2021_08_16_155013_create_quotation_details_table', 1),
(31, '2023_07_01_184221_create_units_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(50) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('pleabug@gmail.com', '$2y$10$0A58uDcWBs5ab12ePdYj5u1spRrZKgiWLJsz4OVeAZzYvmKfjvOAu', '2023-08-10 16:50:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `guard_name` varchar(125) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'edit_own_profile', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(2, 'access_user_management', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(3, 'show_total_stats', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(4, 'show_month_overview', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(5, 'show_weekly_sales_purchases', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(6, 'show_monthly_cashflow', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(7, 'show_notifications', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(8, 'access_products', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(9, 'create_products', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(10, 'show_products', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(11, 'edit_products', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(12, 'delete_products', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(13, 'access_product_categories', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(14, 'print_barcodes', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(15, 'access_adjustments', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(16, 'create_adjustments', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(17, 'show_adjustments', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(18, 'edit_adjustments', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(19, 'delete_adjustments', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(20, 'access_quotations', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(21, 'create_quotations', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(22, 'show_quotations', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(23, 'edit_quotations', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(24, 'delete_quotations', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(25, 'create_quotation_sales', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(26, 'send_quotation_mails', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(27, 'access_expenses', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(28, 'create_expenses', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(29, 'edit_expenses', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(30, 'delete_expenses', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(31, 'access_expense_categories', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(32, 'access_customers', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(33, 'create_customers', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(34, 'show_customers', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(35, 'edit_customers', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(36, 'delete_customers', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(37, 'access_suppliers', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(38, 'create_suppliers', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(39, 'show_suppliers', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(40, 'edit_suppliers', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(41, 'delete_suppliers', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(42, 'access_sales', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(43, 'create_sales', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(44, 'show_sales', 'web', '2023-08-07 17:13:55', '2023-08-07 17:13:55'),
(45, 'edit_sales', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(46, 'delete_sales', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(47, 'create_pos_sales', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(48, 'access_sale_payments', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(49, 'access_sale_returns', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(50, 'create_sale_returns', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(51, 'show_sale_returns', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(52, 'edit_sale_returns', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(53, 'delete_sale_returns', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(54, 'access_sale_return_payments', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(55, 'access_purchases', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(56, 'create_purchases', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(57, 'show_purchases', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(58, 'edit_purchases', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(59, 'delete_purchases', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(60, 'access_purchase_payments', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(61, 'access_purchase_returns', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(62, 'create_purchase_returns', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(63, 'show_purchase_returns', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(64, 'edit_purchase_returns', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(65, 'delete_purchase_returns', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(66, 'access_purchase_return_payments', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(67, 'access_reports', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(68, 'access_currencies', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(69, 'create_currencies', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(70, 'edit_currencies', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(71, 'delete_currencies', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(72, 'access_settings', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(73, 'access_units', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_code` varchar(7) DEFAULT NULL,
  `product_barcode_symbology` varchar(255) DEFAULT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_cost` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_unit` varchar(4) DEFAULT NULL,
  `product_stock_alert` int(11) NOT NULL,
  `product_order_tax` int(11) DEFAULT NULL,
  `product_tax_type` tinyint(4) DEFAULT NULL,
  `product_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_name`, `product_code`, `product_barcode_symbology`, `product_quantity`, `product_cost`, `product_price`, `product_unit`, `product_stock_alert`, `product_order_tax`, `product_tax_type`, `product_note`, `created_at`, `updated_at`) VALUES
(1, 2, 'Ayam Kropos', '1', 'EAN13', 13, 1700000, 3500000, 'PC', 5, NULL, NULL, NULL, '2023-08-07 19:15:24', '2023-08-10 01:59:52'),
(2, 2, 'Bandeng Kropos', '2', 'EAN13', 9, 1800000, 3700000, 'PC', 0, NULL, NULL, NULL, '2023-08-07 19:16:15', '2023-08-10 20:42:39'),
(3, 2, 'Garang Asem', '3', 'EAN13', 6, 1200000, 1700000, 'PC', 2, NULL, NULL, NULL, '2023-08-07 19:17:23', '2023-08-10 21:36:39'),
(4, 2, 'Singkong Kropos', '4', 'EAN13', 13, 600000, 1000000, 'PC', 2, NULL, NULL, NULL, '2023-08-07 19:18:24', '2023-08-10 01:53:57'),
(5, 2, 'Ayam Suwir', '5', 'EAN13', 13, 2000000, 3600000, 'PC', 2, NULL, NULL, NULL, '2023-08-07 19:19:25', '2023-08-10 20:58:06'),
(6, 2, 'Jambal Pete Rawit Hijau', '6', 'EAN13', 13, 1000000, 1500000, 'PC', 2, NULL, NULL, NULL, '2023-08-07 19:20:33', '2023-08-10 21:43:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(10) NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_name` varchar(50) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `payment_status` varchar(15) NOT NULL,
  `payment_method` varchar(15) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_details`
--

CREATE TABLE `purchase_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_payments`
--

CREATE TABLE `purchase_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_return_details`
--

CREATE TABLE `purchase_return_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_return_payments`
--

CREATE TABLE `purchase_return_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(10) NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(50) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `quotation_details`
--

CREATE TABLE `quotation_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_code` varchar(4) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(50) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `guard_name` varchar(125) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2023-08-07 17:13:56', '2023-08-07 17:13:56'),
(2, 'Super Admin', 'web', '2023-08-07 17:13:57', '2023-08-07 17:13:57'),
(3, 'Kasir', 'web', '2023-08-10 17:05:34', '2023-08-10 17:05:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(3, 1),
(3, 3),
(4, 1),
(4, 3),
(5, 1),
(5, 3),
(6, 1),
(6, 3),
(7, 1),
(7, 3),
(8, 1),
(8, 3),
(9, 1),
(9, 3),
(10, 1),
(10, 3),
(11, 1),
(11, 3),
(12, 1),
(12, 3),
(13, 1),
(13, 3),
(14, 1),
(14, 3),
(15, 1),
(15, 3),
(16, 1),
(16, 3),
(17, 1),
(17, 3),
(18, 1),
(18, 3),
(19, 1),
(19, 3),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(30, 3),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 3),
(35, 1),
(35, 3),
(36, 1),
(36, 3),
(37, 1),
(38, 1),
(39, 1),
(39, 3),
(40, 1),
(42, 1),
(42, 3),
(43, 1),
(43, 3),
(45, 1),
(45, 3),
(46, 1),
(46, 3),
(47, 1),
(47, 3),
(48, 1),
(48, 3),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(67, 3),
(72, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(15) NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(50) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `payment_status` varchar(15) NOT NULL,
  `payment_method` varchar(15) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`id`, `date`, `reference`, `customer_id`, `customer_name`, `tax_percentage`, `tax_amount`, `discount_percentage`, `discount_amount`, `shipping_amount`, `total_amount`, `paid_amount`, `due_amount`, `status`, `payment_status`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(2, '2023-08-09', 'SL-00001', 2, 'Pelanggan2', 0, 0, 0, 0, 0, 6000000, 6000000, 0, 'Selesai', 'Lunas', 'Cash', NULL, '2023-08-08 17:09:36', '2023-08-08 17:09:36'),
(3, '2023-08-10', 'SL-00003', 3, 'Pelanggan3', 0, 0, 0, 0, 0, 4200000, 4200000, 0, 'Selesai', 'Lunas', 'Bank Transfer', NULL, '2023-08-10 01:53:57', '2023-08-10 01:53:57'),
(4, '2023-08-10', 'SL-00004', 2, 'Pelanggan2', 0, 0, 0, 0, 0, 3600000, 3600000, 0, 'Selesai', 'Lunas', 'Cash', NULL, '2023-08-10 01:55:54', '2023-08-10 01:55:54'),
(5, '2023-07-31', 'SL-00005', 2, 'Pelanggan2', 0, 0, 0, 0, 0, 1500000, 0, 1500000, 'Pending', 'Belum Lunas', 'Cash', NULL, '2023-08-10 01:57:00', '2023-08-10 01:57:00'),
(6, '2023-07-30', 'SL-00006', 3, 'Pelanggan3', 0, 0, 0, 0, 0, 3600000, 2000000, 1600000, 'Pending', 'Bayar Sebagian', 'Cash', NULL, '2023-08-10 01:57:59', '2023-08-10 01:57:59'),
(7, '2023-08-10', 'SL-00007', 2, 'Pelanggan2', 0, 0, 0, 0, 0, 5000000, 4000000, 1000000, 'Pending', 'Bayar Sebagian', 'Bank Transfer', NULL, '2023-08-10 01:59:52', '2023-08-10 02:00:21'),
(9, '2023-08-02', 'SL-00008', 2, 'Pelanggan2', 0, 0, 0, 0, 0, 3700000, 3700000, 0, 'Selesai', 'Lunas', 'Cash', NULL, '2023-08-10 20:42:39', '2023-08-10 20:42:39'),
(10, '2023-08-03', 'SL-00010', 1, 'Devina', 0, 0, 0, 0, 0, 3600000, 3600000, 0, 'Selesai', 'Lunas', 'Cash', NULL, '2023-08-10 20:57:50', '2023-08-10 20:58:06'),
(11, '2023-08-11', 'SL-00011', 1, 'Devina', 0, 0, 0, 0, 0, 1700000, 0, 1700000, 'Pending', 'Belum Lunas', 'Cash', NULL, '2023-08-10 21:01:28', '2023-08-10 21:01:28'),
(12, '2023-08-11', 'SL-00012', 2, 'Pelanggan2', 0, 0, 0, 0, 0, 1700000, 1700000, 0, 'Selesai', 'Lunas', 'Bank Transfer', NULL, '2023-08-10 21:04:13', '2023-08-10 21:04:13'),
(13, '2023-08-11', 'SL-00013', 3, 'Pelanggan3', 0, 0, 0, 0, 0, 1700000, 1700000, 0, 'Selesai', 'Lunas', 'Cash', NULL, '2023-08-10 21:16:56', '2023-08-10 21:16:56'),
(14, '2023-07-30', 'SL-00014', 2, 'Pelanggan2', 0, 0, 0, 0, 0, 1700000, 1700000, 0, 'Selesai', 'Lunas', 'Cash', NULL, '2023-08-10 21:36:39', '2023-08-10 21:36:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sale_details`
--

CREATE TABLE `sale_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_code` varchar(4) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(50) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sale_details`
--

INSERT INTO `sale_details` (`id`, `sale_id`, `product_id`, `product_name`, `product_code`, `quantity`, `price`, `unit_price`, `sub_total`, `product_discount_amount`, `product_discount_type`, `product_tax_amount`, `created_at`, `updated_at`) VALUES
(4, 2, 1, 'Ayam Kropos', '1', 1, 3500000, 3500000, 3500000, 0, 'fixed', 0, '2023-08-08 17:09:36', '2023-08-08 17:09:36'),
(5, 2, 4, 'Singkong Kropos', '4', 1, 1000000, 1000000, 1000000, 0, 'fixed', 0, '2023-08-08 17:09:36', '2023-08-08 17:09:36'),
(6, 2, 6, 'Jambal Pete Rawit Hijau', '6', 1, 1500000, 1500000, 1500000, 0, 'fixed', 0, '2023-08-08 17:09:36', '2023-08-08 17:09:36'),
(7, 3, 3, 'Garang Asem', '3', 1, 1700000, 1700000, 1700000, 0, 'fixed', 0, '2023-08-10 01:53:57', '2023-08-10 01:53:57'),
(8, 3, 6, 'Jambal Pete Rawit Hijau', '6', 1, 1500000, 1500000, 1500000, 0, 'fixed', 0, '2023-08-10 01:53:57', '2023-08-10 01:53:57'),
(9, 3, 4, 'Singkong Kropos', '4', 1, 1000000, 1000000, 1000000, 0, 'fixed', 0, '2023-08-10 01:53:57', '2023-08-10 01:53:57'),
(10, 4, 5, 'Ayam Suwir', '5', 1, 3600000, 3600000, 3600000, 0, 'fixed', 0, '2023-08-10 01:55:54', '2023-08-10 01:55:54'),
(11, 5, 6, 'Jambal Pete Rawit Hijau', '6', 1, 1500000, 1500000, 1500000, 0, 'fixed', 0, '2023-08-10 01:57:00', '2023-08-10 01:57:00'),
(12, 6, 5, 'Ayam Suwir', '5', 1, 3600000, 3600000, 3600000, 0, 'fixed', 0, '2023-08-10 01:57:59', '2023-08-10 01:57:59'),
(15, 7, 1, 'Ayam Kropos', '1', 1, 3500000, 3500000, 3500000, 0, 'fixed', 0, '2023-08-10 02:00:21', '2023-08-10 02:00:21'),
(16, 7, 6, 'Jambal Pete Rawit Hijau', '6', 1, 1500000, 1500000, 1500000, 0, 'fixed', 0, '2023-08-10 02:00:21', '2023-08-10 02:00:21'),
(18, 9, 2, 'Bandeng Kropos', '2', 1, 3700000, 3700000, 3700000, 0, 'fixed', 0, '2023-08-10 20:42:39', '2023-08-10 20:42:39'),
(20, 10, 5, 'Ayam Suwir', '5', 1, 3600000, 3600000, 3600000, 0, 'fixed', 0, '2023-08-10 20:58:06', '2023-08-10 20:58:06'),
(21, 11, 3, 'Garang Asem', '3', 1, 1700000, 1700000, 1700000, 0, 'fixed', 0, '2023-08-10 21:01:28', '2023-08-10 21:01:28'),
(22, 12, 3, 'Garang Asem', '3', 1, 1700000, 1700000, 1700000, 0, 'fixed', 0, '2023-08-10 21:04:13', '2023-08-10 21:04:13'),
(23, 13, 3, 'Garang Asem', '3', 1, 1700000, 1700000, 1700000, 0, 'fixed', 0, '2023-08-10 21:16:56', '2023-08-10 21:16:56'),
(24, 14, 3, 'Garang Asem', '3', 1, 1700000, 1700000, 1700000, 0, 'fixed', 0, '2023-08-10 21:36:39', '2023-08-10 21:36:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sale_payments`
--

CREATE TABLE `sale_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(15) NOT NULL,
  `payment_method` varchar(15) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sale_payments`
--

INSERT INTO `sale_payments` (`id`, `sale_id`, `amount`, `date`, `reference`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(1, 2, 6000000, '2023-08-09', 'INV/SL-00001', 'Cash', NULL, '2023-08-08 17:09:36', '2023-08-08 17:09:36'),
(2, 3, 4200000, '2023-08-10', 'INV/SL-00003', 'Bank Transfer', NULL, '2023-08-10 01:53:57', '2023-08-10 01:53:57'),
(3, 4, 3600000, '2023-08-10', 'INV/SL-00004', 'Cash', NULL, '2023-08-10 01:55:54', '2023-08-10 01:55:54'),
(4, 6, 2000000, '2023-07-30', 'INV/SL-00006', 'Cash', NULL, '2023-08-10 01:57:59', '2023-08-10 01:57:59'),
(5, 7, 4000000, '2023-08-10', 'INV/SL-00007', 'Bank Transfer', NULL, '2023-08-10 01:59:52', '2023-08-10 01:59:52'),
(7, 9, 3700000, '2023-08-02', 'INV/SL-00008', 'Cash', NULL, '2023-08-10 20:42:39', '2023-08-10 20:42:39'),
(8, 10, 3600000, '2023-08-03', 'INV/SL-00010', 'Cash', NULL, '2023-08-10 20:57:50', '2023-08-10 20:57:50'),
(9, 12, 1700000, '2023-08-11', 'INV/SL-00012', 'Bank Transfer', NULL, '2023-08-10 21:04:13', '2023-08-10 21:04:13'),
(10, 13, 1700000, '2023-08-11', 'INV/SL-00013', 'Cash', NULL, '2023-08-10 21:16:56', '2023-08-10 21:16:56'),
(11, 14, 1700000, '2023-07-30', 'INV/SL-00014', 'Cash', NULL, '2023-08-10 21:36:39', '2023-08-10 21:36:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sale_returns`
--

CREATE TABLE `sale_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(10) NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(50) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(15) NOT NULL,
  `payment_status` varchar(15) NOT NULL,
  `payment_method` varchar(15) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sale_return_details`
--

CREATE TABLE `sale_return_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_return_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sale_return_payments`
--

CREATE TABLE `sale_return_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_return_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_email` varchar(50) NOT NULL,
  `company_phone` varchar(15) NOT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
  `default_currency_id` int(11) NOT NULL,
  `default_currency_position` varchar(10) NOT NULL,
  `notification_email` varchar(50) NOT NULL,
  `footer_text` text NOT NULL,
  `company_address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `company_name`, `company_email`, `company_phone`, `site_logo`, `default_currency_id`, `default_currency_position`, `notification_email`, `footer_text`, `company_address`, `created_at`, `updated_at`) VALUES
(1, 'Ayam Kropos', 'company@test.com', '081516403371', NULL, 1, 'prefix', 'notification@test.com', 'Kasir Ayam Kropos © 2023 || Developed by <strong>Devina Febriyanti</a></strong>', 'Jl. Merak No.21 Lembah Hijau, Mekarsari Cimanggis, Depok', '2023-08-07 17:13:57', '2023-08-10 22:05:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_name` varchar(50) NOT NULL,
  `supplier_email` varchar(50) NOT NULL,
  `supplier_phone` varchar(15) NOT NULL,
  `Kota` varchar(20) NOT NULL,
  `Kelurahan` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `short_name` varchar(10) DEFAULT NULL,
  `operator` varchar(3) DEFAULT NULL,
  `operation_value` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `units`
--

INSERT INTO `units` (`id`, `name`, `short_name`, `operator`, `operation_value`, `created_at`, `updated_at`) VALUES
(1, 'Piece', 'PC', '*', 1, '2023-08-07 17:13:57', '2023-08-07 17:13:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `uploads`
--

CREATE TABLE `uploads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `folder` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'super.admin@test.com', NULL, '$2y$10$qK2nL/YqpKR9DBz6KJH8hOlyrm/6CoMy93Wpp99cyPpjOVTMPU0cy', 1, NULL, '2023-08-07 17:13:57', '2023-08-07 17:13:57'),
(2, 'Admin', 'admin@test.com', NULL, '$2y$10$yRXzSHHRYZabFh.qaEmdEOdNNL3B.P9hphpvQvdVH/LWW9jqEktzu', 1, NULL, '2023-08-10 15:31:41', '2023-08-10 17:18:04'),
(3, 'Kasir 1', 'cashier1@test.com', NULL, '$2y$10$TiwzHC8LfarTFDYVN2fh..GIglfR0Y8ELF5WUmIHoS9nBoLPRNPKm', 1, NULL, '2023-08-10 17:09:24', '2023-08-10 17:09:24');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `adjusted_products`
--
ALTER TABLE `adjusted_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjusted_products_adjustment_id_foreign` (`adjustment_id`);

--
-- Indeks untuk tabel `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_code_unique` (`category_code`);

--
-- Indeks untuk tabel `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_product_code_unique` (`product_code`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`);

--
-- Indeks untuk tabel `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_details_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_details_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_payments_purchase_id_foreign` (`purchase_id`);

--
-- Indeks untuk tabel `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_returns_supplier_id_foreign` (`supplier_id`);

--
-- Indeks untuk tabel `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_return_details_purchase_return_id_foreign` (`purchase_return_id`),
  ADD KEY `purchase_return_details_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `purchase_return_payments`
--
ALTER TABLE `purchase_return_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_return_payments_purchase_return_id_foreign` (`purchase_return_id`);

--
-- Indeks untuk tabel `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotations_customer_id_foreign` (`customer_id`);

--
-- Indeks untuk tabel `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_details_quotation_id_foreign` (`quotation_id`),
  ADD KEY `quotation_details_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_customer_id_foreign` (`customer_id`);

--
-- Indeks untuk tabel `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_details_sale_id_foreign` (`sale_id`),
  ADD KEY `sale_details_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `sale_payments`
--
ALTER TABLE `sale_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_payments_sale_id_foreign` (`sale_id`);

--
-- Indeks untuk tabel `sale_returns`
--
ALTER TABLE `sale_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_returns_customer_id_foreign` (`customer_id`);

--
-- Indeks untuk tabel `sale_return_details`
--
ALTER TABLE `sale_return_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_return_details_sale_return_id_foreign` (`sale_return_id`),
  ADD KEY `sale_return_details_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `sale_return_payments`
--
ALTER TABLE `sale_return_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_return_payments_sale_return_id_foreign` (`sale_return_id`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `adjusted_products`
--
ALTER TABLE `adjusted_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `purchase_return_payments`
--
ALTER TABLE `purchase_return_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `quotation_details`
--
ALTER TABLE `quotation_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `sale_payments`
--
ALTER TABLE `sale_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `sale_returns`
--
ALTER TABLE `sale_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sale_return_details`
--
ALTER TABLE `sale_return_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sale_return_payments`
--
ALTER TABLE `sale_return_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `adjusted_products`
--
ALTER TABLE `adjusted_products`
  ADD CONSTRAINT `adjusted_products_adjustment_id_foreign` FOREIGN KEY (`adjustment_id`) REFERENCES `adjustments` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_categories` (`id`);

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Ketidakleluasaan untuk tabel `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `quotations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD CONSTRAINT `quotation_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `quotation_details_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `sale_details`
--
ALTER TABLE `sale_details`
  ADD CONSTRAINT `sale_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sale_details_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sale_payments`
--
ALTER TABLE `sale_payments`
  ADD CONSTRAINT `sale_payments_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
