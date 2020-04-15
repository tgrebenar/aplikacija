

drop database if exists ppu_m;
create database ppu_m default character set utf8;
# SIPANJE U CMD
# c:\xampp\mysql\bin\mysql.exe -uedunova -pedunova --default_character_set=utf8 < c:\zavrsnirad\ppu_m.sql

use ppu_m;

create table proizvod(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
serijski_broj char(10) not null,
lot_proizvodnje varchar(50) not null,
pocetak datetime not null,
narudzba int not null
);

create table narudzba (
sifra int not null primary key auto_increment,
broj_narudzbe varchar(15) not null,
kupac varchar (50) not null,
lot_proizvodnje varchar(52) not null,
proizvod int not null
);




alter table proizvod add foreign key (narudzba) references narudzba(sifra);
alter table narudzba add foreign key (proizvod) references proizvod(sifra);