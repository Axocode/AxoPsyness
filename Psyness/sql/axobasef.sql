drop database if exists axobase;
create database axobase;
use axobase;

-- Tabla principal usuarios

create table InterUsers(
IUserNum int AUTO_INCREMENT primary key not null,
IUser varchar ( 15 ) ,
IAge varchar( 2 ) ,
IEmail varchar ( 40 ) ,
IPassword varchar (  25  ),
IImgNum varchar( 20 )
);

-- Tabla secundaria de  publicaciones

-- Contenido

create table InterPub (
PubNumId int AUTO_INCREMENT primary key not null,
PubCont text( 500 ),
PubMg int
);

-- relacion


create table InterUsersPub (
PubNumId int AUTO_INCREMENT,
IUserNum int,
foreign key (PubNumId) references InterPub (PubNumId) on delete cascade on update cascade,
foreign key (IUserNum) references InterUsers (IUserNum) on delete cascade on update cascade
);