

drop database if exists aplikacija;
create database aplikacija default character set utf8;
# SIPANJE U CMD
# c:\xampp\mysql\bin\mysql.exe -uedunova -pedunova --default_character_set=utf8 < c:\aplikacija\aplikacija.sql



use aplikacija;

create table ulaz_robe(
sifra int not null primary key auto_increment,
 dobavljac varchar(50) not null,
 vrsta_robe int not null,
 dokument int not null,
 operater int not null,
 napomena varchar(50)not null,
datum datetime  
);

create table tehnologija_rada( 
sifra int not null primary key auto_increment,
transport varchar(50) not null,
strojna_obrada varchar (50) not null,
zavarivanje varchar (50) not null,
deformacija varchar(50) not null,
kontrola varchar(50) not null,
licenje varchar(50) not null,
prijem_robe varchar(50) not null,
laser varchar(50) not null,
montaza1 varchar(50) not null,
montaza2 varchar(50) not null,
ktl varchar(50) not null,
skladiste varchar(50) not null,
operater int not null
);

create table izlaz_robe(
sifra int not null primary key auto_increment,
lokacija varchar(50) not null,
kupac varchar(50) not null,
dokument int not null,
operater int not null,
vrsta_robe int not null,
datum datetime not null
);

create table skladiste( 
sifra int not null primary key auto_increment,
lokacija varchar(50) not null,
naziv varchar(50) not null,
operater int not null,
dokument int not null
);

create table transport(
sifra int not null primary key auto_increment,
operater int not null,
transportno_sredstvo varchar(50) not null,
dokument int not null,
napomena varchar(50) not null
);

create table dokument(
sifra int not null primary key auto_increment ,
otpremnica varchar(50) not null,
crtez varchar(50) not null,
racun varchar(50) not null,
revers varchar(50)not null,
ident_kartica varchar(50) not null
);

create table transportno_sredstvo(
sifra int not null primary key auto_increment,
motorni_vilicar varchar(50) not null,
elekteicni_vilicar varchar(50) not null,
paletni_vilicar varchar(50) not null,
bocni_vilicar varchar(50) not null,
ostalo varchar(50) not null,
operater int not null
);

create table dobavljac(
sifra int not null primary key auto_increment,
vrsta_robe int not null,
pakiranje varchar(50) not null,
kolicina char(20) not null,
naziv varchar(50)not null,
iban char(20) not null,
operater int not null
);

create table kupac(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
iban char(20)not null,
adresa int not null,
operater int not null
);

create table vrsta_robe(
sifra int not null primary key auto_increment,
kataloski_broj char(20) not null,
pakiranje int not null,
kolicina char(20) not null,
dokument int not null
);

create table pakiranje(
sifra int not null primary key auto_increment,
europaleta varchar(20) not null,
paleta_obicna varchar(20) not null,
drveni_sanduk varchar(20) not null,
pvc_paleta varchar(20) not null,
metalni_sanduk varchar(20) not null,
ostalo varchar(20) not null,
dokument int not null
);

create table adresa(
sifra int not null primary key auto_increment,
drzava varchar(30) not null,
grad varchar(30) not null,
ulica varchar(50) not null,
kucni_broj varchar(10) not null
);

create table operater(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
email varchar(50) not null
);



alter table ulaz_robe add foreign key (operater) references operater(sifra);
alter table tehnologija_rada add foreign key (operater) references operater(sifra);
alter table izlaz_robe add foreign key (operater) references operater(sifra);
alter table skladiste add foreign key (operater) references operater(sifra);
alter table transport add foreign key (operater) references operater(sifra);
alter table transportno_sredstvo add foreign key (operater) references operater(sifra);
alter table dobavljac add foreign key (operater) references operater(sifra);
alter table kupac add foreign key (operater) references operater(sifra);
alter table kupac add foreign key (adresa) references adresa(sifra);
alter table ulaz_robe add foreign key (dokument) references dokument(sifra);
alter table izlaz_robe add foreign key (dokument) references dokument(sifra);
alter table dobavljac add foreign key (vrsta_robe) references vrsta_robe(sifra);
alter table ulaz_robe add foreign key (vrsta_robe) references vrsta_robe(sifra);
alter table izlaz_robe add foreign key (vrsta_robe) references vrsta_robe(sifra);
alter table vrsta_robe add foreign key (pakiranje) references pakiranje(sifra);