-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Des 2020 pada 10.27
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_restoran`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_level`
--

CREATE TABLE `tb_level` (
  `id_level` int(11) NOT NULL,
  `nama_level` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_level`
--

INSERT INTO `tb_level` (`id_level`, `nama_level`) VALUES
(1, 'Administrator'),
(2, 'Waiter'),
(3, 'Kasir'),
(4, 'Owner'),
(5, 'Pelanggan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_masakan`
--

CREATE TABLE `tb_masakan` (
  `id_masakan` int(11) NOT NULL,
  `nama_masakan` varchar(150) NOT NULL,
  `harga` varchar(150) NOT NULL,
  `stok` int(11) NOT NULL,
  `status_masakan` varchar(150) NOT NULL,
  `gambar_masakan` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_masakan`
--

INSERT INTO `tb_masakan` (`id_masakan`, `nama_masakan`, `harga`, `stok`, `status_masakan`, `gambar_masakan`) VALUES
(21, 'Burger', '20000', 57, 'tersedia', 'Burger.jpg'),
(25, 'Udon', '80000', 35, 'tersedia', 'Udon.jpg'),
(26, 'Noodle', '30000', 55, 'tersedia', 'Noodle.jpg'),
(27, 'French Fries', '15000', 91, 'tersedia', 'French Fries.jpg'),
(28, 'Hot Dog', '20000', 75, 'tersedia', 'Hot Dog.jpg'),
(31, 'Coca-cola', '8000', 113, 'tersedia', 'Coca-cola.jpg'),
(32, 'Hot Coffee', '5000', 123, 'tersedia', 'Hot Coffee.jpg'),
(33, 'Lemon Tea', '7000', 136, 'tersedia', 'Lemon Tea.jpg'),
(34, 'Ice Cream', '15000', 77, 'tersedia', 'Ice Cream.jpg'),
(35, 'Kebab', '25000', 52, 'tersedia', 'Kebab.jpg'),
(36, 'Pizza', '100000', 29, 'tersedia', 'Pizza.jpg'),
(37, 'Beef Steak', '200000', 36, 'tersedia', 'Beef Steak.jpg'),
(38, 'Sushi', '50000', 47, 'tersedia', 'Sushi.jpg'),
(39, 'Chicken Katsu', '40000', 62, 'tersedia', 'Chicken Katsu.jpg'),
(40, 'Sandwitch', '15000', 80, 'tersedia', 'Sandwitch.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_order`
--

CREATE TABLE `tb_order` (
  `id_order` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `id_pengunjung` int(11) NOT NULL,
  `waktu_pesan` datetime NOT NULL,
  `no_meja` int(11) NOT NULL,
  `total_harga` varchar(150) NOT NULL,
  `uang_bayar` varchar(150) DEFAULT NULL,
  `uang_kembali` varchar(150) DEFAULT NULL,
  `status_order` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_order`
--

INSERT INTO `tb_order` (`id_order`, `id_admin`, `id_pengunjung`, `waktu_pesan`, `no_meja`, `total_harga`, `uang_bayar`, `uang_kembali`, `status_order`) VALUES
(1, 1, 1, '2020-12-30 21:48:19', 0, '50000', '50000', '0', 'sudah bayar'),
(2, 7, 6, '2020-12-30 21:53:45', 1, '46000', '50000', '4000', 'sudah bayar'),
(4, 1, 13, '2020-12-30 21:59:13', 0, '200000', '200000', '0', 'sudah bayar'),
(5, 7, 15, '2020-12-31 16:16:31', 7, '50000', '50000', '0', 'sudah bayar'),
(6, 1, 17, '2020-12-31 16:17:40', 0, '75000', '80000', '5000', 'sudah bayar'),
(7, 1, 18, '2020-12-31 16:19:57', 0, '135000', '140000', '5000', 'sudah bayar'),
(8, 1, 6, '2020-12-31 16:21:57', 8, '140000', '200000', '60000', 'sudah bayar'),
(9, 1, 10, '2020-12-31 16:23:05', 0, '118000', '150000', '32000', 'sudah bayar'),
(10, 1, 6, '2020-12-31 16:23:58', 0, '215000', '250000', '35000', 'sudah bayar'),
(11, 1, 13, '2020-12-31 16:24:57', 0, '55000', '100000', '45000', 'sudah bayar'),
(13, 0, 15, '2020-12-31 16:26:53', 0, '120000', '', '', 'belum bayar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesan`
--

CREATE TABLE `tb_pesan` (
  `id_pesan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_masakan` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `status_pesan` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pesan`
--

INSERT INTO `tb_pesan` (`id_pesan`, `id_user`, `id_order`, `id_masakan`, `jumlah`, `status_pesan`) VALUES
(1, 1, 1, 38, 1, 'sudah'),
(2, 6, 2, 40, 2, 'sudah'),
(3, 6, 2, 31, 2, 'sudah'),
(7, 13, 4, 36, 2, 'sudah'),
(8, 15, 5, 27, 2, 'sudah'),
(9, 15, 5, 28, 1, 'sudah'),
(10, 17, 6, 35, 1, 'sudah'),
(11, 17, 6, 21, 1, 'sudah'),
(12, 17, 6, 26, 1, 'sudah'),
(13, 18, 7, 34, 3, 'sudah'),
(15, 18, 7, 39, 1, 'sudah'),
(16, 18, 7, 38, 1, 'sudah'),
(17, 6, 8, 21, 2, 'sudah'),
(18, 6, 8, 36, 1, 'sudah'),
(19, 10, 9, 25, 1, 'sudah'),
(20, 10, 9, 26, 1, 'sudah'),
(21, 10, 9, 31, 1, 'sudah'),
(22, 6, 10, 40, 1, 'sudah'),
(23, 6, 10, 37, 1, 'sudah'),
(24, 13, 11, 39, 1, 'sudah'),
(25, 13, 11, 34, 1, 'sudah'),
(26, 15, 13, 36, 1, ''),
(27, 15, 13, 21, 1, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_stok`
--

CREATE TABLE `tb_stok` (
  `id_stok` int(11) NOT NULL,
  `id_pesan` int(11) NOT NULL,
  `jumlah_terjual` int(11) DEFAULT NULL,
  `status_cetak` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_stok`
--

INSERT INTO `tb_stok` (`id_stok`, `id_pesan`, `jumlah_terjual`, `status_cetak`) VALUES
(1, 1, 1, 'belum cetak'),
(2, 2, 2, 'belum cetak'),
(3, 3, 2, 'belum cetak'),
(4, 4, 1, 'belum cetak'),
(5, 5, 1, 'belum cetak'),
(6, 6, 1, 'belum cetak'),
(7, 7, 2, 'belum cetak'),
(8, 8, 2, 'belum cetak'),
(9, 9, 1, 'belum cetak'),
(10, 10, 1, 'belum cetak'),
(11, 11, 1, 'belum cetak'),
(12, 12, 1, 'belum cetak'),
(13, 13, 3, 'belum cetak'),
(14, 14, 0, 'belum cetak'),
(15, 15, 1, 'belum cetak'),
(16, 16, 1, 'belum cetak'),
(17, 17, 2, 'belum cetak'),
(18, 18, 1, 'belum cetak'),
(19, 19, 1, 'belum cetak'),
(20, 20, 1, 'belum cetak'),
(21, 21, 1, 'belum cetak'),
(22, 22, 1, 'belum cetak'),
(23, 23, 1, 'belum cetak'),
(24, 24, 1, 'belum cetak'),
(25, 25, 1, 'belum cetak'),
(26, 26, 1, 'belum cetak'),
(27, 27, 1, 'belum cetak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `nama_user` varchar(150) NOT NULL,
  `id_level` int(11) NOT NULL,
  `status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `nama_user`, `id_level`, `status`) VALUES
(1, 'admin', '123', 'Riqi', 1, 'aktif'),
(6, 'pratama', '123', 'Pratama', 2, 'aktif'),
(7, 'fitri', '123', 'Fitri', 3, 'aktif'),
(8, 'fauzan', '123', 'Fauzan', 4, 'aktif'),
(9, 'almasyriqi', '123', 'Ikrom Almasyriqi', 4, 'aktif'),
(10, 'irsyad', '123', 'Irsyad', 5, 'aktif'),
(13, 'diva', '123', 'Diva Ardhia', 5, 'aktif'),
(15, 'rio', '123', 'Rio', 5, 'aktif'),
(17, 'ryan', '123', 'Ryan', 5, 'aktif'),
(18, 'rima', '123', 'Ikrima', 5, 'aktif');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_level`
--
ALTER TABLE `tb_level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indeks untuk tabel `tb_masakan`
--
ALTER TABLE `tb_masakan`
  ADD PRIMARY KEY (`id_masakan`);

--
-- Indeks untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_pengunjung` (`id_pengunjung`);

--
-- Indeks untuk tabel `tb_pesan`
--
ALTER TABLE `tb_pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indeks untuk tabel `tb_stok`
--
ALTER TABLE `tb_stok`
  ADD PRIMARY KEY (`id_stok`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_level` (`id_level`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_level`
--
ALTER TABLE `tb_level`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_masakan`
--
ALTER TABLE `tb_masakan`
  MODIFY `id_masakan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tb_pesan`
--
ALTER TABLE `tb_pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `tb_stok`
--
ALTER TABLE `tb_stok`
  MODIFY `id_stok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `tb_level` (`id_level`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
