-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 23, 2025 at 11:46 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projek_akhir`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Bingung cari laptop?', 'bingung-cari-laptop', '/storage/photos/1/.png', '<p>Beli di Zyntech Enterprises aja!</p>', 'active', '2025-11-23 01:50:11', '2025-11-23 02:09:03'),
(3, 'Semua keperluan peripheral ada disini', 'semua-keperluan-peripheral-ada-disini', '/storage/photos/1/f1d4354d988d0afa70dfb50169836cc3223081ae_s2_n1.jpg', '<p>Ayo beli sekarang!</p>', 'active', '2025-11-23 02:10:42', '2025-11-23 02:10:42');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Asus', 'asus', 'active', '2025-11-21 03:05:51', '2025-11-21 03:05:51'),
(2, 'Lenovo', 'lenovo', 'active', '2025-11-22 17:22:05', '2025-11-22 17:22:05'),
(3, 'MSI', 'msi', 'active', '2025-11-22 17:22:17', '2025-11-22 17:22:17'),
(4, 'Samsung', 'samsung', 'active', '2025-11-22 17:22:39', '2025-11-22 17:22:39'),
(5, 'Seagate', 'seagate', 'active', '2025-11-22 17:22:59', '2025-11-22 17:22:59'),
(6, 'Logitech', 'logitech', 'active', '2025-11-22 18:39:54', '2025-11-22 18:39:54'),
(7, 'Kingston', 'kingston', 'active', '2025-11-22 20:56:44', '2025-11-22 20:56:44');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(25,3) NOT NULL,
  `status` enum('new','progress','delivered','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int NOT NULL,
  `amount` double(25,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 3, 1.900, 'new', 1, 2.000, '2025-11-21 03:56:25', '2025-11-21 03:57:34'),
(3, 1, 2, 1, 142500.000, 'new', 1, 142500.000, '2025-11-21 07:41:13', '2025-11-21 07:45:33'),
(4, 2, 3, 1, 11440000.000, 'new', 1, 11440000.000, '2025-11-21 09:05:01', '2025-11-21 09:08:19'),
(5, 1, 3, 1, 142500.000, 'new', 1, 142500.000, '2025-11-21 09:05:10', '2025-11-21 09:08:19'),
(6, 2, 4, 1, 11440000.000, 'new', 1, 11440000.000, '2025-11-21 09:12:21', '2025-11-21 09:21:59'),
(7, 1, 5, 1, 142500.000, 'new', 2, 285000.000, '2025-11-21 09:23:27', '2025-11-21 09:24:24'),
(8, 2, 6, 1, 11440000.000, 'new', 1, 11440000.000, '2025-11-21 09:29:40', '2025-11-21 09:33:46'),
(9, 1, 7, 1, 142500.000, 'new', 1, 142500.000, '2025-11-21 09:34:17', '2025-11-21 09:35:42'),
(11, 6, 8, 1, 9600000.000, 'new', 1, 9600000.000, '2025-11-22 20:38:20', '2025-11-22 20:39:56'),
(12, 9, 8, 1, 1275000.000, 'new', 1, 1275000.000, '2025-11-22 20:38:32', '2025-11-22 20:39:56'),
(13, 9, 9, 1, 1275000.000, 'new', 1, 1275000.000, '2025-11-23 04:09:51', '2025-11-23 04:35:42');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `added_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mouse', 'mouse', NULL, NULL, 0, 11, NULL, 'active', '2025-11-21 03:05:36', '2025-11-22 18:57:36'),
(2, 'Laptop', 'laptop', '<p>Portabilitas</p>', NULL, 1, NULL, NULL, 'active', '2025-11-21 08:46:06', '2025-11-21 08:46:06'),
(3, 'Keyboard', 'keyboard', '<p>Keyboard</p>', NULL, 0, 11, NULL, 'active', '2025-11-22 17:20:43', '2025-11-22 18:58:44'),
(4, 'Penyimpanan', 'penyimpanan', NULL, NULL, 1, NULL, NULL, 'active', '2025-11-22 17:21:21', '2025-11-22 17:21:21'),
(5, 'SSD', 'ssd', NULL, NULL, 0, 4, NULL, 'active', '2025-11-22 17:21:36', '2025-11-22 17:21:36'),
(6, 'HDD', 'hdd', NULL, NULL, 0, 4, NULL, 'active', '2025-11-22 17:21:51', '2025-11-22 17:21:51'),
(7, 'Komponen PC', 'komponen-pc', NULL, NULL, 1, NULL, NULL, 'active', '2025-11-22 18:55:02', '2025-11-22 18:55:02'),
(8, 'CPU', 'cpu', NULL, NULL, 0, 7, NULL, 'active', '2025-11-22 18:55:19', '2025-11-22 18:55:57'),
(9, 'Graphic Card', 'graphic-card', NULL, NULL, 0, 7, NULL, 'active', '2025-11-22 18:55:31', '2025-11-22 18:56:09'),
(10, 'RAM', 'ram', NULL, NULL, 0, 7, NULL, 'active', '2025-11-22 18:56:24', '2025-11-22 18:56:24'),
(11, 'Peripheral', 'peripheral', NULL, NULL, 1, NULL, NULL, 'active', '2025-11-22 18:56:51', '2025-11-22 18:56:51'),
(12, 'Headset', 'headset', NULL, NULL, 0, 11, NULL, 'active', '2025-11-22 20:55:12', '2025-11-22 20:55:12');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'fixed', 300.00, 'active', NULL, NULL),
(2, '111111', 'percent', 10.00, 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_07_10_021010_create_brands_table', 1),
(6, '2020_07_10_025334_create_banners_table', 1),
(7, '2020_07_10_112147_create_categories_table', 1),
(8, '2020_07_11_063857_create_products_table', 1),
(9, '2020_07_12_073132_create_post_categories_table', 1),
(10, '2020_07_12_073701_create_post_tags_table', 1),
(11, '2020_07_12_083638_create_posts_table', 1),
(12, '2020_07_13_151329_create_messages_table', 1),
(13, '2020_07_14_023748_create_shippings_table', 1),
(14, '2020_07_15_054356_create_orders_table', 1),
(15, '2020_07_15_102626_create_carts_table', 1),
(16, '2020_07_16_041623_create_notifications_table', 1),
(17, '2020_07_16_053240_create_coupons_table', 1),
(18, '2020_07_23_143757_create_wishlists_table', 1),
(19, '2020_07_24_074930_create_product_reviews_table', 1),
(20, '2020_07_24_131727_create_post_comments_table', 1),
(21, '2020_08_01_143408_create_settings_table', 1),
(22, '2023_06_21_164432_create_jobs_table', 1),
(23, '2025_11_21_000000_update_orders_payment_methods', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('4fbad0ef-809d-4a94-a9fb-9be85e813583', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"Rating produk baru!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/adas\",\"fas\":\"fa-star\"}', '2025-11-23 03:49:32', '2025-11-23 03:48:19', '2025-11-23 03:49:32'),
('5bd061c8-c2c9-4f87-84e8-3380a95e45e7', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}', '2025-11-22 20:56:03', '2025-11-22 20:39:56', '2025-11-22 20:56:03'),
('a50ae692-73bb-4b4d-b101-269c069d37c0', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}', '2025-11-23 04:36:07', '2025-11-23 04:35:42', '2025-11-23 04:36:07');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `sub_total` double(25,3) NOT NULL,
  `shipping_id` bigint UNSIGNED DEFAULT NULL,
  `coupon` double(25,3) DEFAULT NULL,
  `total_amount` double(25,3) NOT NULL,
  `quantity` int NOT NULL,
  `payment_method` enum('cod','paypal','bank','dana','gopay') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `bank` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `bank`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(2, 'ORD-XJZUDKHCUM', 1, 142500.000, NULL, NULL, 142500.000, 1, 'cod', NULL, 'unpaid', 'delivered', 'Avianda Nadhif', 'Insani', 'aviandanadhif@gmail.com', '089453234', 'ID', '17610', 'Ngawi', 'Ngawi Barat', '2025-11-21 07:45:31', '2025-11-21 07:46:05'),
(3, 'ORD-VRPMIQFBVQ', 1, 11582500.000, NULL, NULL, 11582500.000, 2, 'cod', NULL, 'unpaid', 'new', 'Avianda Nadhif', 'Insani', 'aviandanadhif25@gmail.com', '0895350711942', 'ID', '17610', 'Ngawi', 'Ngawi Barat', '2025-11-21 09:08:19', '2025-11-21 09:08:19'),
(4, 'ORD-PISGZMXOFH', 1, 11440000.000, NULL, NULL, 11440000.000, 1, 'cod', NULL, 'unpaid', 'new', 'Avianda Nadhif', 'Insani', 'aviandanadhif@gmail.com', '089523907605', 'ID', '17610', 'Ngawi', 'Ngawi Timur', '2025-11-21 09:21:59', '2025-11-21 09:21:59'),
(5, 'ORD-RLONAYAQMO', 1, 285000.000, NULL, NULL, 285000.000, 2, 'cod', NULL, 'unpaid', 'new', 'Herzan', 'Insani', 'herzan@gmail.com', '43124142142', 'ID', '17610', 'Ngawi', 'Ngawi Timur', '2025-11-21 09:24:24', '2025-11-21 09:24:24'),
(6, 'ORD-ER6PHNLUZY', 1, 11440000.000, NULL, NULL, 11440000.000, 1, 'dana', NULL, 'unpaid', 'new', 'Adit', 'Nadhif', 'JawaScript@gmail.com', '32534654', 'ID', '17610', 'Ngawi', 'Ngawi Timur', '2025-11-21 09:33:46', '2025-11-21 09:33:46'),
(7, 'ORD-UNJWD4W959', 1, 142500.000, NULL, NULL, 142500.000, 1, 'bank', 'bni', 'unpaid', 'new', 'Chito', 'Yuuri', 'chito@gmail.com', '0606060606', 'ID', '17610', 'Ngawi', 'Ngawi Utara', '2025-11-21 09:35:42', '2025-11-21 09:35:42'),
(8, 'ORD-2X4VOWA4IE', 1, 10875000.000, NULL, NULL, 10875000.000, 2, 'gopay', NULL, 'unpaid', 'new', 'Kanazawa', 'Ishii', 'kanazawa@gmail.com', '089343235432', 'ID', '12653', 'Jakarta', 'Jakarta Barat', '2025-11-22 20:39:55', '2025-11-22 20:39:55'),
(9, 'ORD-BJZ3RAWM7Y', 1, 1275000.000, NULL, NULL, 1275000.000, 1, 'bank', 'cimb', 'unpaid', 'new', 'Kanazawa', 'Insani', 'kanazawa@gmail.com', '07656446435', 'ID', '12653', 'Jakarta', 'Jakarta Barat', '2025-11-23 04:35:42', '2025-11-23 04:35:42');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int NOT NULL DEFAULT '1',
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(25,3) NOT NULL,
  `discount` double(25,3) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint UNSIGNED DEFAULT NULL,
  `brand_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'ASUS Wireless Silent Mouse MW103', 'adas', '<p class=\"ds-markdown-paragraph\" style=\"margin: 16px 0px;\">ASUS Wireless Silent Mouse MW103 adalah mouse nirkabel yang dirancang untuk kenyamanan portabilitas maksimal. Mouse ini menawarkan desain yang ramping, klik yang senyap, dan bentuk yang dapat digunakan baik oleh pengguna tangan kanan maupun kiri (ambidextrous). Dengan DPI yang dapat disesuaikan hingga 1.600, mouse ini cocok untuk penggunaan sehari-hari di rumah atau kantor.</p><div bis_skin_checked=\"1\"><br></div>', '<p class=\"ds-markdown-paragraph\" style=\"margin: 16px 0px;\">Mouse ini menggabungkan faktor bentuk minimalis dengan fitur-fitur praktis:</p><ul style=\"margin: 16px 0px; padding-left: 18px;\"><li style=\"\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Portabel:&nbsp;Ukurannya yang minimalis membuatnya mudah dibawa ke mana saja.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Senyap:&nbsp;Teknologi klik senyap mengurangi kebisingan, ideal untuk lingkungan yang tenang seperti perpustakaan, ruang rapat, atau penggunaan di malam hari.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Fleksibel:&nbsp;Bentuk ambidextrous yang simetris membuatnya nyaman digunakan baik dengan tangan kanan maupun kiri.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Dapat Disesuaikan:&nbsp;Tombol DPI memungkinkan Anda mengatur sensitivitas kursor hingga 1.600 DPI untuk presisi yang lebih baik pada berbagai tugas.</p></li></ul>', '/storage/photos/1/asus_wireless_silent_mouse_mw103.png', 4, '', 'new', 'active', 150000.000, 5.000, 1, 11, 1, 1, '2025-11-21 03:08:10', '2025-11-22 20:23:11'),
(2, 'ASUS Vivobook Gaming K16 K3605VC-I535B1T (16/512)', 'asus-vivobook-gaming-k16-k3605vc-i535b1t', '<p>ASUS Vivobook Gaming K16 (K3605VC-I535B1T) adalah laptop yang dirancang untuk memenuhi kebutuhan gaming dan produktivitas sehari-hari. Laptop ini ditenagai oleh prosesor Intel Core i5 generasi ke-13 dan kartu grafis NVIDIA GeForce RTX 3050, yang menjamin performa yang solid untuk berbagai aplikasi dan game. Dilengkapi dengan layar 16 inci, SSD berkapasitas besar, serta garansi resmi 2 tahun, laptop ini menawarkan paket lengkap yang disertai gratis tas backpack.</p>', '<p class=\"ds-markdown-paragraph\" style=\"margin: 16px 0px;\">Laptop ini menggabungkan performa gaming dengan desain yang praktis untuk penggunaan sehari-hari. Berikut adalah spesifikasi dan fitur utamanya:</p><ul style=\"margin: 16px 0px; padding-left: 18px;\"><li style=\"\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Performa Tinggi:&nbsp;Ditenagai oleh&nbsp;Intel Core i5-13420H&nbsp;dan kartu grafis diskrit&nbsp;NVIDIA GeForce RTX 3050 4GB, yang mampu menangani tugas-tugas berat seperti editing, desain, dan gaming.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Memori dan Penyimpanan Cepat:&nbsp;Dilengkapi dengan&nbsp;RAM 8GB DDR4&nbsp;dan&nbsp;SSD 512GB&nbsp;untuk waktu booting yang cepat dan loading aplikasi yang responsif.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Layar Luas dan Jernih:&nbsp;Memiliki layar&nbsp;16 inci&nbsp;dengan resolusi&nbsp;WUXGA (1920 x 1200)&nbsp;yang memberikan ruang kerja yang luas dan visual yang tajam.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Sistem Operasi dan Software:&nbsp;Sudah termasuk sistem operasi&nbsp;Windows 11 Home&nbsp;serta Microsoft 365 untuk mendukung produktivitas langsung dari awal.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Kepastian dan Keamanan:&nbsp;Produk ini adalah&nbsp;original dengan garansi resmi 2 tahun, memberikan jaminan dan rasa aman bagi pembeli.</p></li></ul>', '/storage/photos/1/asus-gaming-k16-k3605vc-i535b1t.png', 7, '', 'hot', 'active', 13000000.000, 12.000, 1, 2, NULL, 1, '2025-11-21 08:47:26', '2025-11-22 18:01:00'),
(3, 'Harddisk Eksternal Seagate 1TB', 'harddisk-seagate-1tb', '<p>Basic Drive adalah HDD (Hard Disk Drive) eksternal yang menawarkan solusi penyimpanan data yang praktis dan portabel. Produk ini dilengkapi dengan sertifikasi&nbsp;MFi (Made for iPhone/iPad/iPod)&nbsp;yang menjamin kompatibilitas dan keamanan saat digunakan dengan perangkat Apple. Dengan garansi resmi yang panjang hingga 3 tahun, produk ini dirancang untuk kebutuhan penyimpanan dasar yang andal.</p>', '<p class=\"ds-markdown-paragraph\" style=\"margin: 16px 0px;\">HDD eksternal ini cocok untuk menambah kapasitas penyimpanan perangkat Anda dengan mudah. Fitur utamanya meliputi:</p><ul style=\"margin: 16px 0px; padding-left: 18px;\"><li style=\"\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Kompatibilitas Tinggi:&nbsp;Memiliki sertifikasi&nbsp;MFi, yang memastikan koneksi dan kinerja yang optimal dengan perangkat Apple seperti iPhone, iPad, dan iPod tanpa masalah.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Kapasitas Luas:&nbsp;Tersedia dalam berbagai pilihan kapasitas untuk menyimpan berbagai file, seperti dokumen, foto, musik, dan video.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Keandalan Jangka Panjang:&nbsp;Dukungan&nbsp;garansi resmi 3 tahun&nbsp;memberikan jaminan kualitas dan ketahanan produk.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Sederhana dan Mudah Digunakan:&nbsp;Desain \"plug-and-play\" memudahkan penggunaan tanpa instalasi yang rumit, ideal untuk pengguna umum.</p></li></ul>', '/storage/photos/1/id-11134207-7rbk0-m9p9y3ej7mfyec.jpg', 10, '', 'default', 'active', 1300000.000, 0.000, 1, 4, 6, 5, '2025-11-22 17:27:36', '2025-11-22 17:51:14'),
(4, 'SAMSUNG SSD 980 NVMe M.2 500GB', 'samsung-ssd-980-nvme-m2-500gb', '<p>SAMSUNG SSD 980 adalah Solid State Drive (SSD) berperforma tinggi dengan antarmuka NVMe PCIe 3.0. Dirancang untuk pengguna yang membutuhkan kecepatan transfer data yang sangat cepat hingga 3.500 MB/s, SSD ini sangat cocok untuk meningkatkan responsivitas sistem, mempercepat waktu loading game, dan memperlancar tugas-tugas berat seperti editing video.</p>', '<p class=\"ds-markdown-paragraph\" style=\"margin: 16px 0px;\">SSD ini menawarkan peningkatan performa yang signifikan dibandingkan SSD SATA atau HDD tradisional. Berikut adalah fitur dan spesifikasi utamanya:</p><ul style=\"margin: 16px 0px; padding-left: 18px;\"><li style=\"\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Kecepatan Baca Tinggi:&nbsp;Mengusung kecepatan baca berurutan hingga&nbsp;3.500 MB/s, yang memungkinkan transfer data yang sangat cepat dan loading aplikasi serta game dalam hitungan detik.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Antarmuka Modern:&nbsp;Menggunakan antarmuka&nbsp;NVMe PCIe 3.0&nbsp;yang memaksimalkan bandwidth untuk performa terbaik di kelasnya.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Tanpa DRAM (DRAM-less):&nbsp;Desain yang efisien namun tetap powerful, menggunakan memori flash NVMe dan teknologi Intelligent TurboWrite untuk mengoptimalkan kecepatan.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Solusi Peningkatan yang Ideal:&nbsp;Cocok untuk ditingkatkan pada laptop dan PC desktop gaming atau profesional yang membutuhkan penyimpanan cepat.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Keandalan Merek:&nbsp;Dibuat oleh Samsung, merek terkemuka dalam industri memori, yang menjamin kualitas dan daya tahan.</p></li></ul>', '/storage/photos/1/5089567a7fe57bacde0598cc27fc518f.png_720x720q80.png', 7, '', 'hot', 'active', 800000.000, 0.000, 1, 4, 5, 4, '2025-11-22 17:54:04', '2025-11-22 17:54:04'),
(5, 'ASUS Vivobook Go 14 E1404 AMD Ryzen™ 3 7320U (8/512)', 'asus-vivobook-go-14-e1404-amd-ryzen-3-7320u-8512', '<p>ASUS Vivobook Go 14 (E1404) adalah laptop ringkas berukuran 14 inci yang dirancang untuk mobilitas tinggi dan produktivitas sehari-hari. Ditenagai oleh prosesor AMD Ryzen™ 3 7320U, laptop ini menawarkan performa yang efisien untuk tugas-tugas seperti bekerja, belajar, dan browsing. Nilai tambah yang signifikan adalah inklusi Microsoft Office Home &amp; Student 2021 yang sah dan manfaat garansi tambahan, menjadikannya paket yang siap pakai langsung.</p>', '<p class=\"ds-markdown-paragraph\" style=\"margin: 16px 0px;\">Laptop ini menekankan portabilitas dan kelengkapan fitur untuk mendukung aktivitas pengguna yang selalu berpindah:</p><ul style=\"margin: 16px 0px; padding-left: 18px;\"><li style=\"\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Portabel dan Produktif:&nbsp;Ukuran 14 inci yang ringkas dan ringan membuatnya mudah dibawa ke mana saja, sesuai tagline \"Productivity on the Go\".</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Performa Efisien:&nbsp;Ditenagai oleh&nbsp;prosesor AMD Ryzen™ 3 7320U&nbsp;(dari seri 7000U) yang menyeimbangkan kinerja dan konsumsi daya baterai.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Siap Pakai Langsung:&nbsp;Sudah termasuk lisensi&nbsp;Microsoft Office Home &amp; Student 2021&nbsp;(senilai Rp 1.799.000) untuk kebutuhan yang langsung produktif.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Perlindungan Tambahan:&nbsp;Dilengkapi dengan&nbsp;Garansi Perlindungan Kerusakan Kecelakaan selama 1 tahun, yang merupakan benefit langka yang melindungi dari kerusakan tak terduga.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Masa Garansi yang Diperpanjang:&nbsp;Mendapatkan&nbsp;tambahan garansi 6 bulan&nbsp;di samping garansi standar, menunjukkan komitmen ASUS terhadap kualitas produk.</p></li></ul>', '/storage/photos/1/ASUS-Vivobook-Go-14-E1404-Green-Grey-AMD-Ryzen™-3-7000U.jpg', 9, '', 'default', 'active', 6500000.000, 7.000, 0, 2, NULL, 1, '2025-11-22 18:06:49', '2025-11-22 18:13:24'),
(6, 'Lenovo LOQ 15 (12/512)', 'lenovo-loq-15-12512', '<p>Lenovo LOQ 15 adalah laptop gaming entry-level hingga mid-range yang dirancang untuk menangani game-game populer dan tugas multitasking dengan baik. Laptop ini menawarkan spesifikasi yang seimbang dengan prosesor Intel Core, kartu grafis NVIDIA GeForce, RAM 12GB, dan SSD berkapasitas 512GB, semuanya dibungkus dalam layar 15.6 inci yang mendukung pengalaman gaming yang imersif.</p>', '<p class=\"ds-markdown-paragraph\" style=\"margin: 16px 0px;\">Laptop gaming ini menghadirkan kombinasi komponen yang solid untuk performa gaming dan produktivitas:</p><ul style=\"margin: 16px 0px; padding-left: 18px;\"><li style=\"\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Performa Gaming:&nbsp;Dilengkapi dengan&nbsp;kartu grafis NVIDIA GeForce&nbsp;(seri RTX 3050 atau seri sejenisnya) yang mampu menjalankan berbagai game modern dengan setting menengah hingga tinggi.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Prosesor Kuat:&nbsp;Menggunakan&nbsp;prosesor Intel Core&nbsp;(generasi terkini seperti i5-13420H atau i5-12450H) untuk menangani komputasi game dan aplikasi dengan lancar.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Memori dan Penyimpanan Cepat:&nbsp;Konfigurasi&nbsp;RAM 12GB&nbsp;memungkinkan multitasking yang smooth, sementara&nbsp;SSD 512GB&nbsp;memastikan waktu booting dan loading game yang cepat.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Layar Gaming FHD:&nbsp;Layar&nbsp;15.6 inci&nbsp;dengan resolusi&nbsp;Full HD (1920x1080)&nbsp;menampilkan visual game yang jernih dan detail.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Sistem Operasi Siap Pakai:&nbsp;Sudah dilengkapi dengan&nbsp;Windows 11&nbsp;dan Microsoft Office (OHS), siap digunakan langsung setelah pembelian.</p></li></ul>', '/storage/photos/1/id-11134207-7rasd-m3erjvnjnd006a.jpg', 9, '', 'hot', 'active', 12000000.000, 20.000, 1, 2, NULL, 2, '2025-11-22 18:18:32', '2025-11-22 18:18:32'),
(7, 'MSI FORGE GK100 Wired Gaming Keyboard', 'msi-forge-gk100-wired-gaming-keyboard', '<p>MSI FORGE GK100 adalah keyboard gaming wired berdesain full-size yang menawarkan pengalaman mengetik dan gaming yang nyaman dengan fitur pencahayaan RGB. Keyboard ini menggunakan switch membran yang tahan lama dengan umur tekan hingga 10 juta kali, menjadikannya pilihan yang solid untuk gamers dengan budget terbatas yang menginginkan keyboard dari merek ternama.</p>', '<p class=\"ds-markdown-paragraph\" style=\"margin: 16px 0px;\">Keyboard ini menghadirkan fitur-fitur esensial untuk gaming dalam paket yang andal dan terjangkau:</p><ul style=\"margin: 16px 0px; padding-left: 18px;\"><li style=\"\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Daya Tahan Tinggi:&nbsp;Switch membran dirancang untuk bertahan hingga&nbsp;10 juta kali tekan, menjamin umur pakai yang panjang.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Estetika Gaming:&nbsp;Dilengkapi dengan&nbsp;lampu belakang RGB&nbsp;yang dapat menciptakan atmosfer gaming yang hidup (biasanya dengan beberapa mode pencahayaan).</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Desain Lengkap:&nbsp;Memiliki tata letak&nbsp;full-size 104/105/108 key, termasuk numpad, yang cocok untuk berbagai kebutuhan baik gaming maupun produktivitas.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Konektivitas Sederhana:&nbsp;Menggunakan koneksi&nbsp;USB wired&nbsp;dengan panjang kabel&nbsp;1.5 meter, memastikan koneksi yang stabil dan bebas lag.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Jaminan Kepastian:&nbsp;Dilengkapi dengan&nbsp;garansi 1 tahun&nbsp;dari MSI.</p></li></ul>', '/storage/photos/1/xEkvY8JJEtc6DNWGTkLVxp5PeOA1U2KoDXRUyLlY.jpg', 20, '', 'default', 'active', 500000.000, 30.000, 1, 11, 3, 3, '2025-11-22 18:25:06', '2025-11-22 20:23:52'),
(8, 'MSI Thin 15 (16/512)', 'msi-thin-15-16512', '<p>MSI Thin 15 adalah laptop gaming performa tinggi yang dirancang untuk memberikan pengalaman gaming yang mulus dan imersif. Laptop ini ditenagai oleh kombinasi prosesor Intel Core i7-13620H dan kartu grafis NVIDIA GeForce RTX 4050, dilengkapi dengan layar 15.6 inci berrefresh rate 144Hz. Dengan spesifikasi yang powerful, laptop ini ditargetkan untuk gamers yang menginginkan performa di atas rata-rata untuk menjalankan game-game terbaru.</p>', '<p class=\"ds-markdown-paragraph\" style=\"margin: 16px 0px;\">Laptop ini menawarkan spesifikasi unggulan di berbagai aspek untuk mendukung hobi gaming dan kreasi konten:</p><ul style=\"margin: 16px 0px; padding-left: 18px;\"><li style=\"\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Performa Gaming Unggul:&nbsp;Ditenagai oleh&nbsp;Intel Core i7-13620H&nbsp;dan&nbsp;NVIDIA GeForce RTX 4050 (6GB GDDR6), yang mampu menjalankan game-game modern dengan setting tinggi dan ray tracing.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Layar Gaming yang Responsif:&nbsp;Layar&nbsp;15.6 inci&nbsp;dengan&nbsp;refresh rate 144Hz&nbsp;dan bezel tipis memastikan gameplay yang halus, tanpa tearing, dan visual yang imersif.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Kualitas Audio yang Jernih:&nbsp;Dilengkapi dengan teknologi&nbsp;Hi-Res Audio&nbsp;untuk kualitas suara yang detail dan jernih, baik untuk gaming maupun menonton film.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Perangkat Lunak Pendukung:&nbsp;Memiliki&nbsp;MSI Center&nbsp;yang memungkinkan pengguna mengoptimalkan performa, mengatur pencahayaan, dan memantau sistem dengan mudah.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Desain Gaming:&nbsp;Desain dengan sentuhan gaming pada bagian tutup (cover) dan keyboard (terlihat dari highlight pada tombol WASD).</p></li></ul>', '/storage/photos/1/id-11134207-7r98r-lt3kblkvaq2hb4.jpg', 5, '', 'hot', 'active', 18000000.000, 25.000, 1, 2, NULL, 3, '2025-11-22 18:31:51', '2025-11-22 18:31:51'),
(9, 'Seagate Baracuda Q5 M.2 NVMe SSD 1TB', 'baracuda-q5-m2-nvme-ssd-1tb', '<p class=\"ds-markdown-paragraph\" style=\"margin: 16px 0px;\">Baracuda Q5 adalah SSD berjenis M.2 NVMe dengan kapasitas 1 TB yang menawarkan peningkatan kecepatan yang signifikan dibandingkan SSD SATA biasa. Dengan kecepatan baca/tulis hingga 2400/1700 MB/s dan garansi 3 tahun, SSD ini menjadi pilihan yang andal untuk meningkatkan performa penyimpanan pada PC atau laptop.</p>', '<p class=\"ds-markdown-paragraph\" style=\"margin: 16px 0px;\">SSD ini dirancang untuk memberikan performa tinggi dengan harga yang terjangkau. Berikut adalah fitur dan spesifikasi utamanya:</p><ul style=\"margin: 16px 0px; padding-left: 18px;\"><li style=\"\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Kapasitas Besar:&nbsp;Tersedia dalam pilihan&nbsp;kapasitas 1 TB&nbsp;yang cocok untuk menyimpan sistem operasi, aplikasi, game, dan file besar.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Kecepatan Tinggi:&nbsp;Menggunakan antarmuka&nbsp;NVMe PCIe Gen3 x4&nbsp;dengan kecepatan baca hingga&nbsp;2400 MB/s&nbsp;dan tulis hingga&nbsp;1700 MB/s&nbsp;untuk mempercepat booting, loading aplikasi, dan transfer data.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Form Factor Standar:&nbsp;Berukuran&nbsp;M.2 2280&nbsp;yang kompatibel dengan sebagian besar motherboard dan laptop modern.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Garansi Panjang:&nbsp;Dilengkapi dengan&nbsp;garansi resmi 3 tahun&nbsp;yang memberikan jaminan keamanan dan kualitas produk.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Merek Terpercaya:&nbsp;Baracuda merupakan merek aksesori komputer yang telah dikenal di Indonesia.</p></li></ul>', '/storage/photos/1/id-11134207-7qula-lj3wjb3f0an29f.jpg', 3, '', 'hot', 'active', 1500000.000, 15.000, 1, 4, 5, 5, '2025-11-22 18:36:10', '2025-11-22 18:38:13'),
(10, 'Logitech G502 HERO High Performance Gaming Mouse', 'logitech-g502-hero-high-performance-gaming-mouse', '<p>Logitech G502 HERO adalah mouse gaming berperforma tinggi yang terkenal dengan sensor canggih dan desain yang dapat disesuaikan. Mouse ini dilengkapi dengan sensor HERO yang dapat mencapai DPI hingga 25.600, berat yang dapat dikonfigurasi, dan lampu RGB yang dapat dipersonalisasi, menjadikannya pilihan populer di kalangan gamer dan pengguna profesional.</p>', '<p class=\"ds-markdown-paragraph\" style=\"margin: 16px 0px;\">Mouse ini menawarkan berbagai fitur canggih untuk gaming dan produktivitas:</p><ul style=\"margin: 16px 0px; padding-left: 18px;\"><li style=\"\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Sensor HERO Canggih:&nbsp;Sensor HERO (High-Efficiency Rated Optical) memberikan pelacakan yang sangat akurat dengan sensitivitas hingga&nbsp;25.600 DPI, tanpa smoothing, filtering, atau akselerasi.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Bobot yang Dapat Disesuaikan:&nbsp;Dilengkapi dengan sistem pemberat yang dapat dilepas, memungkinkan pengguna menyesuaikan berat dan pusat gravitasi mouse sesuai preferensi.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">11 Tombol yang Dapat Diprogram:&nbsp;Semua tombol dapat diprogram dan dikustomisasi dengan perangkat lunak Logitech G HUB untuk makro atau perintah kompleks.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Ideal untuk Gaming:&nbsp;Dirancang khusus untuk gaming dengan performa tinggi dan fitur yang mendukung berbagai genre game.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Bahan Berkualitas:&nbsp;Terbuat dari bahan berkualitas tinggi yang tahan lama dan nyaman digunakan dalam jangka panjang.</p></li></ul>', '/storage/photos/1/Logitech-G502-HERO-RGB-Profesional-Gaming-Mouse-25600DPI-Mouse-Pemrograman-Cahaya-Dapat-Disesuaikan-Sinkronisasi-untuk-Mouse.jpg_Q90.jpg_.jpg', 50, '', 'default', 'active', 750000.000, NULL, 1, 11, 1, 6, '2025-11-22 18:43:57', '2025-11-22 20:24:48'),
(11, 'Logitech G913 TKL LIGHTSPEED Wireless RGB Mechanical Gaming Keyboard', 'logitech-g913-tkl-lightspeed-wireless-rgb-mechanical-gaming-keyboard', '<p>Logitech G913 TKL adalah keyboard gaming mekanis flagship yang menawarkan desain tenkeyless (tanpa numpad) untuk ruang gerak mouse yang lebih luas. Keyboard ini dilengkapi dengan switch mekanis GL yang responsif dan berumur panjang, serta fitur konektivitas Lightspeed wireless dan RGB lighting yang dapat dikustomisasi, menjadikannya pilihan premium bagi para gamer yang mengutamakan performa dan estetika.</p>', '<p class=\"ds-markdown-paragraph\" style=\"margin: 16px 0px;\">Keyboard ini menghadirkan berbagai fitur canggih untuk pengalaman gaming yang optimal:</p><ul style=\"margin: 16px 0px; padding-left: 18px;\"><li style=\"\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Desain Tenkeyless (TKL):&nbsp;Layout yang ringkas tanpa numpad menghemat ruang di meja dan memberikan lebih banyak area untuk pergerakan mouse.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Switch Mekanis GL:&nbsp;Menggunakan switch mekanis berkualitas tinggi (GL Tactile, GL Clicky, atau GL Linear) yang responsif, tahan lama (70 juta kali tekan), dan rendah profil.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Konektivitas Ganda:&nbsp;Mendukung koneksi&nbsp;Lightspeed Wireless&nbsp;(latenci 1ms) dan&nbsp;Bluetooth, memungkinkan fleksibilitas penggunaan dan penghematan port USB.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">RGB Lighting LIGHTSYNC:&nbsp;Lampu RGB individu yang dapat disesuaikan dan disinkronkan dengan game atau konten lain melalui perangkat lunak Logitech G HUB.</p></li><li style=\"margin-top: 6px;\"><p class=\"ds-markdown-paragraph\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Bahan Premium &amp; Baterai Tahan Lama:&nbsp;Konstruksi aluminium yang ringan dan kokoh, dengan masa pakai baterai hingga 40 jam (dengan lighting dimatikan).</p></li></ul>', '/storage/photos/1/5f83a6c96facbfed0142f3f95ec35376.jpg_720x720q80.jpg', 14, '', 'hot', 'active', 2300000.000, NULL, 0, 11, 3, 6, '2025-11-22 18:54:06', '2025-11-22 20:25:28');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `rate` tinyint NOT NULL DEFAULT '0',
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, 'Tes', 'active', '2025-11-23 03:48:19', '2025-11-23 03:48:19');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, '<p class=\"ds-markdown-paragraph\" style=\"margin: 16px 0px;\">Zyntech Enterprises: Level Up Your Game.</p><p class=\"ds-markdown-paragraph\" style=\"margin: 16px 0px;\">Penyedia perlengkapan gaming terpercaya untuk menghadirkan kemenangan. Dari mouse yang gesit hingga keyboard yang responsif, kami menyediakan gear yang membedakan antara player dan champion.</p>', '\"Surga bagi Gamer. Temukan gamer impian Anda di tengah suasana yang mencekam.\"', 'logo.jpg', '/storage/photos/1/logo-removebg-preview.png', 'Jalan Ngawi Merdeka No. 69', '+62 895-3507-11942', 'JawaScript@gmail.com', NULL, '2025-11-20 09:25:50');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$aNtskSBv6dfl3b3FUjOLneJeWOMpsa/OZ4xazkCyTZRJCT7ArfUwq', '/storage/photos/1/_(__girlslasttour____doodle__illustration__shoujo__manga__art__sketch__cute_.JPG', 'admin', NULL, NULL, 'active', NULL, NULL, '2025-11-21 14:49:52'),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$tyT06/GKAqnIlfqPjlYRxOfKfk6tXinufHacMRSvkCAHCKUk8YVym', NULL, 'user', NULL, NULL, 'active', NULL, NULL, NULL),
(3, 'Herzan', 'herzan@gmail.com', NULL, '$2y$10$OYgqovnMigHr.rZ1kAQCB.1wd0LpjFK0xONp/6HpgtnoZq.7LB9le', NULL, 'user', NULL, NULL, 'active', NULL, '2025-11-21 00:44:26', '2025-11-21 00:44:26'),
(4, 'Avianda Nadhif Insani', 'aviandanadhif@gmail.com', NULL, '$2y$10$qq1661BzI7GMuH5Hg2lveufTuUN422efvTKfB5pWGcaNf.oRh4bBa', NULL, 'user', NULL, NULL, 'active', NULL, '2025-11-21 00:58:42', '2025-11-21 00:58:42'),
(5, 'Chito', 'chito@gmail.com', NULL, '$2y$10$YTNlXh.yyUuVBo1vgeyDUeRBOurMtNSWBr8MMwS9CzLCtJE3alNA2', NULL, 'user', NULL, NULL, 'active', NULL, '2025-11-23 03:52:14', '2025-11-23 03:52:14');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(25,3) NOT NULL,
  `quantity` int NOT NULL,
  `amount` double(25,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 1, 142500.000, 1, 142500.000, '2025-11-21 07:41:22', '2025-11-21 09:05:01'),
(2, 2, 11, 1, 11440000.000, 1, 11440000.000, '2025-11-22 20:36:27', '2025-11-22 20:38:20'),
(3, 3, 11, 1, 1300000.000, 1, 1300000.000, '2025-11-22 20:37:51', '2025-11-22 20:38:20'),
(4, 9, NULL, 1, 1275000.000, 1, 1275000.000, '2025-11-23 04:10:02', '2025-11-23 04:10:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
