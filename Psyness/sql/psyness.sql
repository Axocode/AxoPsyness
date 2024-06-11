set @old_unique_checks=@@unique_checks, unique_checks=0;
set @old_foreign_key_checks=@@foreign_key_checks, foreign_key_checks=0;
set @old_sql_mode=@@sql_mode, sql_mode='only_full_group_by,strict_trans_tables,no_zero_in_date,no_zero_date,error_for_division_by_zero,no_engine_substitution';

create schema if not exists psynessbase default character set utf8;
use psynessbase;

create table if not exists interusers (
  iusernum int not null auto_increment,
  iuser varchar(20) null default null,
  iage int null default null,
  iemail varchar(70) null default null,
  ipassword varchar(25) null default null,
  irol varchar(20) null default null,
  iimgnum varchar(20) null default 'profilesidebar3.png',
  iuserseguidores int null default '0',
  iuserseguidos int null default '0',
  iuserdescription varchar(500) null default 'esta es mi descripcion',
  iuserdate varchar(70) null default 'lunes 4 de marzo 2024',
  iuserhour varchar(70) null default '00:00:00',
  primary key (iusernum)
) engine = innodb auto_increment = 1 default character set = utf8;

create table if not exists interclinic (
  clinicnum int not null auto_increment,
  clinicuser int not null ,
  clinic varchar(70) null default null,
  clinictel varchar(25) not null,
  clinicstreetnum varchar(30) not null,
  clinicstate varchar(30) not null,
  cliniccode varchar(15) not null,
  clinicdate varchar(70) not null default 'lunes 4 de marzo 2024',
  clinichour varchar(70) not null default '00:00:00',
  cliniclatitud varchar(30) not null,
  cliniclongitud varchar(30) not null,
  clinitype varchar(10) not null,
  primary key (clinicnum),
  foreign key (clinicuser) references interusers (iusernum) on delete cascade on update cascade
) engine = innodb auto_increment = 1 default character set = utf8;

create table if not exists interlocation (
  locuser int not null,
  loclatitud varchar(25) default null,
  loclongitud varchar(25) default null,
  loctoken varchar(500) default null,
  locmensagge varchar(70) not null default 'lindo día',
  primary key (locuser),
  foreign key (locuser) references interusers (iusernum) on delete cascade on update cascade
) engine = innodb auto_increment = 1 default character set = utf8;

create table if not exists interimages (
  imagesnum int not null auto_increment,
  imagespub int not null,
  images longblob NOT null,
  imagesname varchar(255) not null,
  primary key (imagesnum),
  foreign key (imagespub) references interpub (pubnumid) on delete cascade on update cascade
) engine = innodb auto_increment = 1 default character set = utf8;

create table if not exists interclinicusers (
  id int not null auto_increment,
  iusernum int not null,
  clinicnum int not null,
  rol varchar(30) not null,
  primary key (id),
  foreign key (iusernum) references interusers (iusernum) on delete cascade on update cascade,
  foreign key (clinicnum) references interclinic (clinicnum) on delete cascade on update cascade
) engine = innodb default character set = utf8;

create table if not exists interpsico (
  psicousernum int not null,
  psiconom varchar(50) null default null,
  psicotel varchar(25) not null,
  psicostreetnum varchar(30) not null,
  psicostate varchar(30) not null,
  psicocode varchar(15) not null,
  psicoidiom varchar(30) not null,
  psicolatitud varchar(30) not null,
  psicolongitud varchar(30) not null,
  primary key (psicousernum),
  foreign key (psicousernum) references interusers (iusernum) on delete cascade
) engine = innodb default character set = utf8;


create table if not exists interemotion (
  emotionnum bigint not null auto_increment,
  emotionnumuser int not null,
  emotion varchar(10) null default null,
  emotiontagemotion varchar(50) not null,
  emotiontagsituation varchar(50) not null,
  emotioncoment varchar(100) default null,
  emotiondate text null default null,
  emotionhour text null default null,
  primary key (emotionnum),
  foreign key (emotionnumuser) references interusers (iusernum) on delete cascade
) engine = innodb auto_increment = 1 default character set = utf8;

create table if not exists interscorepub (
  scorepubnum bigint not null auto_increment,
  scorepub int not null,
  scorepubsadness varchar(5) not null,
  scorepubjoy varchar(5) not null,
  scorepublove varchar(5) not null,
  scorepubanger varchar(5) not null,
  scorepubfear varchar(5) not null,
  scorepubsurprise varchar(5) not null,
  primary key (scorepubnum),
  foreign key (scorepub) references interpub (pubnumid) on delete cascade
) engine = innodb auto_increment = 1 default character set = utf8;

create table if not exists intertagpub (
  tagpub int not null,
  tagpubsensible int not null default 0,
  tagpubautoestima int not null default 0,
  tagpubrelaciones int not null default 0,
  tagpubansiedad int not null default 0,
  tagpubdepresion int not null default 0,
  tagpubconflictos int not null default 0,
  tagpubbienestar int not null default 0,
  tagpubcrecimiento int not null default 0,
  tagpubsalud int not null default 0,
  tagpubtranstornos int not null default 0,
  tagpubrecaidas int not null default 0,
  tagpubsueno int not null default 0,
  primary key (tagpub),
  foreign key (tagpub) references interpub (pubnumid) on delete cascade
) engine = innodb default character set = utf8;

create table if not exists intertagusers (
  taguser int not null,
  tagusersensible int not null default 0,
  taguserautoestima int not null default 0,
  taguserrelaciones int not null default 0,
  taguseransiedad int not null default 0,
  taguserdepresion int not null default 0,
  taguserconflictos int not null default 0,
  taguserbienestar int not null default 0,
  tagusercrecimiento int not null default 0,
  tagusersalud int not null default 0,
  tagusertranstornos int not null default 0,
  taguserrecaidas int not null default 0,
  tagusersueno int not null default 0,
  primary key (taguser),
  foreign key (taguser) references interusers (iusernum) on delete cascade
) engine = innodb default character set = utf8;

create table if not exists interpub (
  pubnumid int not null auto_increment,
  pubcont text(1250) null default null,
  pubmg int null default '0',
  pubfavs int null default '0',
  pubcoment int null default '0',
  pubdate text null default null,
  pubhour text null default null,
  pubrol text null default null,
  primary key (pubnumid)
) engine = innodb auto_increment = 1 default character set = utf8;

create table if not exists intercoment (
  idcoment int not null auto_increment,
  comentcontenido text(500) null default null,
  comentlikes int null default 0,
  comentdislikes int null default 0,
  comentdate text null default null,
  comenthour text null default null,
  iusernum int null default null,
  pubnumid int null default null,
  foreign key (pubnumid) references interpub (pubnumid) on delete cascade,
  foreign key (iusernum) references interusers (iusernum) on delete cascade,
  primary key (idcoment)
) engine = innodb default character set = utf8;

create table if not exists interfav (
  favidpub int null default null,
  faviduser int null default null,
  foreign key (favidpub) references interpub (pubnumid) on delete cascade,
  foreign key (faviduser) references interusers (iusernum) on delete cascade
) engine = innodb default character set = utf8;

create table if not exists interflow (
  flowseguidoresid int null default null,
  flowseguidoid int null default null,
  foreign key (flowseguidoresid) references interusers (iusernum) on delete cascade,
  foreign key (flowseguidoid) references interusers (iusernum) on delete cascade
) engine = innodb default character set = utf8;

create table if not exists interuserspub (
  pubnumid int not null auto_increment,
  iusernum int null default null,
  foreign key (pubnumid) references interpub (pubnumid) on delete cascade,
  foreign key (iusernum) references interusers (iusernum) on delete cascade,
  primary key (pubnumid)
) engine = innodb auto_increment = 1 default character set = utf8;

create table if not exists interlove (
  loveidpub int null default null,
  loveiduser int null default null,
  foreign key (loveidpub) references interpub (pubnumid) on delete cascade,
  foreign key (loveiduser) references interusers (iusernum) on delete cascade
) engine = innodb default character set = utf8;

set sql_mode=@old_sql_mode;
set foreign_key_checks=@old_foreign_key_checks;
set unique_checks=@old_unique_checks;