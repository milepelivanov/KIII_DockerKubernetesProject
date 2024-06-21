insert into lokacija(adresa, broj)
values ('veselin mashlesha', 3),
('dame gruev', 12),
('bulevar partizanski odredi', 15),
('marko cepenkov', 50),
('varshavska', 1);

insert into franshiza (ime)
values ('royal burger'),
('baking bread'),
('teteks'),
('gustoso'),
('vega'),
('fitness house');

insert into kategorija (ime_kat)
values ('burger'),
('pijalok'),
('desert'),
('pica'),
('riba');
insert into kategorija (ime_kat) values('dodatok');


insert into namirnica(ime_name, dali_alergent)
values ('mleko', true),
('kikiritki', true),
('meso', false),
('sol', false),
('sekjer', false);

insert into namirnica (ime_name, dali_alergent)
values ('kechap', false), ('majonez', false);

insert into korisnik(ime, password, datum_kreiranje, username)
values ('super user', '$2y$10$CXbYkJP6IjhLnv6AyKY4t.AzovwCyUVk8hHIDSPVeO.tF3DnIb7B.', now() - interval '3 months', 'admin.admin'),
('jordan netkov', '$2y$10$0BCB02CJGqebHSVFICTK1uGbcDPtouZ.Vw4aGenulPGqxatwqhWT.', now() - interval '1 year', 'jordan.netkov'),
('mile pelivanov', '$2y$10$wGIyRyGCDNLX0uSXggh7lO8I5rWwb1L5203/tNqyTtq2kxEwW8jjS', now(), 'mile.pelivanov'),
('angela mladenovska', '$2y$10$peYQMzwDTBtRTQx9lASRY.SwhW//.oYq6SMdkxQqeDV242WFkK306' ,now() - interval '2 years', 'angela.mladenovska'),
('bube serafimovska', '$2y$10$OEOckYMZz5nTk29Azvab0uvyNgmGkWQf8mRm3FlSuweEw/fNCZmpK', now() - interval '2 months', 'bube.serafimovska'),
('kristijan veljanovski', '$2y$10$3JaymknEYIJ67WGRwjip3.YnX/cCDkjj8Vz/e18BNp9PpWlafR/tq' ,now(), 'kristijan.veljanovski'),
('martina markova', '$2y$10$W7DfkcVfI1x9PIrEssM2y.gxJjfabnDTBuJtyPXRed2OFKmCaE1Dy', now() - interval '1 month', 'martina.markova'),
('petrina stankovska', '$2y$10$WrLUTFiXvGC5mtvmzjB38uVu/r3k0.rOSj9DswN7P2vDilxrxD1BC', now(), 'petrina.stankovska');

insert into korisnik(ime, password, datum_kreiranje, username)
values ('petar ivanovski', '$2y$10$3Jk.eozUjhhxOJWQxQlSKuGUjakz3km7HjcYpQYAaFohUlacpSZgi' ,now() - interval '3 months', 'petar.ivanovski'),
('teodora sarevska', '$2y$10$GOd.dTO4Ml9fwhVjrXGhM.U6NUK/Mwblqa8pCXbfxAP.lZUqSoKQG', now() - interval '1 year', 'teodora.sarevska'),
('martina veterovska','$2y$10$t7BzJ9G1IiFzNsqZdPBHMu02kLFsZNat6xvKyUvcXdFmLSNImrvuC', now(), 'royal.lisice'),
('alex juliet', '$2y$10$1HiVIVVAUq12V9SDdGkec.QByGh6/..ElxOZvpgliYOXR4wSEd3B2' ,now() - interval '2 years', 'baking.bread'),
('sherie jessica', '$2y$10$1HiVIVVAUq12V9SDdGkec.QByGh6/..ElxOZvpgliYOXR4wSEd3B2' , now() - interval '2 months', 'fitnes.house'),
('royal lexie', '$2y$10$1HiVIVVAUq12V9SDdGkec.QByGh6/..ElxOZvpgliYOXR4wSEd3B2' , now(), 'royal.debar');



insert into vozilo(tip_vozilo)
values ('velosiped'),
('avtomobil'),
('moped');

insert into potrosuvac
values (4, 3, 1),
(5, 0, 1),
(8, 2, 2);

insert into admin_table values (1), (2), (3);

insert into dostavuvac values (6, 1, 2), (7, 2, 3), (9, 3, 1);

insert into prodazhnomesto (ime, ulica, broj, franshiza_id, admin_id)
values ('royal burger debar maalo', 'debar maalo', 5, 1, 1),
('royal burger lisice', 'novo lisice', 10, 1, 1),
('baking bread centar', 'partizanski odredi', 20, 2, 1),
('fitness house centar', 'partizanski odredi', 10, 6, 1);

insert into naplata(potrosuvac_id, dostavuvac_id, iznos, nplakjanje)
values(4, 6, 200, 'gotovo'),
(4, 7, 100, 'kartica'),
(4, 6, 50, 'gotovo'),
(8, 9, 300, 'kartica'),
(8, 6, 250, 'gotovo');


insert into naracka(dostavuvac_id, id_mesto, status, potrosuvac_id, naplata_id)
values (6, 1, 'zavrsena', 4, 1),
(7, 3, 'zavrsena', 4, 2),
(6, 2, 'zavrsena', 4, 3),
(9, 1, 'zavrsena', 8, 4),
(6, 1, 'zavrsena', 8, 5);




insert into kupon(iznos_kupon, potrosuvac_id, naracka_id, naplata_id)
values(10, 4, 1, 1),
(30, 4, 2, 2),
(15, 4, 3, 3),
(20, 8, 4, 4),
(5, 8, 5, 5);


insert into vrabotenpd(korisnik_id, id_mesto)
values(10, 1),(11, 2),(12,3),(13,4),(14,1);


insert into hrana(ime_hra, opis, vrabotenpd_id, id_mesto)
values ('royal burger', 'Burger lepce, pleskavica, pavlaka, kaskaval, slanina, kari sos, domaten sos i kromid', 10, 1),
('royal chicken', 'Burger lepce, pileski stek, pavlaka, kaskaval, slanina, kari sos, domaten sos i kromid', 14, 1),
('walter junior','Burger lepce, pleskavica, kaskaval, ajsberg, kromid, kiseli krastavicki, kecap, majonez', 12, 3),
('stek i oriz', 'Pileski stek na zar, oriz i dodatok vitaminska salata.', 13, 4);

insert into hrana(ime_hra, opis, vrabotenpd_id, id_mesto)
values('pepsi', 'Gaziran crn sok.', 10, 1);


insert into paket(vraboten_id)
values(10),(14),(10),(12),(13);


insert into zaliha(id_stavka, kolicina)
values(1, 10),
(2, 30),
(3, 5),
(4, 30);



insert into cena(id_stavka, iznos, vazi_od)
values(1, 220, now()),
(2, 230, now()),
(3, 190, now()),
(4, 250, now()),
(5, 60, now());

insert into prodazhnomesto_nudi_paket
values(1, 1), (1,2), (1, 3), (3, 4),(4, 4);

insert into naracka_sodrzi_hrana (naracka_id, id_stavka, kolicina)
values (1,1,1),(2,4,2),(3,2,1),(4,3,3),(5,1,1);

insert into paket_sodrzi_hrana (paket_id, id_stavka)
values(1, 1), (1, 2), (1, 5);

insert into hrana_e_napravena_namirnica (id_stavka, id_namirnica)
values(1, 3), (2, 3), (3,3),(4,3);

insert into naracka_ima_paket (naracka_id, paket_id, kolicina)
values (1, 1, 1), (2, 2,2),(3,1,1);

insert into hrana_pripagja_kategorija(id_stavka, id_kategorija) values (1, 1), (2,1),(3,1);

insert into namirnica_e_dodatok_hrana (id_namirnica, id_stavka)
values (6,1), (7,1),(6,2),(7,2),(6,3),(7,3);

insert into namirnica_pripagja_kategorija (id_namirnica, id_kategorija)
values (1,2), (6,6),(7,6);


