-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Jan 2025 pada 16.40
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
-- Database: `ecosmart`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jemput_sampah`
--

CREATE TABLE `jemput_sampah` (
  `order_id` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `harga` int(11) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `berat` int(11) NOT NULL,
  `catatan` varchar(50) NOT NULL,
  `metode_pembayaran` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `tanggal` varchar(50) NOT NULL,
  `token` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jemput_sampah`
--

INSERT INTO `jemput_sampah` (`order_id`, `nama`, `alamat`, `harga`, `kategori`, `berat`, `catatan`, `metode_pembayaran`, `status`, `tanggal`, `token`) VALUES
('0p9o8i7u6y', 'Fais saputra', 'jakarta', 2000, 'lainnya', 100, 'Jemput cepat', NULL, NULL, '12.12.2025 00:00:00', '6f52c739-b258-4b1b-947b-b7ea9ae16a6f'),
('154ee81a-9026-4b41-948b-205daf807713', 'Hildayana Putri', 'Jl.Palagan tentara pelajar', 50000, 'lainnya', 20, 'Hati hati di jalan, keselamatan no 1', 'credit_card', 'success', '2/1/2025', 'db9fb6f1-9a21-4d0b-8117-472717c4387b'),
('3ac008aa-af18-4ad3-a898-2a2f556c392e', 'Faiz saputra', 'Jogja', 2500, 'lainnya', 1, 'Hati hati', 'credit_card', 'success', '3/1/2025', '8e21e564-531f-465f-86e1-c3214e8fb19e'),
('5f07781c-b9af-4e5e-a037-3d6f8ca4fbcf', 'putri', 'jl.palagan tentara pelajar', 15000, 'organik', 10, 'Hati hati pak', 'credit_card', 'success', '31/12/2024', '1c79811f-84da-4a96-8c99-a80a0088978a'),
('c67d5419-10ed-4985-b9d2-8868f35ef216', 'Putri', 'Jl.musi', 2500, 'lainnya', 1, 'ambil Jam 5', 'credit_card', 'success', '31/12/2024', '33b99d17-5f7c-44c3-8949-6e258dc702bf'),
('f512d05a-89ae-4372-afdb-e03075cceb04', 'Fais saputra', 'jl.palagan', 2500, 'lainnya', 1, 'djydfy6', 'credit_card', 'success', '2/1/2025', 'e252d4a3-f604-40ee-adfb-f3ec0754837d');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jemput_sampah`
--
ALTER TABLE `jemput_sampah`
  ADD PRIMARY KEY (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
