-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2021 at 01:16 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keysel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `them` tinyint(2) NOT NULL DEFAULT 1,
  `is_login` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=online 0=offline',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `image`, `email`, `country_id`, `email_verified_at`, `password`, `phone`, `remember_token`, `address`, `them`, `is_login`, `created_at`, `updated_at`) VALUES
(2, 'عغنتلاتن', 'admins/1612985829.jpg', 'muhammadelsha4khs@yahoo.com', 12, NULL, '$2y$10$boMXabVc6.4Hs6UHcL3PR.9yDluOJwhsGJGGgGbplmaMtTJYfqMm.', '5475687', NULL, NULL, 1, 0, '2021-02-10 17:37:09', '2021-02-26 10:15:05'),
(5, 'fhgfchyhy', 'admins/1613076326.jpg', 'muhammaddddelshssa4khs@yahoo.com', 0, NULL, '$2y$10$THRMrSPHG9UnAPmwRbh6.eA9qBlCfamV1O6IDogiXTtCtJ6P2rCiC', '5756866', NULL, NULL, 1, 0, '2021-02-11 18:45:26', '2021-02-11 18:45:26');

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ar_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `en_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ar_des` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `en_des` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` double NOT NULL DEFAULT 0,
  `latitude` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  `is_special` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `start_at` bigint(20) DEFAULT NULL,
  `end_at` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `ar_title`, `en_title`, `image`, `video`, `ar_des`, `en_des`, `address`, `longitude`, `latitude`, `price`, `level`, `is_special`, `is_active`, `start_at`, `end_at`, `category_id`, `user_id`, `city_id`, `country_id`, `created_at`, `updated_at`) VALUES
(2, 'اثاث مكتبي فاخر باسعار مناسبه جدا', NULL, 'uploads/ads/1614112806.jpg', NULL, 'اثاث مكتبي فاخر باسعار مناسبه جدا والشحن لاي مكان', NULL, NULL, 0, 0, 123, 0, 0, 1, NULL, NULL, 7, 6, NULL, NULL, '2021-02-23 18:40:06', '2021-02-23 18:40:06'),
(3, 'سيارت نقل ثقيل', NULL, 'uploads/ads/1614115436.jpg', NULL, 'سيارت نقل ثقيل ماركات عالميه بحاله ممتازه', NULL, NULL, 0, 0, 1, 0, 1, 1, NULL, NULL, 5, 6, NULL, NULL, '2021-02-23 19:23:56', '2021-02-23 19:23:56'),
(4, 'كميه من الاساس المكتبي', NULL, 'uploads/ads/1614256606.jpg', NULL, 'كميه من الاساس المكتبي  بحاله ممتازه', NULL, NULL, 0, 0, 123, 0, 2, 1, NULL, NULL, NULL, 5, NULL, 68, '2021-02-25 10:36:46', '2021-02-25 10:36:46'),
(5, 'لحوم طازجه', NULL, 'uploads/ads/1614342107.jpg', 'uploads/ads/1614342107.336670590_1840346839593834_2576503561870747705_n.mp4', 'لوحوم طازجه وحيونات حيه', NULL, NULL, 0, 0, 12, 0, 2, 1, NULL, NULL, NULL, 5, NULL, 68, '2021-02-26 10:21:47', '2021-02-26 10:21:47'),
(8, 'اعلان السليدر الاول', NULL, 'uploads/ads/1615205509.jpg', NULL, 'اعلان للسليدر بعد موافقه المشرف', NULL, NULL, 0, 0, 123, 0, 4, 1, NULL, NULL, NULL, 6, NULL, NULL, '2021-03-08 10:11:49', '2021-03-08 10:12:17'),
(9, 'الاعلان الثاني', NULL, 'uploads/ads/1615205648.jpg', NULL, 'وصصف الاعلان الثاني', NULL, NULL, 0, 0, 12, 0, 4, 1, NULL, NULL, NULL, 6, NULL, NULL, '2021-03-08 10:14:08', '2021-03-08 10:14:39');

-- --------------------------------------------------------

--
-- Table structure for table `ad_images`
--

CREATE TABLE `ad_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ad_id` bigint(20) UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ad_images`
--

INSERT INTO `ad_images` (`id`, `ad_id`, `image`, `created_at`, `updated_at`) VALUES
(34, 2, 'uploads/ads/91591614112806.download (10).jpg', '2021-02-23 18:40:06', '2021-02-23 18:40:06'),
(35, 2, 'uploads/ads/49301614112806.download (11).jpg', '2021-02-23 18:40:06', '2021-02-23 18:40:06'),
(36, 2, 'uploads/ads/38221614112806.download (13).jpg', '2021-02-23 18:40:06', '2021-02-23 18:40:06'),
(37, 3, 'uploads/ads/98701614115436.download (1).jpg', '2021-02-23 19:23:56', '2021-02-23 19:23:56'),
(38, 3, 'uploads/ads/39061614115436.download (2).jpg', '2021-02-23 19:23:56', '2021-02-23 19:23:56'),
(39, 3, 'uploads/ads/42551614115436.download (3).jpg', '2021-02-23 19:23:56', '2021-02-23 19:23:56'),
(40, 3, 'uploads/ads/12151614115437.download (4).jpg', '2021-02-23 19:23:57', '2021-02-23 19:23:57'),
(41, 3, 'uploads/ads/84801614115437.download (5).jpg', '2021-02-23 19:23:57', '2021-02-23 19:23:57'),
(42, 3, 'uploads/ads/44481614115437.download (6).jpg', '2021-02-23 19:23:57', '2021-02-23 19:23:57'),
(43, 3, 'uploads/ads/16141614115437.download (7).jpg', '2021-02-23 19:23:57', '2021-02-23 19:23:57'),
(44, 4, 'uploads/ads/29081614256606.download (13).jpg', '2021-02-25 10:36:46', '2021-02-25 10:36:46'),
(45, 5, 'uploads/ads/12461614342107.download (1).jpg', '2021-02-26 10:21:47', '2021-02-26 10:21:47');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `iban` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `image`, `iban`, `number`, `name`, `bank_name`, `created_at`, `updated_at`) VALUES
(1, 'banks/1589745444.png', '12123456ت م', 'شركة الحمد', 'حساب بنكي', 'بنك العرب', '2020-05-17 17:56:11', '2020-05-17 17:57:24');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ar_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `en_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `ar_title`, `en_title`, `image`, `des`, `level`, `parent_id`, `created_at`, `updated_at`) VALUES
(3, 'سيارات', 'cars', 'uploads/categories/1586379305.jpg', NULL, 0, NULL, '2020-04-08 18:55:05', '2020-04-08 18:55:05'),
(5, 'سيارت', 'cars', 'uploads/categories/1589661881.jpg', NULL, 1, 3, '2020-05-16 18:44:41', '2020-05-16 18:44:41'),
(6, 'اثاث', 'furntuer', 'uploads/categories/1613076721.jpg', NULL, 0, NULL, '2021-02-11 18:52:01', '2021-02-11 18:52:01'),
(7, 'اثاث مكتبي', 'اثاث مكتبي', 'uploads/categories/1614112512.jpg', NULL, 1, 6, '2021-02-23 18:35:12', '2021-02-23 18:35:12');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ar_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `en_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `ar_title`, `en_title`, `country_id`, `created_at`, `updated_at`) VALUES
(1, 'المحلة الكبري', 'elmahal', 1, '2020-03-27 22:00:19', '2020-05-16 19:44:42'),
(2, 'طنطا', 'tanta', 1, '2020-05-16 19:40:41', '2020-05-16 19:40:41');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  `ad_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `level`, `ad_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'comment', 0, 2, 1, '2020-03-30 16:18:49', '2020-03-30 16:18:49'),
(3, 'كويس', 0, 2, 6, '2021-02-26 10:27:48', '2021-02-26 10:27:48');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `phone`, `message`, `created_at`, `updated_at`) VALUES
(2, 'muhammad', 'admin@admin.admin', 'subject', NULL, 'message', '2020-03-28 06:59:07', '2020-03-28 06:59:07'),
(3, 'muhammad', 'admin@admin.admin', NULL, NULL, 'message', '2020-03-28 06:59:32', '2020-03-28 06:59:32');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) NOT NULL,
  `en_title` varchar(100) NOT NULL DEFAULT '',
  `ar_title` varchar(100) NOT NULL DEFAULT '',
  `phone_code` varchar(190) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `country_enNationality` varchar(100) NOT NULL DEFAULT '',
  `country_arNationality` varchar(100) NOT NULL DEFAULT '',
  `flag` varchar(190) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `en_title`, `ar_title`, `phone_code`, `country_id`, `country_enNationality`, `country_arNationality`, `flag`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'أفغانستان', '263', NULL, 'Afghan', 'أفغانستاني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(2, 'Albania', 'ألبانيا', '355', NULL, 'Albanian', 'ألباني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(3, 'Aland Islands', 'جزر آلاند', '213', NULL, 'Aland Islander', 'آلاندي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(4, 'Algeria', 'الجزائر', '1684', NULL, 'Algerian', 'جزائري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(5, 'American Samoa', 'ساموا-الأمريكي', '376', NULL, 'American Samoan', 'أمريكي سامواني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(6, 'Andorra', 'أندورا', '244', NULL, 'Andorran', 'أندوري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(7, 'Angola', 'أنغولا', '1264', NULL, 'Angolan', 'أنقولي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(8, 'Anguilla', 'أنغويلا', '0', NULL, 'Anguillan', 'أنغويلي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(9, 'Antarctica', 'أنتاركتيكا', '1268', NULL, 'Antarctican', 'أنتاركتيكي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(10, 'Antigua and Barbuda', 'أنتيغوا وبربودا', '54', NULL, 'Antiguan', 'بربودي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(11, 'Argentina', 'الأرجنتين', '374', NULL, 'Argentinian', 'أرجنتيني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(12, 'Armenia', 'أرمينيا', '297', NULL, 'Armenian', 'أرميني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(13, 'Aruba', 'أروبه', '61', NULL, 'Aruban', 'أوروبهيني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(14, 'Australia', 'أستراليا', '43', NULL, 'Australian', 'أسترالي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(15, 'Austria', 'النمسا', '994', NULL, 'Austrian', 'نمساوي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(16, 'Azerbaijan', 'أذربيجان', '1242', NULL, 'Azerbaijani', 'أذربيجاني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(17, 'Bahamas', 'الباهاماس', '973', NULL, 'Bahamian', 'باهاميسي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(18, 'Bahrain', 'البحرين', '880', NULL, 'Bahraini', 'بحريني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(19, 'Bangladesh', 'بنغلاديش', '1246', NULL, 'Bangladeshi', 'بنغلاديشي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(20, 'Barbados', 'بربادوس', '375', NULL, 'Barbadian', 'بربادوسي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(21, 'Belarus', 'روسيا البيضاء', '32', NULL, 'Belarusian', 'روسي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(22, 'Belgium', 'بلجيكا', '501', NULL, 'Belgian', 'بلجيكي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(23, 'Belize', 'بيليز', '229', NULL, 'Belizean', 'بيليزي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(24, 'Benin', 'بنين', '1441', NULL, 'Beninese', 'بنيني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(25, 'Saint Barthelemy', 'سان بارتيلمي', '975', NULL, 'Saint Barthelmian', 'سان بارتيلمي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(26, 'Bermuda', 'جزر برمودا', '591', NULL, 'Bermudan', 'برمودي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(27, 'Bhutan', 'بوتان', '387', NULL, 'Bhutanese', 'بوتاني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(28, 'Bolivia', 'بوليفيا', '267', NULL, 'Bolivian', 'بوليفي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(29, 'Bosnia and Herzegovina', 'البوسنة و الهرسك', '0', NULL, 'Bosnian / Herzegovinian', 'بوسني/هرسكي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(30, 'Botswana', 'بوتسوانا', '55', NULL, 'Botswanan', 'بوتسواني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(31, 'Bouvet Island', 'جزيرة بوفيه', '246', NULL, 'Bouvetian', 'بوفيهي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(32, 'Brazil', 'البرازيل', '673', NULL, 'Brazilian', 'برازيلي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(33, 'British Indian Ocean Territory', 'إقليم المحيط الهندي البريطاني', '359', NULL, 'British Indian Ocean Territory', 'إقليم المحيط الهندي البريطاني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(34, 'Brunei Darussalam', 'بروني', '226', NULL, 'Bruneian', 'بروني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(35, 'Bulgaria', 'بلغاريا', '257', NULL, 'Bulgarian', 'بلغاري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(36, 'Burkina Faso', 'بوركينا فاسو', '855', NULL, 'Burkinabe', 'بوركيني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(37, 'Burundi', 'بوروندي', '237', NULL, 'Burundian', 'بورونيدي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(38, 'Cambodia', 'كمبوديا', '1', NULL, 'Cambodian', 'كمبودي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(39, 'Cameroon', 'كاميرون', '238', NULL, 'Cameroonian', 'كاميروني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(40, 'Canada', 'كندا', '1345', NULL, 'Canadian', 'كندي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(41, 'Cape Verde', 'الرأس الأخضر', '236', NULL, 'Cape Verdean', 'الرأس الأخضر', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(42, 'Cayman Islands', 'جزر كايمان', '235', NULL, 'Caymanian', 'كايماني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(43, 'Central African Republic', 'جمهورية أفريقيا الوسطى', '56', NULL, 'Central African', 'أفريقي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(44, 'Chad', 'تشاد', '86', NULL, 'Chadian', 'تشادي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(45, 'Chile', 'شيلي', '61', NULL, 'Chilean', 'شيلي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(46, 'China', 'الصين', '672', NULL, 'Chinese', 'صيني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(47, 'Christmas Island', 'جزيرة عيد الميلاد', '57', NULL, 'Christmas Islander', 'جزيرة عيد الميلاد', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(48, 'Cocos (Keeling) Islands', 'جزر كوكوس', '269', NULL, 'Cocos Islander', 'جزر كوكوس', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(49, 'Colombia', 'كولومبيا', '242', NULL, 'Colombian', 'كولومبي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(50, 'Comoros', 'جزر القمر', '242', NULL, 'Comorian', 'جزر القمر', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(51, 'Congo', 'الكونغو', '682', NULL, 'Congolese', 'كونغي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(52, 'Cook Islands', 'جزر كوك', '506', NULL, 'Cook Islander', 'جزر كوك', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(53, 'Costa Rica', 'كوستاريكا', '225', NULL, 'Costa Rican', 'كوستاريكي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(54, 'Croatia', 'كرواتيا', '385', NULL, 'Croatian', 'كوراتي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(55, 'Cuba', 'كوبا', '53', NULL, 'Cuban', 'كوبي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(56, 'Cyprus', 'قبرص', '357', NULL, 'Cypriot', 'قبرصي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(57, 'Curaçao', 'كوراساو', '420', NULL, 'Curacian', 'كوراساوي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(58, 'Czech Republic', 'الجمهورية التشيكية', '45', NULL, 'Czech', 'تشيكي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(59, 'Denmark', 'الدانمارك', '253', NULL, 'Danish', 'دنماركي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(60, 'Djibouti', 'جيبوتي', '1767', NULL, 'Djiboutian', 'جيبوتي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(61, 'Dominica', 'دومينيكا', '1809', NULL, 'Dominican', 'دومينيكي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(62, 'Dominican Republic', 'الجمهورية الدومينيكية', '593', NULL, 'Dominican', 'دومينيكي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(63, 'Ecuador', 'إكوادور', '20', NULL, 'Ecuadorian', 'إكوادوري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(64, 'Egypt', 'مصر', '0020', NULL, 'Egyptian', 'مصري', 'uploads/countries/1612969424.png', '2021-02-10 15:03:38', '2021-02-10 13:03:44'),
(65, 'El Salvador', 'إلسلفادور', '240', NULL, 'Salvadoran', 'سلفادوري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(66, 'Equatorial Guinea', 'غينيا الاستوائي', '291', NULL, 'Equatorial Guinean', 'غيني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(67, 'Eritrea', 'إريتريا', '372', NULL, 'Eritrean', 'إريتيري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(68, 'Estonia', 'استونيا', '251', NULL, 'Estonian', 'استوني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(69, 'Ethiopia', 'أثيوبيا', '500', NULL, 'Ethiopian', 'أثيوبي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(70, 'Falkland Islands (Malvinas)', 'جزر فوكلاند', '298', NULL, 'Falkland Islander', 'فوكلاندي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(71, 'Faroe Islands', 'جزر فارو', '679', NULL, 'Faroese', 'جزر فارو', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(72, 'Fiji', 'فيجي', '358', NULL, 'Fijian', 'فيجي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(73, 'Finland', 'فنلندا', '33', NULL, 'Finnish', 'فنلندي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(74, 'France', 'فرنسا', '594', NULL, 'French', 'فرنسي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(75, 'French Guiana', 'غويانا الفرنسية', '689', NULL, 'French Guianese', 'غويانا الفرنسية', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(76, 'French Polynesia', 'بولينيزيا الفرنسية', '0', NULL, 'French Polynesian', 'بولينيزيي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(77, 'French Southern and Antarctic Lands', 'أراض فرنسية جنوبية وأنتارتيكية', '241', NULL, 'French', 'أراض فرنسية جنوبية وأنتارتيكية', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(78, 'Gabon', 'الغابون', '220', NULL, 'Gabonese', 'غابوني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(79, 'Gambia', 'غامبيا', '995', NULL, 'Gambian', 'غامبي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(80, 'Georgia', 'جيورجيا', '49', NULL, 'Georgian', 'جيورجي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(81, 'Germany', 'ألمانيا', '233', NULL, 'German', 'ألماني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(82, 'Ghana', 'غانا', '350', NULL, 'Ghanaian', 'غاني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(83, 'Gibraltar', 'جبل طارق', '30', NULL, 'Gibraltar', 'جبل طارق', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(84, 'Guernsey', 'غيرنزي', '299', NULL, 'Guernsian', 'غيرنزي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(85, 'Greece', 'اليونان', '1473', NULL, 'Greek', 'يوناني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(86, 'Greenland', 'جرينلاند', '590', NULL, 'Greenlandic', 'جرينلاندي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(87, 'Grenada', 'غرينادا', '1671', NULL, 'Grenadian', 'غرينادي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(88, 'Guadeloupe', 'جزر جوادلوب', '502', NULL, 'Guadeloupe', 'جزر جوادلوب', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(89, 'Guam', 'جوام', '224', NULL, 'Guamanian', 'جوامي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(90, 'Guatemala', 'غواتيمال', '245', NULL, 'Guatemalan', 'غواتيمالي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(91, 'Guinea', 'غينيا', '592', NULL, 'Guinean', 'غيني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(92, 'Guinea-Bissau', 'غينيا-بيساو', '509', NULL, 'Guinea-Bissauan', 'غيني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(93, 'Guyana', 'غيانا', '0', NULL, 'Guyanese', 'غياني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(94, 'Haiti', 'هايتي', '39', NULL, 'Haitian', 'هايتي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(95, 'Heard and Mc Donald Islands', 'جزيرة هيرد وجزر ماكدونالد', '504', NULL, 'Heard and Mc Donald Islanders', 'جزيرة هيرد وجزر ماكدونالد', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(96, 'Honduras', 'هندوراس', '852', NULL, 'Honduran', 'هندوراسي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(97, 'Hong Kong', 'هونغ كونغ', '36', NULL, 'Hongkongese', 'هونغ كونغي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(98, 'Hungary', 'المجر', '354', NULL, 'Hungarian', 'مجري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(99, 'Iceland', 'آيسلندا', '91', NULL, 'Icelandic', 'آيسلندي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(100, 'India', 'الهند', '62', NULL, 'Indian', 'هندي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(101, 'Isle of Man', 'جزيرة مان', '98', NULL, 'Manx', 'ماني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(102, 'Indonesia', 'أندونيسيا', '964', NULL, 'Indonesian', 'أندونيسيي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(103, 'Iran', 'إيران', '353', NULL, 'Iranian', 'إيراني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(104, 'Iraq', 'العراق', '972', NULL, 'Iraqi', 'عراقي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(105, 'Ireland', 'إيرلندا', '39', NULL, 'Irish', 'إيرلندي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(106, 'Israel', 'إسرائيل', '1876', NULL, 'Israeli', 'إسرائيلي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(107, 'Italy', 'إيطاليا', '81', NULL, 'Italian', 'إيطالي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(108, 'Ivory Coast', 'ساحل العاج', '962', NULL, 'Ivory Coastian', 'ساحل العاج', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(109, 'Jersey', 'جيرزي', '7', NULL, 'Jersian', 'جيرزي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(110, 'Jamaica', 'جمايكا', '254', NULL, 'Jamaican', 'جمايكي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(111, 'Japan', 'اليابان', '686', NULL, 'Japanese', 'ياباني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(112, 'Jordan', 'الأردن', '850', NULL, 'Jordanian', 'أردني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(113, 'Kazakhstan', 'كازاخستان', '82', NULL, 'Kazakh', 'كازاخستاني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(114, 'Kenya', 'كينيا', '965', NULL, 'Kenyan', 'كيني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(115, 'Kiribati', 'كيريباتي', '996', NULL, 'I-Kiribati', 'كيريباتي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(116, 'Korea(North Korea)', 'كوريا الشمالية', '856', NULL, 'North Korean', 'كوري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(117, 'Korea(South Korea)', 'كوريا الجنوبية', '371', NULL, 'South Korean', 'كوري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(118, 'Kosovo', 'كوسوفو', '961', NULL, 'Kosovar', 'كوسيفي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(119, 'Kuwait', 'الكويت', '00965', NULL, 'Kuwaiti', 'كويتي', 'uploads/countries/1612969641.png', '2021-02-10 15:03:38', '2021-02-10 13:07:21'),
(120, 'Kyrgyzstan', 'قيرغيزستان', '231', NULL, 'Kyrgyzstani', 'قيرغيزستاني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(121, 'Lao PDR', 'لاوس', '218', NULL, 'Laotian', 'لاوسي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(122, 'Latvia', 'لاتفيا', '423', NULL, 'Latvian', 'لاتيفي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(123, 'Lebanon', 'لبنان', '370', NULL, 'Lebanese', 'لبناني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(124, 'Lesotho', 'ليسوتو', '352', NULL, 'Basotho', 'ليوسيتي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(125, 'Liberia', 'ليبيريا', '853', NULL, 'Liberian', 'ليبيري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(126, 'Libya', 'ليبيا', '389', NULL, 'Libyan', 'ليبي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(127, 'Liechtenstein', 'ليختنشتين', '261', NULL, 'Liechtenstein', 'ليختنشتيني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(128, 'Lithuania', 'لتوانيا', '265', NULL, 'Lithuanian', 'لتوانيي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(129, 'Luxembourg', 'لوكسمبورغ', '60', NULL, 'Luxembourger', 'لوكسمبورغي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(130, 'Sri Lanka', 'سريلانكا', '960', NULL, 'Sri Lankian', 'سريلانكي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(131, 'Macau', 'ماكاو', '223', NULL, 'Macanese', 'ماكاوي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(132, 'Macedonia', 'مقدونيا', '356', NULL, 'Macedonian', 'مقدوني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(133, 'Madagascar', 'مدغشقر', '692', NULL, 'Malagasy', 'مدغشقري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(134, 'Malawi', 'مالاوي', '596', NULL, 'Malawian', 'مالاوي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(135, 'Malaysia', 'ماليزيا', '222', NULL, 'Malaysian', 'ماليزي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(136, 'Maldives', 'المالديف', '230', NULL, 'Maldivian', 'مالديفي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(137, 'Mali', 'مالي', '269', NULL, 'Malian', 'مالي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(138, 'Malta', 'مالطا', '52', NULL, 'Maltese', 'مالطي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(139, 'Marshall Islands', 'جزر مارشال', '691', NULL, 'Marshallese', 'مارشالي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(140, 'Martinique', 'مارتينيك', '373', NULL, 'Martiniquais', 'مارتينيكي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(141, 'Mauritania', 'موريتانيا', '377', NULL, 'Mauritanian', 'موريتانيي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(142, 'Mauritius', 'موريشيوس', '976', NULL, 'Mauritian', 'موريشيوسي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(143, 'Mayotte', 'مايوت', '1664', NULL, 'Mahoran', 'مايوتي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(144, 'Mexico', 'المكسيك', '212', NULL, 'Mexican', 'مكسيكي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(145, 'Micronesia', 'مايكرونيزيا', '258', NULL, 'Micronesian', 'مايكرونيزيي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(146, 'Moldova', 'مولدافيا', '95', NULL, 'Moldovan', 'مولديفي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(147, 'Monaco', 'موناكو', '264', NULL, 'Monacan', 'مونيكي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(148, 'Mongolia', 'منغوليا', '674', NULL, 'Mongolian', 'منغولي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(149, 'Montenegro', 'الجبل الأسود', '977', NULL, 'Montenegrin', 'الجبل الأسود', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(150, 'Montserrat', 'مونتسيرات', '31', NULL, 'Montserratian', 'مونتسيراتي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(151, 'Morocco', 'المغرب', '599', NULL, 'Moroccan', 'مغربي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(152, 'Mozambique', 'موزمبيق', '687', NULL, 'Mozambican', 'موزمبيقي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(153, 'Myanmar', 'ميانمار', '64', NULL, 'Myanmarian', 'ميانماري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(154, 'Namibia', 'ناميبيا', '505', NULL, 'Namibian', 'ناميبي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(155, 'Nauru', 'نورو', '227', NULL, 'Nauruan', 'نوري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(156, 'Nepal', 'نيبال', '234', NULL, 'Nepalese', 'نيبالي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(157, 'Netherlands', 'هولندا', '683', NULL, 'Dutch', 'هولندي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(158, 'Netherlands Antilles', 'جزر الأنتيل الهولندي', '672', NULL, 'Dutch Antilier', 'هولندي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(159, 'New Caledonia', 'كاليدونيا الجديدة', '1670', NULL, 'New Caledonian', 'كاليدوني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(160, 'New Zealand', 'نيوزيلندا', '47', NULL, 'New Zealander', 'نيوزيلندي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(161, 'Nicaragua', 'نيكاراجوا', '968', NULL, 'Nicaraguan', 'نيكاراجوي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(162, 'Niger', 'النيجر', '92', NULL, 'Nigerien', 'نيجيري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(163, 'Nigeria', 'نيجيريا', '680', NULL, 'Nigerian', 'نيجيري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(164, 'Niue', 'ني', '970', NULL, 'Niuean', 'ني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(165, 'Norfolk Island', 'جزيرة نورفولك', '507', NULL, 'Norfolk Islander', 'نورفوليكي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(166, 'Northern Mariana Islands', 'جزر ماريانا الشمالية', '675', NULL, 'Northern Marianan', 'ماريني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(167, 'Norway', 'النرويج', '595', NULL, 'Norwegian', 'نرويجي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(168, 'Oman', 'عمان', '51', NULL, 'Omani', 'عماني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(169, 'Pakistan', 'باكستان', '63', NULL, 'Pakistani', 'باكستاني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(170, 'Palau', 'بالاو', '0', NULL, 'Palauan', 'بالاوي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(171, 'Palestine', 'فلسطين', '48', NULL, 'Palestinian', 'فلسطيني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(172, 'Panama', 'بنما', '351', NULL, 'Panamanian', 'بنمي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(173, 'Papua New Guinea', 'بابوا غينيا الجديدة', '1787', NULL, 'Papua New Guinean', 'بابوي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(174, 'Paraguay', 'باراغواي', '974', NULL, 'Paraguayan', 'بارغاوي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(175, 'Peru', 'بيرو', '262', NULL, 'Peruvian', 'بيري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(176, 'Philippines', 'الفليبين', '40', NULL, 'Filipino', 'فلبيني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(177, 'Pitcairn', 'بيتكيرن', '70', NULL, 'Pitcairn Islander', 'بيتكيرني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(178, 'Poland', 'بولونيا', '250', NULL, 'Polish', 'بوليني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(179, 'Portugal', 'البرتغال', '290', NULL, 'Portuguese', 'برتغالي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(180, 'Puerto Rico', 'بورتو ريكو', '1869', NULL, 'Puerto Rican', 'بورتي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(181, 'Qatar', 'قطر', '1758', NULL, 'Qatari', 'قطري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(182, 'Reunion Island', 'ريونيون', '508', NULL, 'Reunionese', 'ريونيوني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(183, 'Romania', 'رومانيا', '1784', NULL, 'Romanian', 'روماني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(184, 'Russian', 'روسيا', '684', NULL, 'Russian', 'روسي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(185, 'Rwanda', 'رواندا', '378', NULL, 'Rwandan', 'رواندا', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(186, 'Saint Kitts and Nevis', 'سانت كيتس ونيفس,', '239', NULL, 'Kittitian/Nevisian', 'سانت كيتس ونيفس', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(187, 'Saint Martin (French part)', 'ساينت مارتن فرنسي', '966', NULL, 'St. Martian(French)', 'ساينت مارتني فرنسي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(188, 'Sint Maarten (Dutch part)', 'ساينت مارتن هولندي', '221', NULL, 'St. Martian(Dutch)', 'ساينت مارتني هولندي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(189, 'Saint Pierre and Miquelon', 'سان بيير وميكلون', '381', NULL, 'St. Pierre and Miquelon', 'سان بيير وميكلوني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(190, 'Saint Vincent and the Grenadines', 'سانت فنسنت وجزر غرينادين', '248', NULL, 'Saint Vincent and the Grenadines', 'سانت فنسنت وجزر غرينادين', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(191, 'Samoa', 'ساموا', '232', NULL, 'Samoan', 'ساموي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(192, 'San Marino', 'سان مارينو', '65', NULL, 'Sammarinese', 'ماريني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(193, 'Sao Tome and Principe', 'ساو تومي وبرينسيبي', '421', NULL, 'Sao Tomean', 'ساو تومي وبرينسيبي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(194, 'Saudi Arabia', 'المملكة العربية السعودية', '386', NULL, 'Saudi Arabian', 'سعودي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(195, 'Senegal', 'السنغال', '677', NULL, 'Senegalese', 'سنغالي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(196, 'Serbia', 'صربيا', '252', NULL, 'Serbian', 'صربي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(197, 'Seychelles', 'سيشيل', '27', NULL, 'Seychellois', 'سيشيلي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(198, 'Sierra Leone', 'سيراليون', '0', NULL, 'Sierra Leonean', 'سيراليوني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(199, 'Singapore', 'سنغافورة', '34', NULL, 'Singaporean', 'سنغافوري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(200, 'Slovakia', 'سلوفاكيا', '94', NULL, 'Slovak', 'سولفاكي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(201, 'Slovenia', 'سلوفينيا', '249', NULL, 'Slovenian', 'سولفيني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(202, 'Solomon Islands', 'جزر سليمان', '597', NULL, 'Solomon Island', 'جزر سليمان', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(203, 'Somalia', 'الصومال', '47', NULL, 'Somali', 'صومالي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(204, 'South Africa', 'جنوب أفريقيا', '268', NULL, 'South African', 'أفريقي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(205, 'South Georgia and the South Sandwich', 'المنطقة القطبية الجنوبية', '46', NULL, 'South Georgia and the South Sandwich', 'لمنطقة القطبية الجنوبية', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(206, 'South Sudan', 'السودان الجنوبي', '41', NULL, 'South Sudanese', 'سوادني جنوبي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(207, 'Spain', 'إسبانيا', '963', NULL, 'Spanish', 'إسباني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(208, 'Saint Helena', 'سانت هيلانة', '886', NULL, 'St. Helenian', 'هيلاني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(209, 'Sudan', 'السودان', '992', NULL, 'Sudanese', 'سوداني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(210, 'Suriname', 'سورينام', '255', NULL, 'Surinamese', 'سورينامي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(211, 'Svalbard and Jan Mayen', 'سفالبارد ويان ماين', '66', NULL, 'Svalbardian/Jan Mayenian', 'سفالبارد ويان ماين', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(212, 'Swaziland', 'سوازيلند', '670', NULL, 'Swazi', 'سوازيلندي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(213, 'Sweden', 'السويد', '228', NULL, 'Swedish', 'سويدي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(214, 'Switzerland', 'سويسرا', '690', NULL, 'Swiss', 'سويسري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(215, 'Syria', 'سوريا', '676', NULL, 'Syrian', 'سوري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(216, 'Taiwan', 'تايوان', '1868', NULL, 'Taiwanese', 'تايواني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(217, 'Tajikistan', 'طاجيكستان', '216', NULL, 'Tajikistani', 'طاجيكستاني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(218, 'Tanzania', 'تنزانيا', '90', NULL, 'Tanzanian', 'تنزانيي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(219, 'Thailand', 'تايلندا', '7370', NULL, 'Thai', 'تايلندي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(220, 'Timor-Leste', 'تيمور الشرقية', '1649', NULL, 'Timor-Lestian', 'تيموري', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(221, 'Togo', 'توغو', '688', NULL, 'Togolese', 'توغي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(222, 'Tokelau', 'توكيلاو', '256', NULL, 'Tokelaian', 'توكيلاوي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(223, 'Tonga', 'تونغا', '380', NULL, 'Tongan', 'تونغي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(224, 'Trinidad and Tobago', 'ترينيداد وتوباغو', '971', NULL, 'Trinidadian/Tobagonian', 'ترينيداد وتوباغو', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(225, 'Tunisia', 'تونس', '44', NULL, 'Tunisian', 'تونسي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(226, 'Turkey', 'تركيا', '1', NULL, 'Turkish', 'تركي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(227, 'Turkmenistan', 'تركمانستان', '1', NULL, 'Turkmen', 'تركمانستاني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(228, 'Turks and Caicos Islands', 'جزر توركس وكايكوس', '598', NULL, 'Turks and Caicos Islands', 'جزر توركس وكايكوس', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(229, 'Tuvalu', 'توفالو', '998', NULL, 'Tuvaluan', 'توفالي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(230, 'Uganda', 'أوغندا', '678', NULL, 'Ugandan', 'أوغندي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(231, 'Ukraine', 'أوكرانيا', '58', NULL, 'Ukrainian', 'أوكراني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(232, 'United Arab Emirates', 'الإمارات العربية المتحدة', '84', NULL, 'Emirati', 'إماراتي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(233, 'United Kingdom', 'المملكة المتحدة', '1284', NULL, 'British', 'بريطاني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(234, 'United States', 'الولايات المتحدة', '1340', NULL, 'American', 'أمريكي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(235, 'US Minor Outlying Islands', 'قائمة الولايات والمناطق الأمريكية', '681', NULL, 'US Minor Outlying Islander', 'أمريكي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(236, 'Uruguay', 'أورغواي', '212', NULL, 'Uruguayan', 'أورغواي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(237, 'Uzbekistan', 'أوزباكستان', '967', NULL, 'Uzbek', 'أوزباكستاني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(238, 'Vanuatu', 'فانواتو', '260', NULL, 'Vanuatuan', 'فانواتي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(239, 'Venezuela', 'فنزويلا', '263', NULL, 'Venezuelan', 'فنزويلي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(240, 'Vietnam', 'فيتنام', NULL, NULL, 'Vietnamese', 'فيتنامي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(241, 'Virgin Islands (U.S.)', 'الجزر العذراء الأمريكي', NULL, NULL, 'American Virgin Islander', 'أمريكي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(242, 'Vatican City', 'فنزويلا', NULL, NULL, 'Vatican', 'فاتيكاني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(243, 'Wallis and Futuna Islands', 'والس وفوتونا', NULL, NULL, 'Wallisian/Futunan', 'فوتوني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(244, 'Western Sahara', 'الصحراء الغربية', NULL, NULL, 'Sahrawian', 'صحراوي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(245, 'Yemen', 'اليمن', NULL, NULL, 'Yemeni', 'يمني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(246, 'Zambia', 'زامبيا', NULL, NULL, 'Zambian', 'زامبياني', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38'),
(247, 'Zimbabwe', 'زمبابوي', NULL, NULL, 'Zimbabwean', 'زمبابوي', NULL, '2021-02-10 15:03:38', '2021-02-10 15:03:38');

-- --------------------------------------------------------

--
-- Table structure for table `country_categories`
--

CREATE TABLE `country_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fevorats`
--

CREATE TABLE `fevorats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `id` int(10) UNSIGNED NOT NULL,
  `follower_id` int(10) UNSIGNED NOT NULL,
  `followed_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`id`, `follower_id`, `followed_id`, `created_at`, `updated_at`) VALUES
(36, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jewelleries`
--

CREATE TABLE `jewelleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ar_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `en_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_block` tinyint(4) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `image` varchar(189) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jewellery_value` int(11) NOT NULL DEFAULT 0,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jewelleries`
--

INSERT INTO `jewelleries` (`id`, `ar_title`, `en_title`, `is_block`, `amount`, `image`, `jewellery_value`, `country_id`, `created_at`, `updated_at`) VALUES
(1, '60 مجوهرة', '60 مجوهرة', 0, 60, 'uploads/jewellery/1614255136.png', 60, NULL, '2021-02-25 10:12:16', '2021-02-25 10:12:16');

-- --------------------------------------------------------

--
-- Table structure for table `jewellery_orders`
--

CREATE TABLE `jewellery_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jewellery_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_block` tinyint(4) NOT NULL DEFAULT 0,
  `is_accepted` tinyint(4) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `jewellery_value` int(11) NOT NULL DEFAULT 0,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jewellery_wallets`
--

CREATE TABLE `jewellery_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_block` tinyint(4) NOT NULL DEFAULT 0,
  `is_accepted` tinyint(4) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jewellery_wallets`
--

INSERT INTO `jewellery_wallets` (`id`, `user_id`, `is_block`, `is_accepted`, `amount`, `country_id`, `created_at`, `updated_at`) VALUES
(1, 6, 0, 0, 0, NULL, '2021-02-20 15:51:34', '2021-02-20 15:51:34'),
(2, 5, 0, 0, 0, NULL, '2021-02-25 10:28:25', '2021-02-25 10:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ad_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_id` bigint(20) UNSIGNED DEFAULT NULL,
  `form_id` bigint(20) UNSIGNED DEFAULT NULL,
  `to_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `message`, `room_id`, `form_id`, `to_id`, `created_at`, `updated_at`) VALUES
(1, 'الحمد لله', 1, 2, 1, '2020-01-09 06:37:25', '2020-01-09 06:37:25'),
(2, 'الحمد لله', 1, 2, 1, '2020-01-09 06:37:44', '2020-01-09 06:37:44'),
(3, 'الحمد لله', 1, 1, 2, '2020-01-09 06:38:38', '2020-01-09 06:38:38'),
(4, 'الحمد لله', 1, 1, 2, '2020-01-09 07:54:09', '2020-01-09 07:54:09'),
(5, 'يرحمك الله', 1, 1, 2, '2020-01-09 07:55:04', '2020-01-09 07:55:04'),
(6, 'اهلا', 1, 1, 2, '2020-04-16 00:49:19', '2020-04-16 00:49:19'),
(7, 'hi', 3, 6, 6, '2021-02-23 20:29:25', '2021-02-23 20:29:25'),
(8, NULL, 3, 6, 6, '2021-02-23 20:55:48', '2021-02-23 20:55:48'),
(9, 'السلام عليكم', 4, 5, 5, '2021-02-25 10:39:05', '2021-02-25 10:39:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(17, '2014_10_12_000000_create_users_table', 1),
(18, '2014_10_12_100000_create_password_resets_table', 1),
(19, '2019_08_19_000000_create_failed_jobs_table', 1),
(20, '2020_03_07_151823_create_admins_table', 1),
(21, '2020_03_07_151913_create_countries_table', 1),
(22, '2020_03_07_151946_create_categories_table', 1),
(23, '2020_03_07_153232_create_country_categories_table', 1),
(24, '2020_03_07_153534_create_ads_table', 1),
(25, '2020_03_07_153618_create_comments_table', 1),
(26, '2020_03_07_153702_create_follows_table', 1),
(27, '2020_03_07_153730_create_fevorats_table', 1),
(28, '2020_03_07_153806_create_rates_table', 1),
(29, '2020_03_07_153833_create_banks_table', 1),
(30, '2020_03_07_153858_create_payments_table', 1),
(31, '2020_03_07_153934_create_contacts_table', 1),
(32, '2020_03_07_154000_create_site_texts_table', 1),
(33, '2020_03_30_150157_create_ad_images_table', 2),
(34, '2020_04_02_203258_create_views_table', 3),
(35, '2020_04_02_214240_create_likes_table', 4),
(36, '2020_04_08_210713_create_sliders_table', 5),
(37, '2020_04_12_170511_create_offers_table', 6),
(38, '2020_05_17_234655_create_user_images_table', 7),
(39, '2020_06_09_223838_create_news_tickers_table', 8),
(40, '2020_06_10_040823_create_user_messages_table', 9),
(46, '2016_10_22_125113_create_social_providers_table', 10),
(47, '2020_06_27_085221_create_jewelleries_table', 10),
(48, '2020_06_27_095248_create_jewellery_orders_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `news_tickers`
--

CREATE TABLE `news_tickers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ar_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `en_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_tickers`
--

INSERT INTO `news_tickers` (`id`, `ar_title`, `en_title`, `created_at`, `updated_at`) VALUES
(1, 'موقع متميز', 'good site idea1', '2020-06-09 22:03:05', '2020-06-09 22:05:13');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_id` bigint(20) DEFAULT NULL,
  `to_id` bigint(20) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `order_id` int(11) DEFAULT NULL,
  `notification_date` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `is_read` int(11) NOT NULL DEFAULT 0,
  `notification_name` int(11) NOT NULL DEFAULT 0,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_texts`
--

CREATE TABLE `notification_texts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ar_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `en_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ar_content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `en_content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_texts`
--

INSERT INTO `notification_texts` (`id`, `ar_title`, `en_title`, `ar_content`, `en_content`, `created_at`, `updated_at`) VALUES
(1, 'طلب جديد', NULL, NULL, NULL, '2020-01-01 22:00:00', '2020-01-01 22:00:00'),
(2, 'تم توزيع طلبك بنجاح', NULL, NULL, NULL, '2020-01-01 22:00:00', '2020-01-01 22:00:00'),
(3, ' تم توزيع طلب بنجاح علي احد المناديب', NULL, NULL, NULL, '2020-01-01 22:00:00', '2020-01-01 22:00:00'),
(4, 'تم الغاء الطلب', NULL, NULL, NULL, '2020-01-01 22:00:00', '2020-01-01 22:00:00'),
(5, 'تم انهاءالطلب', NULL, NULL, NULL, '2020-01-01 22:00:00', '2020-01-01 22:00:00'),
(6, 'طلب خارجي جديد', NULL, NULL, NULL, '2020-02-13 22:00:00', '2020-02-13 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ad_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date` bigint(20) DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `is_accepted` tinyint(2) NOT NULL DEFAULT 0,
  `status` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `ad_id`, `user_id`, `date`, `price`, `is_accepted`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 1589751548, 234, 0, 0, '2020-05-17 19:39:08', '2020-05-17 19:39:08'),
(12, 4, 5, 1614256668, 23467, 0, 0, '2021-02-25 10:37:48', '2021-02-25 10:37:48'),
(13, 5, 6, 1614342313, 1234, 0, 0, '2021-02-26 10:25:13', '2021-02-26 10:25:13'),
(14, 5, 6, 1614342349, 123, 0, 0, '2021-02-26 10:25:49', '2021-02-26 10:25:49');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bank_id` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accepted` tinyint(4) NOT NULL DEFAULT 0,
  `amount` double DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `form_id` bigint(20) UNSIGNED DEFAULT NULL,
  `to_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` int(2) DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `created_at`, `updated_at`, `form_id`, `to_id`, `comment`, `rate`) VALUES
(1, '2020-05-16 20:19:52', '2020-05-16 20:19:52', 1, 2, 'can be null', 5);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `reported_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `user_id`, `reported_id`, `created_at`, `updated_at`) VALUES
(4, 2, 1, '2020-06-10 03:38:52', '2020-06-10 03:38:52');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` bigint(20) UNSIGNED DEFAULT NULL,
  `last_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `form_id`, `last_message`, `to_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'اهلا', 2, '2020-01-09 06:37:25', '2020-04-16 00:49:19'),
(2, 6, NULL, 1, '2021-02-21 09:10:55', '2021-02-21 09:10:55'),
(3, 6, NULL, 6, '2021-02-23 18:52:11', '2021-02-23 18:52:11'),
(4, 5, NULL, 5, '2021-02-25 10:38:51', '2021-02-25 10:38:51');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_slider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `en_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ar_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `android_app` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ios_app` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ar_des` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `en_des` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double NOT NULL DEFAULT 0,
  `longitude` double NOT NULL DEFAULT 0,
  `sms_user_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_user_pass` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_sender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_hot_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ar',
  `site_proportion` double NOT NULL DEFAULT 0,
  `shipping_price` double DEFAULT 0,
  `facebook_link` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gmail_link` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insta_link` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tewtter_link` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rss_link` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo`, `login_banner`, `image_slider`, `en_title`, `ar_title`, `address1`, `address2`, `phone1`, `phone2`, `fax`, `android_app`, `ios_app`, `email1`, `email2`, `link`, `ar_des`, `en_des`, `latitude`, `longitude`, `sms_user_name`, `sms_user_pass`, `sms_sender`, `publisher`, `company_hot_line`, `default_language`, `site_proportion`, `shipping_price`, `facebook_link`, `gmail_link`, `insta_link`, `tewtter_link`, `rss_link`, `created_at`, `updated_at`) VALUES
(1, 'setting/1586596775.jpeg', NULL, NULL, 'key sale', 'كي', 'الكيوت', 'الكويت', '0200101111111', '0200101111111', NULL, 'https://play.google.com', 'https://www.apple.com/eg-ar/ios/app-store/', 'muhammad@muhamm.com', 'muhammad2@register.com', NULL, 'rrr', 'des', 28.623111, 43.626704, NULL, NULL, NULL, NULL, NULL, 'ar', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-11 18:49:44');

-- --------------------------------------------------------

--
-- Table structure for table `site_texts`
--

CREATE TABLE `site_texts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_word` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('client','company') COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_texts`
--

INSERT INTO `site_texts` (`id`, `link`, `key_word`, `type`, `lang`, `title`, `content`, `image`, `created_at`, `updated_at`) VALUES
(1, NULL, 'about_us', 'client', 'ar', 'من نحن', 'من نحن عن التطبيق1', NULL, NULL, '2020-05-16 19:03:06'),
(2, NULL, 'about_us', 'client', 'en', 'about us', 'about us', NULL, NULL, NULL),
(3, NULL, 'terms', 'client', 'ar', 'الشروط و الاحكام', 'الشروط و الاحكام', NULL, NULL, NULL),
(4, NULL, 'terms', 'client', 'en', 'terms and conditions', 'terms and conditions', NULL, NULL, '2020-01-23 09:20:22');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ar_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ar_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `en_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `en_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `ar_title`, `ar_content`, `en_title`, `en_content`, `created_at`, `updated_at`) VALUES
(3, 'uploads/slider/1589651986.jpg', 'key sale', 'اكبر منصة في العالم العربي', 'ke', 'اكبر منصة في العالم العربي', '2020-05-16 15:59:46', '2020-05-16 15:59:46'),
(4, 'uploads/slider/1614341835.jpg', 'اثاث وكل ما يلزم البيت والعمل في كي سيل', 'اثاث وكل ما يلزم البيت والعمل في كي سيل', 'اثاث وكل ما يلزم البيت والعمل في كي سيل', 'اثاث وكل ما يلزم البيت والعمل في كي سيل', '2021-02-26 10:17:16', '2021-02-26 10:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `social_providers`
--

CREATE TABLE `social_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` double NOT NULL DEFAULT 0,
  `latitude` double NOT NULL DEFAULT 0,
  `is_block` tinyint(4) NOT NULL DEFAULT 0,
  `is_login` tinyint(4) NOT NULL DEFAULT 0,
  `is_agree` tinyint(4) NOT NULL DEFAULT 0,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(2) DEFAULT 1,
  `national_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ar_name` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ar_des` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `en_des` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `en_name` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perent_id` bigint(20) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `longitude`, `latitude`, `is_block`, `is_login`, `is_agree`, `country_id`, `phone`, `phone_code`, `image`, `address`, `banner`, `id_image`, `type`, `national_id`, `email`, `ar_name`, `ar_des`, `en_des`, `en_name`, `perent_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'muhammad', 30.778, 30.778, 1, 1, 1, 64, '01013924211', '0020', NULL, NULL, NULL, NULL, 1, NULL, 'emai1l@format.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$fB3Jg6D0d8WueR/CtSLkneUppLDGb9I0.KoT.f4Ghy2MJ85naht0O', NULL, '2020-06-09 17:47:41', '2021-02-11 18:28:24'),
(2, NULL, 0, 0, 0, 0, 0, 64, '0101344545', NULL, 'uploads/malls/1591734243.jpg', NULL, NULL, NULL, 2, NULL, 'aloroba@email.com', 'مول العروبة', NULL, NULL, 'al oroba mall', NULL, NULL, NULL, NULL, '2020-06-09 18:24:03', '2020-06-09 18:24:03'),
(4, NULL, 30.778, 30.778, 0, 1, 1, 64, '010629224211', '0020', NULL, NULL, NULL, NULL, 3, NULL, 'emai@frmaet.com', 'محل داخلي', NULL, NULL, 'dfergtre', 2, NULL, '$2y$10$baZByABhfG20FE9ta30ya.5uqlMgpnFvooruH4QUckl/YF34g4Ywy', NULL, '2020-06-10 02:52:12', '2020-06-10 02:52:12'),
(5, 'محمد', 0, 0, 0, 0, 1, 68, '01013924210', '0020', 'uploads/users/1614259308.jpg', NULL, NULL, NULL, 1, NULL, 'A@A.COM', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$1fIhvMFMENVTfXgWxI6UCubuxG1uwp6EZLcXsmOk3a332ASPJ4JP2', NULL, NULL, '2021-02-25 11:21:48'),
(6, '234T43T', 0, 0, 0, 0, 0, NULL, '0101203962', NULL, 'uploads/users/1614113621.jpg', NULL, NULL, NULL, 1, NULL, 'muhammadelsha4khs@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$1fIhvMFMENVTfXgWxI6UCubuxG1uwp6EZLcXsmOk3a332ASPJ4JP2', NULL, '2021-02-20 15:41:38', '2021-02-23 18:53:42'),
(7, NULL, 0, 0, 0, 0, 0, 64, '010210396', NULL, 'uploads/representatives/1614119177.jpg', NULL, NULL, NULL, 5, NULL, 'Ahmad@Ahmad.com', 'احمد', NULL, NULL, 'ahmad', NULL, NULL, NULL, NULL, '2021-02-23 20:26:17', '2021-02-23 20:26:17'),
(8, NULL, 0, 0, 0, 0, 0, 64, '0101023965', NULL, 'uploads/representatives/1614119327.jpg', NULL, NULL, NULL, 5, NULL, 'Hasham@Hasham.com', 'hasham', NULL, NULL, 'Hasham', NULL, NULL, NULL, NULL, '2021-02-23 20:28:47', '2021-02-23 20:28:47');

-- --------------------------------------------------------

--
-- Table structure for table `user_images`
--

CREATE TABLE `user_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mall_id` bigint(20) UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_images`
--

INSERT INTO `user_images` (`id`, `mall_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 8, 'uploads/users/1589759759download (21).jpg', '2020-05-17 21:55:59', '2020-05-17 21:55:59'),
(2, 8, 'uploads/users/1589759759download (22).jpg', '2020-05-17 21:55:59', '2020-05-17 21:55:59'),
(3, 8, 'uploads/users/1589759759download (23).jpg', '2020-05-17 21:55:59', '2020-05-17 21:55:59'),
(4, 8, 'uploads/users/1589759759download (24).jpg', '2020-05-17 21:55:59', '2020-05-17 21:55:59'),
(5, 8, 'uploads/users/1589759759download (25).jpg', '2020-05-17 21:56:00', '2020-05-17 21:56:00'),
(6, 9, 'uploads/users/1590014684download (12).jpg', '2020-05-20 20:44:44', '2020-05-20 20:44:44'),
(7, 9, 'uploads/users/1590014684download (13).jpg', '2020-05-20 20:44:44', '2020-05-20 20:44:44'),
(8, 9, 'uploads/users/1590014684download (14).jpg', '2020-05-20 20:44:44', '2020-05-20 20:44:44'),
(9, 9, 'uploads/users/1590014684download (15).jpg', '2020-05-20 20:44:45', '2020-05-20 20:44:45'),
(10, 9, 'uploads/users/1590014685download (22).jpg', '2020-05-20 20:44:45', '2020-05-20 20:44:45'),
(11, 9, 'uploads/users/1590014685download (23).jpg', '2020-05-20 20:44:45', '2020-05-20 20:44:45'),
(12, 9, 'uploads/users/1590014685download (24).jpg', '2020-05-20 20:44:45', '2020-05-20 20:44:45'),
(13, 9, 'uploads/users/1590014685download (25).jpg', '2020-05-20 20:44:45', '2020-05-20 20:44:45'),
(14, 13, 'uploads/users/1590800384download (10).jpg', '2020-05-29 22:59:44', '2020-05-29 22:59:44'),
(15, 13, 'uploads/users/1590800384download (11).jpg', '2020-05-29 22:59:44', '2020-05-29 22:59:44'),
(16, 13, 'uploads/users/1590800385download (12).jpg', '2020-05-29 22:59:45', '2020-05-29 22:59:45'),
(17, 13, 'uploads/users/1590800385download (13).jpg', '2020-05-29 22:59:45', '2020-05-29 22:59:45'),
(18, 13, 'uploads/users/1590800385download (14).jpg', '2020-05-29 22:59:45', '2020-05-29 22:59:45'),
(19, 13, 'uploads/users/1590800385download (15).jpg', '2020-05-29 22:59:45', '2020-05-29 22:59:45'),
(20, 13, 'uploads/users/1590800386download (16).jpg', '2020-05-29 22:59:46', '2020-05-29 22:59:46'),
(21, 13, 'uploads/users/1590800386download (20).jpg', '2020-05-29 22:59:46', '2020-05-29 22:59:46'),
(22, 13, 'uploads/users/1590800386download (21).jpg', '2020-05-29 22:59:46', '2020-05-29 22:59:46'),
(23, 13, 'uploads/users/1590800386download (22).jpg', '2020-05-29 22:59:46', '2020-05-29 22:59:46'),
(24, 13, 'uploads/users/1590800386download (23).jpg', '2020-05-29 22:59:46', '2020-05-29 22:59:46'),
(25, 13, 'uploads/users/1590800386download (24).jpg', '2020-05-29 22:59:46', '2020-05-29 22:59:46'),
(26, 13, 'uploads/users/1590800387download (25).jpg', '2020-05-29 22:59:47', '2020-05-29 22:59:47'),
(27, 13, 'uploads/users/1590800387download (26).jpg', '2020-05-29 22:59:47', '2020-05-29 22:59:47'),
(28, 13, 'uploads/users/1590800387download.jpg', '2020-05-29 22:59:47', '2020-05-29 22:59:47'),
(29, 13, 'uploads/users/1590800387images (1).jpg', '2020-05-29 22:59:47', '2020-05-29 22:59:47'),
(30, 13, 'uploads/users/1590800387images (2).jpg', '2020-05-29 22:59:47', '2020-05-29 22:59:47'),
(31, 13, 'uploads/users/1590800387images (3).jpg', '2020-05-29 22:59:47', '2020-05-29 22:59:47'),
(32, 13, 'uploads/users/1590800387images (4).jpg', '2020-05-29 22:59:47', '2020-05-29 22:59:47'),
(33, 13, 'uploads/users/1590800387images (5).jpg', '2020-05-29 22:59:48', '2020-05-29 22:59:48'),
(34, 4, 'uploads/users/1591764732download (22).jpg', '2020-06-10 02:52:12', '2020-06-10 02:52:12'),
(35, 4, 'uploads/users/1591764732download (23).jpg', '2020-06-10 02:52:12', '2020-06-10 02:52:12'),
(36, 4, 'uploads/users/1591764732download (24).jpg', '2020-06-10 02:52:12', '2020-06-10 02:52:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_messages`
--

CREATE TABLE `user_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ar_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `en_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_block` tinyint(4) NOT NULL DEFAULT 0,
  `Country_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_messages`
--

INSERT INTO `user_messages` (`id`, `ar_title`, `en_title`, `is_block`, `Country_id`, `created_at`, `updated_at`) VALUES
(1, 'رسالة الي مستخدمي التطبيق', 'message for all', 0, NULL, '2020-06-10 02:31:52', '2020-06-10 02:33:04'),
(2, 'fddfg', 'xcvxfcg', 0, NULL, '2021-02-11 18:17:11', '2021-02-11 18:17:11');

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE `views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ad_id` bigint(20) UNSIGNED DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`id`, `ad_id`, `url`, `session_id`, `user_id`, `ip`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL, 1, NULL, '2020-05-16 22:00:00', '2020-05-16 22:00:00'),
(7, 4, NULL, NULL, NULL, NULL, '2021-02-20 15:59:18', '2021-02-20 15:59:18'),
(8, 3, NULL, NULL, NULL, NULL, '2021-02-20 15:59:21', '2021-02-20 15:59:21'),
(60, 2, NULL, NULL, NULL, NULL, '2021-02-23 18:40:54', '2021-02-23 18:40:54'),
(61, 2, NULL, NULL, NULL, NULL, '2021-02-23 18:49:32', '2021-02-23 18:49:32'),
(62, 2, NULL, NULL, NULL, NULL, '2021-02-23 18:50:08', '2021-02-23 18:50:08'),
(63, 2, NULL, NULL, NULL, NULL, '2021-02-23 18:51:51', '2021-02-23 18:51:51'),
(64, 2, NULL, NULL, NULL, NULL, '2021-02-23 18:58:03', '2021-02-23 18:58:03'),
(65, 2, NULL, NULL, NULL, NULL, '2021-02-23 18:59:40', '2021-02-23 18:59:40'),
(66, 2, NULL, NULL, NULL, NULL, '2021-02-23 19:00:57', '2021-02-23 19:00:57'),
(67, 2, NULL, NULL, NULL, NULL, '2021-02-23 19:01:36', '2021-02-23 19:01:36'),
(68, 2, NULL, NULL, NULL, NULL, '2021-02-23 19:03:15', '2021-02-23 19:03:15'),
(69, 2, NULL, NULL, NULL, NULL, '2021-02-23 19:06:03', '2021-02-23 19:06:03'),
(70, 2, NULL, NULL, NULL, NULL, '2021-02-23 19:06:44', '2021-02-23 19:06:44'),
(73, 3, NULL, NULL, NULL, NULL, '2021-02-24 08:09:45', '2021-02-24 08:09:45'),
(74, 3, NULL, NULL, NULL, NULL, '2021-02-24 09:48:50', '2021-02-24 09:48:50'),
(76, 2, NULL, NULL, NULL, NULL, '2021-02-24 09:57:27', '2021-02-24 09:57:27'),
(100, 4, NULL, NULL, NULL, NULL, '2021-02-25 10:37:10', '2021-02-25 10:37:10'),
(101, 4, NULL, NULL, NULL, NULL, '2021-02-25 10:37:48', '2021-02-25 10:37:48'),
(102, 4, NULL, NULL, NULL, NULL, '2021-02-26 10:19:25', '2021-02-26 10:19:25'),
(103, 5, NULL, NULL, NULL, NULL, '2021-02-26 10:24:18', '2021-02-26 10:24:18'),
(104, 5, NULL, NULL, NULL, NULL, '2021-02-26 10:25:14', '2021-02-26 10:25:14'),
(105, 5, NULL, NULL, NULL, NULL, '2021-02-26 10:25:49', '2021-02-26 10:25:49'),
(106, 2, NULL, NULL, NULL, NULL, '2021-02-26 10:27:17', '2021-02-26 10:27:17'),
(107, 2, NULL, NULL, NULL, NULL, '2021-02-26 10:27:48', '2021-02-26 10:27:48'),
(108, 3, NULL, NULL, NULL, NULL, '2021-03-08 06:56:36', '2021-03-08 06:56:36'),
(109, 3, NULL, NULL, NULL, NULL, '2021-03-08 07:26:13', '2021-03-08 07:26:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ads_category_id_foreign` (`category_id`),
  ADD KEY `ads_user_id_foreign` (`user_id`);

--
-- Indexes for table `ad_images`
--
ALTER TABLE `ad_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ad_images_ad_id_foreign` (`ad_id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_ad_id_foreign` (`ad_id`),
  ADD KEY `comments_comment_id_foreign` (`user_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_categories`
--
ALTER TABLE `country_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_categories_category_id_foreign` (`category_id`),
  ADD KEY `country_categories_country_id_foreign` (`country_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fevorats`
--
ALTER TABLE `fevorats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follows_follower_id_foreign` (`follower_id`),
  ADD KEY `follows_followed_id_foreign` (`followed_id`);

--
-- Indexes for table `jewelleries`
--
ALTER TABLE `jewelleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jewellery_orders`
--
ALTER TABLE `jewellery_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jewellery_orders_user_id_foreign` (`user_id`),
  ADD KEY `jewellery_orders_jewellery_id_foreign` (`jewellery_id`);

--
-- Indexes for table `jewellery_wallets`
--
ALTER TABLE `jewellery_wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jewellery_wallets_user_id_foreign` (`user_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_user_id_foreign` (`user_id`),
  ADD KEY `likes_ad_id_foreign` (`ad_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_room_id_foreign` (`room_id`),
  ADD KEY `messages_form_id_foreign` (`form_id`),
  ADD KEY `messages_to_id_foreign` (`to_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_tickers`
--
ALTER TABLE `news_tickers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_texts`
--
ALTER TABLE `notification_texts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offers_ad_id_foreign` (`ad_id`),
  ADD KEY `offers_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_bank_id_foreign` (`bank_id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_user_id_foreign` (`user_id`),
  ADD KEY `reports_reported_id_foreign` (`reported_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_form_id_foreign` (`form_id`),
  ADD KEY `rooms_to_id_foreign` (`to_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_texts`
--
ALTER TABLE `site_texts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_providers`
--
ALTER TABLE `social_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_images`
--
ALTER TABLE `user_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_images_mall_id_foreign` (`mall_id`);

--
-- Indexes for table `user_messages`
--
ALTER TABLE `user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `views_user_id_foreign` (`user_id`),
  ADD KEY `views_ad_id_foreign` (`ad_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ad_images`
--
ALTER TABLE `ad_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT for table `country_categories`
--
ALTER TABLE `country_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fevorats`
--
ALTER TABLE `fevorats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `follows`
--
ALTER TABLE `follows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `jewelleries`
--
ALTER TABLE `jewelleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jewellery_orders`
--
ALTER TABLE `jewellery_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jewellery_wallets`
--
ALTER TABLE `jewellery_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `news_tickers`
--
ALTER TABLE `news_tickers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_texts`
--
ALTER TABLE `notification_texts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_texts`
--
ALTER TABLE `site_texts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `social_providers`
--
ALTER TABLE `social_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_images`
--
ALTER TABLE `user_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `user_messages`
--
ALTER TABLE `user_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ads`
--
ALTER TABLE `ads`
  ADD CONSTRAINT `ads_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ad_images`
--
ALTER TABLE `ad_images`
  ADD CONSTRAINT `ad_images_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_comment_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `country_categories`
--
ALTER TABLE `country_categories`
  ADD CONSTRAINT `country_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `country_categories_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jewellery_orders`
--
ALTER TABLE `jewellery_orders`
  ADD CONSTRAINT `jewellery_orders_jewellery_id_foreign` FOREIGN KEY (`jewellery_id`) REFERENCES `jewelleries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jewellery_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jewellery_wallets`
--
ALTER TABLE `jewellery_wallets`
  ADD CONSTRAINT `jewellery_wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_to_id_foreign` FOREIGN KEY (`to_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `offers_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `offers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rooms_to_id_foreign` FOREIGN KEY (`to_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `views`
--
ALTER TABLE `views`
  ADD CONSTRAINT `views_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
