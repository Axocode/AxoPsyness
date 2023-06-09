drop database if exists axobase;
create database axobase;
use axobase;

-- Tabla principal usuarios

create table interusers(
iusernum int AUTO_INCREMENT primary key not null,
iuser varchar ( 15 ) ,
iage varchar( 2 ) ,
iemail varchar ( 40 ) ,
ipassword varchar (  25  ),
iimgnum varchar( 20 ),
iuserseguidores int default 0,
iuserseguidos int default 0
);

-- Tabla secundaria de  publicaciones

-- Contenido

create table interpub (
pubnumid int AUTO_INCREMENT primary key not null,
pubcont text( 500 ),
pubmg int default 0
);

-- relacion
create table interfav(
favidpub int,
faviduser int,
foreign key (favidpub) references interpub(pubnumid) on delete cascade on update cascade,
foreign key (faviduser) references interusers(iusernum) on delete cascade on update cascade
);

create table interflow (
flowseguidoresid int,
flowseguidoid int,
foreign key (flowseguidoresid) references interusers(iusernum) on delete cascade on update cascade,
foreign key (flowseguidoid) references interusers(iusernum) on delete cascade on update cascade
);

create table interuserspub (
pubnumid int auto_increment,
iusernum int,
foreign key (pubnumid) references InterPub (pubnumid) on delete cascade on update cascade,
foreign key (iusernum) references InterUsers (iusernum) on delete cascade on update cascade
);

insert into interusers( iuser, iage, iemail, ipassword) values
('Axocode','99','axocode0@gmail.com','ladechambearnoselasupo');