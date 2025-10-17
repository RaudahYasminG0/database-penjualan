use penjualan;
alter table transaksi add constraint fk_idBarang foreign key (id_barang) references barang (id_barang);
alter table pembayaran add constraint fk_idTransaksi foreign key (id_transaksi) references transaksi (id_transaksi);
alter table barang modify nama_barang varchar (55);

insert into pembeli values
(001, "Prayuda", "Jalan Diponegoro","081234567890");

insert into supplier values
(31110, "cosrx-jeremy","085010203456","Jalan Melati no 12");

insert into barang values
(00001, "Moisturizer cosrx 100 ml", 170.000, 25, 31110);

insert into transaksi values
(110001,00001,001,"2025-01-01","pembelian moisturizer cosrx 100 ml");

insert into pembayaran values
(10001,"2025-01-01",50000000,110001);

