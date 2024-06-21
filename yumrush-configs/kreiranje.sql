
drop table namirnica_pripagja_kategorija;
drop table namirnica_e_dodatok_hrana;
drop table hrana_pripagja_kategorija;
drop table naracka_ima_paket;
drop table hrana_e_napravena_namirnica;
drop table paket_sodrzi_hrana;
drop table naracka_sodrzi_hrana;
drop table prodazhnomesto_nudi_paket;
drop table cena;
drop table zaliha;
drop table paket;
drop table hrana;
drop table vrabotenpd;
drop table kupon;
drop table naracka;
drop table naplata;
drop table prodazhnomesto;
drop table dostavuvac;
drop table admin_table;
drop table potrosuvac;
drop table vozilo;
drop table korisnik;
drop table namirnica;
drop table kategorija;
drop table franshiza;
drop table lokacija;


create table lokacija(
	lokacija_id serial,
	adresa varchar(100) not null,
	broj integer not null,
	constraint pk_lokacija primary key(lokacija_id)
);


create table franshiza(
	franshiza_id serial,
	ime varchar(100) not null,
	constraint pk_franshiza primary key(franshiza_id)
);
create table kategorija(
	id_kategorija serial,
	ime_kat varchar(100) not null,
	constraint pk_kategorija primary key(id_kategorija)
);
create table namirnica(
	id_namirnica serial,
	ime_name varchar(100) not null,
	dali_alergent boolean not null,
	constraint pk_namirnica primary key(id_namirnica)
);


create table korisnik(
	korisnik_id serial,
	ime varchar(100),
	password varchar(100),
	datum_kreiranje date not null,
	username varchar(100) not null,
	constraint korisnik_pk primary key(korisnik_id)
);
create table vozilo(
	vozilo_id serial,
	tip_vozilo varchar(100) not null,
	constraint vozilo_pk primary key(vozilo_id)
);

create table potrosuvac(
	korisnik_id integer not null,
	broj_naracki integer not null,
	lokacija_id integer,
	constraint potrosuvac_pk primary key(korisnik_id),
	constraint korisnik_fk foreign key(korisnik_id)
		references korisnik(korisnik_id),
	constraint lokacija_fk foreign key(lokacija_id)
		references lokacija(lokacija_id)
	
);

create table admin_table(
	korisnik_id integer not null,
	constraint admin_pk primary key(korisnik_id),
	constraint korisnik_fk foreign key(korisnik_id)
		references korisnik(korisnik_id)
);


create table dostavuvac(
	korisnik_id integer not null,
	admin_id integer not null,
	vozilo_id integer,
	constraint dostavuvac_pk primary key(korisnik_id),
	constraint korisnik_fk foreign key(korisnik_id)
		references korisnik(korisnik_id),
	constraint admin_fk foreign key(admin_id)
		references admin_table(korisnik_id),
	constraint vozilo_fk foreign key(vozilo_id)
		references vozilo(vozilo_id)
);

create table prodazhnomesto(
	id_mesto serial,
	ime varchar(100) not null,
	ulica varchar(100) not null,
	broj integer not null,
	franshiza_id integer,
	admin_id integer not null,
	constraint pk_prodazhnomesto primary key(id_mesto),
	constraint fk_franshiza foreign key(franshiza_id)
		references franshiza(franshiza_id),
	constraint admin_fk foreign key(admin_id)
		references admin_table(korisnik_id)
);

create table naplata(
	naplata_id serial,
	potrosuvac_id integer not null,
	dostavuvac_id integer not null,
	iznos integer not null,
	nplakjanje varchar(100) not null,
	datum_naplata timestamp,
	constraint naplata_pk primary key(naplata_id),
	constraint potrosuvac_fk foreign key(potrosuvac_id)
		references potrosuvac(korisnik_id),
	constraint dostavuvac_fk foreign key(dostavuvac_id)
		references dostavuvac(korisnik_id),
	CONSTRAINT iznost_pog_0 CHECK (iznos > 0)
	
);



create table naracka(
	naracka_id serial,
	dostavuvac_id integer,
	id_mesto integer not null,
	status varchar(100),
	potrosuvac_id integer not null,
	naplata_id integer,
	datum_naracka timestamp,
	nacinplakjanje varchar(100),
	constraint naracka_pk primary key(naracka_id),
	constraint dostavuvac_fk foreign key(dostavuvac_id)
		references dostavuvac(korisnik_id),
	constraint prodazhnomest_fk foreign key(id_mesto)
		references prodazhnomesto(id_mesto),
	constraint potrosuvac_fk foreign key(potrosuvac_id)
		references potrosuvac(korisnik_id),
	constraint naplata_fk foreign key(naplata_id)
		references naplata(naplata_id)
	
);
create table kupon(
	kupon_id serial,
	iznos_kupon integer not null,
	potrosuvac_id integer,
	naracka_id integer,
	naplata_id integer,
	constraint kupon_pk primary key(kupon_id),
	constraint potrosuvac_fk foreign key(potrosuvac_id)
		references potrosuvac(korisnik_id),
	constraint naracka_fk foreign key(naracka_id)
		references naracka(naracka_id),
	constraint naplata_fk foreign key(naplata_id)
		references naplata(naplata_id),
	CONSTRAINT iznos_kup_pog_0 CHECK (iznos_kupon > 0)
		
);
create table vrabotenpd(
	korisnik_id integer,
	id_mesto integer,
	constraint vrabotenpd_pk primary key(korisnik_id),
	constraint korisnik_fk foreign key(korisnik_id)
		references korisnik(korisnik_id),
	constraint prodaznomesto_fk foreign key(id_mesto)
		references prodazhnomesto(id_mesto)
);
create table hrana(
	id_stavka serial,
	ime_hra varchar(100) not null,
	opis varchar (200) not null,
	vrabotenpd_id integer not null,
	id_mesto integer, 
	constraint hrana_pk primary key(id_stavka),
	constraint vraboten_fk foreign key(vrabotenpd_id)
		references vrabotenpd(korisnik_id),
	constraint prodaznomesto_fk foreign key(id_mesto)
		references prodazhnomesto(id_mesto)
);

create table paket(
	paket_id serial,
	vraboten_id integer not null,
	constraint paket_pk primary key(paket_id),
	constraint vraboten_fk foreign key(vraboten_id)
		references vrabotenpd(korisnik_id)
);

create table zaliha(
	broj_zaliha serial,
	id_stavka integer,
	kolicina integer not null,
	constraint zaliha_pk primary key(broj_zaliha, id_stavka),
	constraint hrana_fk foreign key(id_stavka) 
		references hrana(id_stavka),
	CONSTRAINT kolicina_pog_0 CHECK(kolicina > 0)
);


create table cena(
	broj_cena serial,
	id_stavka integer,
	iznos integer not null,
	vazi_od date not null,
	vazi_do date,
	constraint cena_pk primary key(broj_cena, id_stavka),
	constraint hrana_fk foreign key(id_stavka)
		references hrana(id_stavka),
	CONSTRAINT iznos_pog_0 CHECK (iznos > 0),
	CONSTRAINT vazi_od_po_vazi_do CHECK (vazi_od < vazi_do)
);


create table prodazhnomesto_nudi_paket(
	id_mesto integer,
	paket_id integer,
	constraint pnp_pk primary key(id_mesto, paket_id),
	constraint prodazhnomesto_fk foreign key(id_mesto)
		references prodazhnomesto(id_mesto),
	constraint paket_fk foreign key(paket_id)
		references paket(paket_id)
);

create table naracka_sodrzi_hrana(
	naracka_id integer,
	id_stavka integer,
	kolicina integer not null,
	constraint nsh_pk primary key(naracka_id, id_stavka),
	constraint naracka_fk foreign key(naracka_id)
		references naracka(naracka_id),
	constraint hrana_fk foreign key(id_stavka)
		references hrana(id_stavka),
	CONSTRAINT kolicina_pog_0 CHECK (kolicina > 0) 
);

create table paket_sodrzi_hrana(
	paket_id integer,
	id_stavka integer,
	constraint psh_pk primary key(paket_id, id_stavka),
	constraint paket_fk foreign key(paket_id)
		references paket(paket_id),
	constraint hrana_fk foreign key(id_stavka)
		references hrana(id_stavka)
);

create table hrana_e_napravena_namirnica(
	id_stavka integer,
	id_namirnica integer,
	constraint hrana_e_nap_nam_pk primary key(id_stavka, id_namirnica),
	constraint hrana_fk foreign key(id_stavka)
		references hrana(id_stavka),
	constraint namirnica_fk foreign key(id_namirnica)
		references namirnica(id_namirnica)
);

create table naracka_ima_paket(
	naracka_id integer,
	paket_id integer,
	kolicina integer not null,
	constraint naracka_ima_paket_pk primary key(naracka_id, paket_id),
	constraint naracaka_fk foreign key(naracka_id)
		references naracka(naracka_id),
	constraint paket_fk foreign key(paket_id)
		references paket(paket_id),
	CONSTRAINT kolicina_pog_0 CHECK (kolicina > 0)
);

create table hrana_pripagja_kategorija(
	id_stavka integer,
	id_kategorija integer,
	constraint hrana_prp_kat_pk primary key(id_stavka, id_kategorija),
	constraint hrana_fk foreign key(id_stavka)
		references hrana(id_stavka),
	constraint kategorija_fk foreign key(id_kategorija)
		references kategorija(id_kategorija)
);

create table namirnica_e_dodatok_hrana(
	id_namirnica integer,
	id_stavka integer,
	constraint namir_e_dot_hran_pk primary key(id_namirnica, id_stavka),
	constraint namirnica_fk foreign key(id_namirnica)
		references namirnica(id_namirnica),
	constraint hrana_fk foreign key(id_stavka)
		references hrana(id_stavka)
);

create table namirnica_pripagja_kategorija(
	id_namirnica integer,
	id_kategorija integer,
	constraint namirnica_prip_kat_pk primary key(id_namirnica, id_kategorija),
	constraint namirnica_fk foreign key(id_namirnica)
		references namirnica(id_namirnica),
	constraint kategorija_fk foreign key(id_kategorija)
		references kategorija(id_kategorija)
);