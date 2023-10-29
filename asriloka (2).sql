-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Okt 2023 pada 02.52
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asriloka`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `checkIn` datetime(3) NOT NULL,
  `checkOut` datetime(3) NOT NULL,
  `roomId` int(11) DEFAULT NULL,
  `status` enum('BOOKED','PAYED','CHECKEDIN','CHECKEDOUT','CANCELLED') COLLATE utf8mb4_unicode_ci DEFAULT 'BOOKED',
  `totalPrice` int(50) NOT NULL,
  `bundlingId` int(11) DEFAULT NULL,
  `paymentMethod` enum('DP','FULL') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userPayed` int(50) DEFAULT NULL,
  `pictureId` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `booking`
--

INSERT INTO `booking` (`id`, `userId`, `checkIn`, `checkOut`, `roomId`, `status`, `totalPrice`, `bundlingId`, `paymentMethod`, `userPayed`, `pictureId`, `capacity`) VALUES
(82, 15, '2023-10-25 00:00:00.000', '2023-10-26 00:00:00.000', 67, 'BOOKED', 1515000, NULL, 'DP', 123000, NULL, NULL),
(83, 15, '2023-11-03 00:00:00.000', '2023-11-04 00:00:00.000', NULL, 'PAYED', 4595500, 28, 'DP', 4595500, NULL, 35);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bundling`
--

CREATE TABLE `bundling` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `type` enum('LDK','PERUSAHAAN','KELUARGA','CAMP') COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isReady` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bundling`
--

INSERT INTO `bundling` (`id`, `name`, `description`, `price`, `type`, `picture`, `isReady`) VALUES
(24, 'Paket A - Gathering (No Trainer)', '', 75000, 'PERUSAHAAN', NULL, 1),
(25, 'Paket A - Tanpa Menginap (No Trainer)', '', 65000, 'LDK', NULL, 1),
(27, 'Paket B - Tanpa Menginap (With Trainer)', '', 95000, 'LDK', NULL, 1),
(28, 'Paket B - Gathering (With Trainer)', '', 130000, 'PERUSAHAAN', NULL, 1),
(29, 'Paket C - Menginap 2 Hari 1 Malam (No Trainer)', '', 175000, 'LDK', NULL, 1),
(30, 'Paket D - Menginap 2 Hari 1 Malam (With Trainer)', '', 225000, 'LDK', NULL, 1),
(31, 'Paket C - Menginap 2 hari 1 malam (No Trainer)', '', 175000, 'PERUSAHAAN', NULL, 1),
(32, 'Paket D - Menginap 2 hari 1 Malam (Lengkap Trainer)', '', 275000, 'PERUSAHAAN', NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `capacity`
--

CREATE TABLE `capacity` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `capacity`
--

INSERT INTO `capacity` (`id`, `name`, `description`) VALUES
(1, 'Standard', '2'),
(2, 'Standard', '3'),
(3, 'standar', '4'),
(4, 'standar', '15'),
(5, 'standar', '29'),
(6, 'standar', '35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `capacityonroom`
--

CREATE TABLE `capacityonroom` (
  `roomId` int(11) NOT NULL,
  `capacityId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `capacityonroom`
--

INSERT INTO `capacityonroom` (`roomId`, `capacityId`) VALUES
(67, 4),
(73, 3),
(74, 3),
(75, 5),
(76, 6),
(77, 2),
(78, 2),
(79, 2),
(80, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `facility`
--

CREATE TABLE `facility` (
  `id` int(11) NOT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isGeneral` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `facility`
--

INSERT INTO `facility` (`id`, `picture`, `name`, `description`, `isGeneral`) VALUES
(6, 'internet.png', 'Wifi', 'Tanya di loket', 1),
(18, 'toilet.png', 'Kamar Mandi Dalam', 'Berada di dalam kamar', 0),
(19, 'waterheater.jpg', 'Water Heater', 'Memanaskan air untuk kopi dan teh', 1),
(20, 'kipas angin.jpg', 'Kipas Angin', 'Berada di dalam kamar', 0),
(21, 'hotel-sign.png', 'Penginapan', 'Paket LDKS/Perusahaan 2 hari 1 malam', 0),
(22, 'kolamm.png', 'Kolam Renang', 'Bersih dan luas', 1),
(23, 'parking.png', 'Area Parkir', 'Aman dan nyaman', 1),
(24, 'taman2.png', 'Taman', 'Luas dengan pemandangan indah', 1),
(25, 'toilet.png', 'Kamar Mandi', 'Umum', 1),
(26, 'meeting.png', 'R. Meeting dan R. Konferensi', 'digunakan untuk kegiatan bisnis dan sosial', 1),
(28, 'timer.png', 'Durasi 7 jam', 'Timer\r\n', 0),
(29, 'kegiatan.png', 'Program Training indoor & outdoor/workshop/gathering', 'Program', 0),
(30, 'konsumsi.png', '1x makan, 1x snack, Minuman Khas Asriloka', 'Konsumsi', 0),
(31, 'gedung.png', 'Fasilitas Indoor dan Outdoor', 'gedung', 0),
(33, 'fasilitator.png', 'Leader Program (Trainer) & Fasilitator', 'fasilitator', 0),
(34, 'kegiatan.png', 'Program Outbound Social Dinstancing Asriloka & Motivasi', 'program', 0),
(35, 'sound system.png', 'Perlengkapan Game & Sound System Strandart', 'fasilitas perlengkapan', 0),
(36, 'timer.png', 'Durasi 2 Hari 1 malam', 'timer', 0),
(37, 'konsumsi.png', '3x makan, 2x snack, Minuman khas Asriloka', 'konsumsi', 0),
(38, 'foto file.png', 'Free file foto Kegiatan', 'dokumentasi', 0),
(39, 'p3k.png', 'p3k Standart', 'perlengkapan medis', 0),
(40, 'pelayanan.jpg', 'Pelayanan', 'Cepat dan setiap waktu', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `facilityonbundling`
--

CREATE TABLE `facilityonbundling` (
  `bundlingId` int(11) NOT NULL,
  `facilityId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `facilityonbundling`
--

INSERT INTO `facilityonbundling` (`bundlingId`, `facilityId`) VALUES
(24, 6),
(24, 28),
(24, 29),
(24, 30),
(24, 31),
(25, 6),
(25, 28),
(25, 29),
(25, 30),
(25, 31),
(27, 6),
(27, 28),
(27, 30),
(27, 31),
(27, 33),
(27, 34),
(27, 35),
(27, 39),
(28, 6),
(28, 28),
(28, 30),
(28, 31),
(28, 33),
(28, 34),
(28, 35),
(28, 39),
(29, 6),
(29, 21),
(29, 29),
(29, 31),
(29, 36),
(29, 37),
(30, 6),
(30, 21),
(30, 33),
(30, 34),
(30, 35),
(30, 36),
(30, 37),
(30, 38),
(30, 39),
(31, 6),
(31, 21),
(31, 29),
(31, 31),
(31, 36),
(31, 37),
(32, 6),
(32, 21),
(32, 33),
(32, 34),
(32, 35),
(32, 36),
(32, 37),
(32, 38),
(32, 39);

-- --------------------------------------------------------

--
-- Struktur dari tabel `facilityonroom`
--

CREATE TABLE `facilityonroom` (
  `roomId` int(11) NOT NULL,
  `facilityId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `facilityonroom`
--

INSERT INTO `facilityonroom` (`roomId`, `facilityId`) VALUES
(67, 6),
(67, 18),
(67, 19),
(67, 20),
(67, 26),
(73, 6),
(73, 18),
(73, 19),
(73, 20),
(73, 25),
(74, 6),
(74, 18),
(74, 19),
(74, 20),
(75, 6),
(75, 18),
(75, 19),
(75, 20),
(76, 6),
(76, 18),
(76, 19),
(76, 20),
(77, 6),
(77, 19),
(77, 20),
(77, 25),
(78, 6),
(78, 19),
(78, 20),
(78, 25),
(79, 6),
(79, 19),
(79, 20),
(79, 25),
(80, 6),
(80, 18),
(80, 19),
(80, 20);

-- --------------------------------------------------------

--
-- Struktur dari tabel `generalinformation`
--

CREATE TABLE `generalinformation` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `picture`
--

CREATE TABLE `picture` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `picture`
--

INSERT INTO `picture` (`id`, `name`) VALUES
(29, 'Malaka-Hotel-Bandung-2.webp'),
(30, '60961de48b31a.jpg'),
(31, '1bb30149-c9a8-4240-947c-530f6e9863f9.jpg'),
(32, 'image (1).png'),
(33, 'success-icon-23201.png'),
(34, 'penginapan1.jpg'),
(35, 'slide2.jpg'),
(36, 'slide3.jpg'),
(37, 'slide4.jpg'),
(38, 'slide2.jpg'),
(39, 'slide3.jpg'),
(40, 'slide4.jpg'),
(41, 'slide2.jpg'),
(42, 'slide3.jpg'),
(43, 'slide4.jpg'),
(44, 'slide2.jpg'),
(45, 'slide3.jpg'),
(46, 'slide4.jpg'),
(47, 'slide2.jpg'),
(48, 'slide3.jpg'),
(49, 'slide4.jpg'),
(50, 'slide2.jpg'),
(51, 'slide3.jpg'),
(52, 'slide4.jpg'),
(53, 'denahKuntilt1.PNG'),
(54, 'slide3.jpg'),
(55, 'denahKuntilt2.PNG'),
(56, 'slide4.jpg'),
(57, 'denahKuntilt2.PNG'),
(58, 'denahKuntilt3.PNG'),
(59, 'denahKuntilt2.PNG'),
(60, 'denahKuntilt3.PNG'),
(61, 'slide3.jpg'),
(62, 'slide4.jpg'),
(63, 'slide3.jpg'),
(64, 'slide4.jpg'),
(65, 'denahKuntilt2.PNG'),
(66, 'denahKuntilt3.PNG'),
(67, 'denahKuntilt3.PNG'),
(68, 'denahKuntilt1.PNG'),
(69, 'denahKuntilt2.PNG'),
(70, 'denahKuntilt3.PNG'),
(71, 'denahKuntilt3.PNG'),
(72, 'slide2.jpg'),
(73, 'slide3.jpg'),
(74, 'slide4.jpg'),
(75, 'denahKuntilt3.PNG'),
(76, 'denahKuntilt1.PNG'),
(77, 'slide4.jpg'),
(78, 'logo.png'),
(79, 'denahKuntilt3.PNG'),
(80, 'denahKuntilt3.PNG'),
(81, 'slide2.jpg'),
(82, 'denahKuntilt3.PNG'),
(83, 'slide4.jpg'),
(84, 'success.png'),
(85, 'slide3.jpg'),
(86, 'denahKuntilt3.PNG'),
(87, 'slide2.jpg'),
(88, 'slide3.jpg'),
(89, 'slide4.jpg'),
(90, 'denahKuntilt3.PNG'),
(91, 'slide2.jpg'),
(92, 'slide3.jpg'),
(93, 'slide4.jpg'),
(94, 'slide3.jpg'),
(95, 'penginapan1.jpg'),
(96, 'slide2.jpg'),
(97, 'slide3.jpg'),
(98, 'slide4.jpg'),
(99, 'denahKuntilt3.PNG'),
(100, 'penginapan1.jpg'),
(101, 'slide2.jpg'),
(102, 'slide3.jpg'),
(103, 'slide4.jpg'),
(104, 'penginapan1.jpg'),
(105, 'slide2.jpg'),
(106, 'denahKuntilt1.PNG'),
(107, 'slide3.jpg'),
(108, 'slide2.jpg'),
(109, 'slide3.jpg'),
(110, 'slide4.jpg'),
(111, 'slide3.jpg'),
(112, 'slide4.jpg'),
(113, 'penginapan1.jpg'),
(114, 'slide2.jpg'),
(115, 'slide3.jpg'),
(116, 'slide4.jpg'),
(117, 'penginapan1.jpg'),
(118, 'penginapan1.jpg'),
(119, 'WhatsApp Image 2023-10-01 at 23.16.27.jpeg'),
(120, 'WhatsApp Image 2023-10-01 at 23.17.42.jpeg'),
(121, 'perusahaan.jpeg'),
(122, 'perusahaan.jpeg'),
(123, 'WhatsApp Image 2023-10-01 at 23.16.27.jpeg'),
(124, 'slide2.jpg'),
(125, 'camp.jpg'),
(126, 'camp.jpg'),
(127, 'kompor.jpg'),
(128, 'musholla.png'),
(129, 'slide2.jpg'),
(130, 'kompor.jpg'),
(131, 'kompor.jpg'),
(132, 'kompor.jpg'),
(133, 'kompor.jpg'),
(134, 'kompor.jpg'),
(135, 'perusahaan.jpeg'),
(136, 'slide3.jpg'),
(137, 'slide4.jpg'),
(138, 'penginapan1.jpg'),
(139, 'slide2.jpg'),
(140, 'perusahaan.jpeg'),
(141, 'perusahaan.jpeg'),
(142, 'perusahaan.jpeg'),
(143, 'Frame 2063.png'),
(144, NULL),
(145, 'Frame 1.png'),
(146, 'image.jpg'),
(147, 'Frame 2063.png'),
(148, 'Group 31.png'),
(149, 'Frame 1.png'),
(150, 'Group 31.png'),
(151, 'Frame 2063.png'),
(152, 'Frame 1.png'),
(153, 'Group 31.png'),
(154, '787da2457723b52053320b1d6de0a63c.png'),
(155, 'c8631ebf27fc8f3ac662c7f36549c073.png'),
(156, '3bee5e719af4dbce2abc8e678ab740c1.png'),
(157, 'a8277012b2ac5d893e631d8eb3b9c821.png'),
(158, '18d3a494f2e728b05d92584a60f801e2.png'),
(159, 'denahJanaka.PNG'),
(160, 'IMG_8045.JPG'),
(161, 'penginapan1.jpg'),
(162, 'denahKuntilt1.PNG'),
(163, 'denahKuntilt2.PNG'),
(164, 'denahKuntilt3.PNG'),
(165, 'dewi kunti.jpg'),
(166, 'slide3.jpg'),
(167, 'denahArimbi2.PNG'),
(168, 'IMG_8063.JPG'),
(169, 'denahArimbi2.PNG'),
(170, 'IMG_8062.JPG'),
(171, 'denahArimbi2.PNG'),
(172, 'IMG_8062.JPG'),
(173, 'IMG_8062.JPG'),
(174, 'IMG_8062.JPG'),
(175, 'IMG_8063.JPG'),
(176, 'IMG_6775.JPG'),
(177, 'IMG_6774.JPG'),
(178, 'Gambar PNG 7 (1).png'),
(179, 'Gambar PNG 8.png'),
(180, 'Gambar PNG 43.png'),
(181, 'Gambar PNG 8.png'),
(182, 'IMG_7988.JPG'),
(183, 'IMG_8004.JPG'),
(184, 'Gambar PNG 29.png'),
(185, 'Gambar PNG 43.png'),
(186, 'IMG_8044.JPG'),
(187, 'janaka.jpg'),
(188, 'denahArimbi2.PNG'),
(189, 'IMG_8062.JPG'),
(190, 'denahKuntilt1.PNG'),
(191, 'dewi kunti.jpg'),
(192, 'denahKuntilt1.PNG'),
(193, 'IMG_8046.JPG'),
(194, 'denahKuntilt1.PNG'),
(195, 'IMG_8046.JPG'),
(196, 'slide3.jpg'),
(197, 'denahKuntilt2.PNG'),
(198, 'IMG_8051.JPG'),
(199, 'slide3.jpg'),
(200, 'denahKuntilt3.PNG'),
(201, 'slide3.jpg'),
(202, 'IMG_8044.JPG'),
(203, 'IMG_8045.JPG'),
(204, 'IMG_8044.JPG'),
(205, 'IMG_8045.JPG'),
(206, 'IMG_8044.JPG'),
(207, 'IMG_8045.JPG'),
(208, 'IMG_8044.JPG'),
(209, 'IMG_8045.JPG'),
(210, 'denahKuntilt1.PNG'),
(211, 'dewi kunti.jpg'),
(212, 'IMG_8046.JPG'),
(213, 'denahKuntilt2.PNG'),
(214, 'dewi kunti.jpg'),
(215, 'IMG_8046.JPG'),
(216, 'denahKuntilt3.PNG'),
(217, 'dewi kunti.jpg'),
(218, 'IMG_8046.JPG'),
(219, 'denahArimbi2.PNG'),
(220, 'IMG_8062.JPG'),
(221, 'denahArimbi3.PNG'),
(222, 'slide4.jpg'),
(223, 'denahKuntilt3.PNG'),
(224, 'dewi kunti.jpg'),
(225, 'IMG_8046.JPG'),
(226, 'denahKuntilt2.PNG'),
(227, 'dewi kunti.jpg'),
(228, 'IMG_8046.JPG'),
(229, 'denahArimbi2.PNG'),
(230, 'IMG_8062.JPG'),
(231, 'denahKuntilt1.PNG'),
(232, 'dewi kunti.jpg'),
(233, 'IMG_8046.JPG'),
(234, 'denahJanaka.PNG'),
(235, 'IMG_8044.JPG'),
(236, 'penginapan1.jpg'),
(237, 'perusahaan.jpeg'),
(238, 'perusahaan.jpeg'),
(239, 'Gambar PNG 8 (1).png'),
(240, 'Gambar PNG 15 - Copy.png'),
(241, 'Gambar PNG 8 (1).png'),
(242, 'Gambar PNG 15 - Copy.png'),
(243, 'Gambar PNG 34.png'),
(244, 'IMG_6708.JPG'),
(245, 'Gambar PNG 34.png'),
(246, 'IMG_6708.JPG'),
(247, 'IMG_0014.JPG'),
(248, 'perusahaan.jpeg'),
(249, 'Gambar PNG 8 (1).png'),
(250, 'Gambar PNG 15 - Copy.png'),
(251, 'Gambar PNG 8 (1).png'),
(252, 'Gambar PNG 15 - Copy.png'),
(253, 'IMG_0014.JPG'),
(254, 'IMG_6708.JPG');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pictureonbundling`
--

CREATE TABLE `pictureonbundling` (
  `bundlingId` int(11) NOT NULL,
  `pictureId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pictureonbundling`
--

INSERT INTO `pictureonbundling` (`bundlingId`, `pictureId`) VALUES
(24, 121),
(25, 121),
(27, 239),
(27, 240),
(28, 239),
(28, 240),
(29, 243),
(29, 244),
(30, 247),
(31, 247),
(32, 244);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pictureonroom`
--

CREATE TABLE `pictureonroom` (
  `roomId` int(11) NOT NULL,
  `pictureId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pictureonroom`
--

INSERT INTO `pictureonroom` (`roomId`, `pictureId`) VALUES
(67, 34),
(67, 159),
(67, 186),
(73, 53),
(73, 165),
(73, 193),
(74, 167),
(74, 170),
(75, 55),
(75, 165),
(75, 193),
(76, 58),
(76, 165),
(76, 193),
(77, 160),
(77, 186),
(78, 160),
(78, 186),
(79, 160),
(79, 186),
(80, 37),
(80, 221);

-- --------------------------------------------------------

--
-- Struktur dari tabel `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` double NOT NULL,
  `roomId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `rating` double NOT NULL DEFAULT 0,
  `isReady` tinyint(1) NOT NULL DEFAULT 0,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `room`
--

INSERT INTO `room` (`id`, `name`, `description`, `price`, `rating`, `isReady`, `picture`) VALUES
(67, 'Janaka Besar', NULL, 1500000, 0, 1, NULL),
(73, 'Graha Dewi Kunti lt1', NULL, 700000, 0, 1, NULL),
(74, 'Griya Arimbi 2', NULL, 350000, 0, 1, NULL),
(75, 'Graha Dewi Kunti lt2', NULL, 2500000, 0, 1, NULL),
(76, 'Graha Dewi Kunti lt3', NULL, 3000000, 0, 1, NULL),
(77, 'Janaka Kecil 1', NULL, 300000, 0, 1, NULL),
(78, 'Janaka Kecil 2', NULL, 300000, 0, 1, NULL),
(79, 'Janaka Kecil 3', NULL, 300000, 0, 1, NULL),
(80, 'Griya Arimbi 3', NULL, 350000, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roomonbundling`
--

CREATE TABLE `roomonbundling` (
  `bundlingId` int(11) NOT NULL,
  `roomId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rule`
--

CREATE TABLE `rule` (
  `id` int(11) NOT NULL,
  `isGeneral` tinyint(1) NOT NULL DEFAULT 1,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rule`
--

INSERT INTO `rule` (`id`, `isGeneral`, `description`) VALUES
(3, 1, 'Pembayaran penuh pada saat Check-in'),
(4, 1, 'Pembatalan reservasi maksimal 1x24 jam sebelum tanggal penyewaan dengan melakukan pemberitahuan kepada pihak Asriloka. Jika lebih dari 1x24 jam akan dikenakan biaya 1 malam penyewaan\r\n'),
(6, 1, 'Sebelum menyewa, silahkan melakukan konfirmasi ketersediaan penginapan/paket kepada pihak Asriloka\r\n'),
(7, 1, 'Check-in 14.00 WIB & Check-out 12.00 WIB'),
(8, 1, 'Dilarang merokok di dalam kamar'),
(9, 1, 'pemesanan paket tanpa menginap diharapkan mengisikan tanggal check-out dihari berikutnya setelah check-in');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruleonbundling`
--

CREATE TABLE `ruleonbundling` (
  `bundlingId` int(11) NOT NULL,
  `ruleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ruleonbundling`
--

INSERT INTO `ruleonbundling` (`bundlingId`, `ruleId`) VALUES
(24, 3),
(24, 4),
(24, 6),
(24, 9),
(25, 3),
(25, 4),
(25, 6),
(25, 9),
(27, 3),
(27, 4),
(27, 6),
(27, 9),
(28, 3),
(28, 4),
(28, 6),
(28, 9),
(29, 3),
(29, 4),
(29, 6),
(29, 8),
(30, 3),
(30, 4),
(30, 6),
(30, 8),
(31, 3),
(31, 4),
(31, 8),
(32, 3),
(32, 4),
(32, 6),
(32, 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruleonroom`
--

CREATE TABLE `ruleonroom` (
  `roomId` int(11) NOT NULL,
  `ruleId` int(11) NOT NULL,
  `assignedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `assignedBy` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ruleonroom`
--

INSERT INTO `ruleonroom` (`roomId`, `ruleId`, `assignedAt`, `assignedBy`) VALUES
(67, 3, '2023-10-28 17:20:00.996', ''),
(67, 4, '2023-10-28 17:20:00.998', ''),
(67, 6, '2023-10-28 17:20:01.001', ''),
(67, 7, '2023-10-28 17:20:01.003', ''),
(67, 8, '2023-10-28 17:20:01.004', ''),
(73, 3, '2023-10-28 17:19:32.886', ''),
(73, 4, '2023-10-28 17:19:32.888', ''),
(73, 6, '2023-10-28 17:19:32.891', ''),
(73, 7, '2023-10-28 17:19:32.893', ''),
(73, 8, '2023-10-28 17:19:32.894', ''),
(74, 3, '2023-10-28 17:18:58.886', ''),
(74, 4, '2023-10-28 17:18:58.891', ''),
(74, 6, '2023-10-28 17:18:58.893', ''),
(74, 7, '2023-10-28 17:18:58.895', ''),
(74, 8, '2023-10-28 17:18:58.897', ''),
(75, 3, '2023-10-28 17:18:32.420', ''),
(75, 4, '2023-10-28 17:18:32.422', ''),
(75, 6, '2023-10-28 17:18:32.424', ''),
(75, 7, '2023-10-28 17:18:32.426', ''),
(75, 8, '2023-10-28 17:18:32.430', ''),
(76, 3, '2023-10-28 17:18:02.722', ''),
(76, 4, '2023-10-28 17:18:02.725', ''),
(76, 6, '2023-10-28 17:18:02.726', ''),
(76, 7, '2023-10-28 17:18:02.728', ''),
(76, 8, '2023-10-28 17:18:02.729', ''),
(77, 3, '2023-10-28 17:05:17.331', ''),
(77, 4, '2023-10-28 17:05:17.334', ''),
(77, 6, '2023-10-28 17:05:17.341', ''),
(77, 7, '2023-10-28 17:05:17.345', ''),
(77, 8, '2023-10-28 17:05:17.347', ''),
(78, 3, '2023-10-28 17:06:47.899', ''),
(78, 4, '2023-10-28 17:06:47.904', ''),
(78, 6, '2023-10-28 17:06:47.906', ''),
(78, 7, '2023-10-28 17:06:47.909', ''),
(78, 8, '2023-10-28 17:06:47.911', ''),
(79, 3, '2023-10-28 17:07:55.597', ''),
(79, 4, '2023-10-28 17:07:55.598', ''),
(79, 6, '2023-10-28 17:07:55.600', ''),
(79, 7, '2023-10-28 17:07:55.601', ''),
(79, 8, '2023-10-28 17:07:55.603', ''),
(80, 3, '2023-10-28 17:16:48.046', ''),
(80, 4, '2023-10-28 17:16:48.049', ''),
(80, 6, '2023-10-28 17:16:48.051', ''),
(80, 7, '2023-10-28 17:16:48.052', ''),
(80, 8, '2023-10-28 17:16:48.054', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` datetime(3) DEFAULT current_timestamp(3),
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('ADMIN','USER') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'undefined'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `picture`, `phone`, `dob`, `address`, `role`, `token`) VALUES
(14, 'Admin', '$2y$10$/Vqs2P3iE2MZns0K6zEPD.YaDO2vRWeLt9F7WUvpfGii3Bo91qThG', NULL, '012345678', '2023-10-25 20:47:52.880', NULL, 'ADMIN', 'OrGR1n59yqf/7E7uro9/R7YonLBdE8QnvNGfrHNrEdo='),
(15, 'User', '$2y$10$PB9C0BprdOhbMIAQN7QZnO6vmT5GPQX8Bmiq/YWTG.kWG.pWT4K2e', NULL, '01234456789', '2000-01-01 00:00:00.000', 'User Address', 'USER', 'y6KTdvWobMpT0yLyzLAQyFsAQWJyltu+jmrvtC228gY='),
(16, 'Pelanggan terhormat', '$2y$10$quMkpe8BRwnjvIoHLcRkb.8OL717OCpE1veFLRYKD./lbNUs5hdOW', '1698242176-65391e80d6bb9.png', '085123456789', '2023-10-25 00:00:00.000', 'Dsn.Sidorembug Ds.Balongsari RT.13 RW.04\r\nKec. Gedeg', 'USER', 'yn4WEbcHtwzRFjnbIKcqsknlD85WIrZ4QfJDskhdCBQ=');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Booking_userId_fkey` (`userId`),
  ADD KEY `Booking_roomId_fkey` (`roomId`),
  ADD KEY `Booking_bundlingId_fkey` (`bundlingId`) USING BTREE;

--
-- Indeks untuk tabel `bundling`
--
ALTER TABLE `bundling`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `capacity`
--
ALTER TABLE `capacity`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `capacityonroom`
--
ALTER TABLE `capacityonroom`
  ADD PRIMARY KEY (`roomId`,`capacityId`),
  ADD KEY `CapacityOnRoom_capacityId_fkey` (`capacityId`);

--
-- Indeks untuk tabel `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `facilityonbundling`
--
ALTER TABLE `facilityonbundling`
  ADD PRIMARY KEY (`bundlingId`,`facilityId`),
  ADD KEY `FacilityOnBundling_facilityId_fkey` (`facilityId`);

--
-- Indeks untuk tabel `facilityonroom`
--
ALTER TABLE `facilityonroom`
  ADD PRIMARY KEY (`roomId`,`facilityId`),
  ADD KEY `FacilityOnRoom_facilityId_fkey` (`facilityId`);

--
-- Indeks untuk tabel `generalinformation`
--
ALTER TABLE `generalinformation`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pictureonbundling`
--
ALTER TABLE `pictureonbundling`
  ADD PRIMARY KEY (`bundlingId`,`pictureId`),
  ADD KEY `PictureOnBundling_pictureId_fkey` (`pictureId`);

--
-- Indeks untuk tabel `pictureonroom`
--
ALTER TABLE `pictureonroom`
  ADD PRIMARY KEY (`roomId`,`pictureId`),
  ADD KEY `PictureOnRoom_pictureId_fkey` (`pictureId`);

--
-- Indeks untuk tabel `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Review_roomId_fkey` (`roomId`),
  ADD KEY `Review_userId_fkey` (`userId`);

--
-- Indeks untuk tabel `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roomonbundling`
--
ALTER TABLE `roomonbundling`
  ADD PRIMARY KEY (`bundlingId`,`roomId`),
  ADD KEY `RoomOnBundling_roomId_fkey` (`roomId`);

--
-- Indeks untuk tabel `rule`
--
ALTER TABLE `rule`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ruleonbundling`
--
ALTER TABLE `ruleonbundling`
  ADD PRIMARY KEY (`bundlingId`,`ruleId`),
  ADD KEY `RuleOnBundling_ruleId_fkey` (`ruleId`);

--
-- Indeks untuk tabel `ruleonroom`
--
ALTER TABLE `ruleonroom`
  ADD PRIMARY KEY (`roomId`,`ruleId`),
  ADD KEY `RuleOnRoom_ruleId_fkey` (`ruleId`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT untuk tabel `bundling`
--
ALTER TABLE `bundling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `capacity`
--
ALTER TABLE `capacity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `facility`
--
ALTER TABLE `facility`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `generalinformation`
--
ALTER TABLE `generalinformation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `picture`
--
ALTER TABLE `picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT untuk tabel `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT untuk tabel `rule`
--
ALTER TABLE `rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `Booking_roomId_fkey` FOREIGN KEY (`roomId`) REFERENCES `room` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Booking_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `capacityonroom`
--
ALTER TABLE `capacityonroom`
  ADD CONSTRAINT `CapacityOnRoom_capacityId_fkey` FOREIGN KEY (`capacityId`) REFERENCES `capacity` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CapacityOnRoom_roomId_fkey` FOREIGN KEY (`roomId`) REFERENCES `room` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `facilityonbundling`
--
ALTER TABLE `facilityonbundling`
  ADD CONSTRAINT `FacilityOnBundling_bundlingId_fkey` FOREIGN KEY (`bundlingId`) REFERENCES `bundling` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FacilityOnBundling_facilityId_fkey` FOREIGN KEY (`facilityId`) REFERENCES `facility` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `facilityonroom`
--
ALTER TABLE `facilityonroom`
  ADD CONSTRAINT `FacilityOnRoom_facilityId_fkey` FOREIGN KEY (`facilityId`) REFERENCES `facility` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FacilityOnRoom_roomId_fkey` FOREIGN KEY (`roomId`) REFERENCES `room` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pictureonbundling`
--
ALTER TABLE `pictureonbundling`
  ADD CONSTRAINT `PictureOnBundling_bundlingId_fkey` FOREIGN KEY (`bundlingId`) REFERENCES `bundling` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `PictureOnBundling_pictureId_fkey` FOREIGN KEY (`pictureId`) REFERENCES `picture` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pictureonroom`
--
ALTER TABLE `pictureonroom`
  ADD CONSTRAINT `PictureOnRoom_pictureId_fkey` FOREIGN KEY (`pictureId`) REFERENCES `picture` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `PictureOnRoom_roomId_fkey` FOREIGN KEY (`roomId`) REFERENCES `room` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `Review_roomId_fkey` FOREIGN KEY (`roomId`) REFERENCES `room` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Review_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `roomonbundling`
--
ALTER TABLE `roomonbundling`
  ADD CONSTRAINT `RoomOnBundling_bundlingId_fkey` FOREIGN KEY (`bundlingId`) REFERENCES `bundling` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `RoomOnBundling_roomId_fkey` FOREIGN KEY (`roomId`) REFERENCES `room` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ruleonbundling`
--
ALTER TABLE `ruleonbundling`
  ADD CONSTRAINT `RuleOnBundling_bundlingId_fkey` FOREIGN KEY (`bundlingId`) REFERENCES `bundling` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `RuleOnBundling_ruleId_fkey` FOREIGN KEY (`ruleId`) REFERENCES `rule` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ruleonroom`
--
ALTER TABLE `ruleonroom`
  ADD CONSTRAINT `RuleOnRoom_roomId_fkey` FOREIGN KEY (`roomId`) REFERENCES `room` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `RuleOnRoom_ruleId_fkey` FOREIGN KEY (`ruleId`) REFERENCES `rule` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
