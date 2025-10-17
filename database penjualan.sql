CREATE DATABASE `penjualan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
CREATE TABLE `barang` (
  `id_barang` int NOT NULL,
  `nama_barang` varchar(55) DEFAULT NULL,
  `harga` int DEFAULT NULL,
  `stok` int DEFAULT NULL,
  `id_supplier` int DEFAULT NULL,
  PRIMARY KEY (`id_barang`),
  KEY `stok` (`stok`) /*!80000 INVISIBLE */,
  KEY `harga` (`harga`) /*!80000 INVISIBLE */,
  KEY `id_supplier` (`id_supplier`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_idSupplier` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `pembayaran` (
  `id_pembayaran` int NOT NULL,
  `tgl_bayar` date DEFAULT NULL,
  `total_bayar` int DEFAULT NULL,
  `id_transaksi` int DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran`),
  KEY `total_bayar` (`total_bayar`) /*!80000 INVISIBLE */,
  KEY `id_transaksi` (`id_transaksi`),
  CONSTRAINT `fk_idTransaksi` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `pembeli` (
  `id_pembeli` int NOT NULL,
  `nama_pembeli` varchar(40) DEFAULT NULL,
  `alamat` longtext,
  `no_telp` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`id_pembeli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `supplier` (
  `id_supplier` int NOT NULL,
  `nama_supplier` varchar(40) DEFAULT NULL,
  `no_telp` varchar(13) DEFAULT NULL,
  `alamat` longtext,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `transaksi` (
  `id_transaksi` int NOT NULL,
  `id_barang` int DEFAULT NULL,
  `id_pembeli` int DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`),
  KEY `id_barang` (`id_barang`) /*!80000 INVISIBLE */,
  KEY `id_pembeli` (`id_pembeli`),
  CONSTRAINT `fk_idBarang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  CONSTRAINT `fk_idPembeli` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id_pembeli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
