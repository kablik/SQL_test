/*GameStudio*/
drop table score;
drop table raiting;
drop table komentar;
drop table game;
drop table pouzivatel;

drop sequence idgame;
drop sequence iduser;
drop sequence idscore;
drop sequence idcoment;

drop view wu1;
drop view wu2;
drop view wu3;
drop view wu4;
drop view wu5;
drop view wu6;
drop view wu7;
drop view wu8;
drop view wu9;
drop view wu10;
drop view wu11;
drop view wu12;
drop view wu13;
drop view wu14;
drop view wu15;


/*Creating tables:*/
create table pouzivatel(id_user int primary key, user_name varchar(50) not null unique, user_pass varchar (8) not null, email varchar (50) not null unique, 
datum_registracie date not null, is_autor char default 'N' check (is_autor in ('Y','N')));

create table game(id_game int PRIMARY KEY, game_name varchar(50) not null unique, autor int not null, datum_pridania date not null, url_hry varchar(200) not null unique, 
FOREIGN KEY(autor) REFERENCES pouzivatel(id_user));

create table score(id_score int primary key, score int not null check(score >=0 and score < 1000000), id_game int not null, id_user int not null, datum_nahrania date not null, 
FOREIGN KEY(id_game) REFERENCES game(id_game), FOREIGN KEY(id_user) REFERENCES pouzivatel(id_user));

create table raiting(raiting int not null check(raiting>=1 and raiting <=5), id_game int not null, id_user int not null, primary key (id_user, id_game), 
FOREIGN KEY(id_game) REFERENCES game(id_game), FOREIGN KEY(id_user) REFERENCES pouzivatel(id_user));

create table komentar(id_komentara int primary key, id_game int not null, id_user int not null, komentar varchar(500) not null,
FOREIGN KEY(id_game) REFERENCES game(id_game), FOREIGN KEY(id_user) REFERENCES pouzivatel(id_user));


/*Inserting into tables:*/
CREATE SEQUENCE idgame START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE iduser START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE idscore START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE idcoment START WITH 1 INCREMENT BY 1;

insert into pouzivatel (id_user, user_name, user_pass, email, DATUM_REGISTRACIE, IS_AUTOR) values (iduser.nextval, 'Peter Pavol', '12345678', 'peter.pavol@gmail.com', '01/01/2001', 'Y');
insert into pouzivatel (id_user, user_name, user_pass, email, DATUM_REGISTRACIE, IS_AUTOR) values (iduser.nextval, 'nerty', '23456789', 'nejakyemail@gmail.com', '01/02/2001', 'N');
insert into pouzivatel (id_user, user_name, user_pass, email, DATUM_REGISTRACIE, IS_AUTOR) values (iduser.nextval, 'Dalibor Adamèík', '55555', 'r4d1k@gmail.com', '01/03/2001', 'Y');
insert into pouzivatel (id_user, user_name, user_pass, email, DATUM_REGISTRACIE) values (iduser.nextval, 'andrew', '66666', 'andrew.1@gmail.com', '01/04/2001');
insert into pouzivatel (id_user, user_name, user_pass, email, DATUM_REGISTRACIE) values (iduser.nextval, 'deathbringer', '1365447', 'dede.cata@gmail.com', '01/05/2001');
/*select * from POUZIVATEL;*/
insert into game (id_game, game_name, autor, datum_pridania, url_hry) values (idgame.nextval, 'minesweeper', '1', '28/06/2016', 'www.minesweeper.com');
insert into game (id_game, game_name, autor, datum_pridania, url_hry) values (idgame.nextval, 'DooM', '1', '28/05/2016', 'www.doom.com');
insert into game (id_game, game_name, autor, datum_pridania, url_hry) values (idgame.nextval, 'WoW', '1', '28/09/2016', 'www.worldofwarcraft.com');
insert into game (id_game, game_name, autor, datum_pridania, url_hry) values (idgame.nextval, 'Solitare', '2', '28/08/2016', 'www.solitare.com');
insert into game (id_game, game_name, autor, datum_pridania, url_hry) values (idgame.nextval, 'Bomberman', '2', '28/07/2016', 'www.bomberman.com');
/*select * from game;*/

insert into score (id_score, score, id_game, id_user, datum_nahrania) values (idscore.nextval, 12564, 1, 4, '28/07/2016');
insert into score (id_score, score, id_game, id_user, datum_nahrania) values (idscore.nextval, 22564, 1, 4, '29/07/2016');
insert into score (id_score, score, id_game, id_user, datum_nahrania) values (idscore.nextval, 32564, 2, 1, '21/07/2016');
insert into score (id_score, score, id_game, id_user, datum_nahrania) values (idscore.nextval, 42564, 1, 1, '22/07/2016');
insert into score (id_score, score, id_game, id_user, datum_nahrania) values (idscore.nextval, 52564, 2, 2, '23/07/2016');
insert into score (id_score, score, id_game, id_user, datum_nahrania) values (idscore.nextval, 62564, 3, 1, '24/07/2016');
insert into score (id_score, score, id_game, id_user, datum_nahrania) values (idscore.nextval, 72564, 3, 3, '25/07/2016');
insert into score (id_score, score, id_game, id_user, datum_nahrania) values (idscore.nextval, 82564, 4, 3, '26/07/2016');
insert into score (id_score, score, id_game, id_user, datum_nahrania) values (idscore.nextval, 92564, 4, 2, '27/07/2016');
insert into score (id_score, score, id_game, id_user, datum_nahrania) values (idscore.nextval, 56984, 4, 4, '28/07/2016');
/*select * from score;*/

insert into raiting(raiting, id_game, id_user) values (1, 1, 1);
insert into raiting(raiting, id_game, id_user) values (2, 2, 4);
insert into raiting(raiting, id_game, id_user) values (4, 3, 3);
insert into raiting(raiting, id_game, id_user) values (4, 2, 3);
insert into raiting(raiting, id_game, id_user) values (4, 4, 2);
insert into raiting(raiting, id_game, id_user) values (5, 4, 1);
insert into raiting(raiting, id_game, id_user) values (3, 1, 2);
/*select * from raiting;*/

insert into komentar (id_komentara, id_game, id_user, komentar) values (idcoment.nextval, 1, 1, 'ok');
insert into komentar (id_komentara, id_game, id_user, komentar) values (idcoment.nextval, 1, 2, 'not ok');
insert into komentar (id_komentara, id_game, id_user, komentar) values (idcoment.nextval, 1, 3, 'celkom ok');
insert into komentar (id_komentara, id_game, id_user, komentar) values (idcoment.nextval, 1, 4, 'uslo');
insert into komentar (id_komentara, id_game, id_user, komentar) values (idcoment.nextval, 2, 1, 'mohla byt lepsia');
insert into komentar (id_komentara, id_game, id_user, komentar) values (idcoment.nextval, 2, 2, 'pecka');
insert into komentar (id_komentara, id_game, id_user, komentar) values (idcoment.nextval, 3, 3, 'luxus hra');
insert into komentar (id_komentara, id_game, id_user, komentar) values (idcoment.nextval, 3, 1, 'krdy bude dalsie vydanie?');
insert into komentar (id_komentara, id_game, id_user, komentar) values (idcoment.nextval, 4, 2, 'chcem datadisk :D :D :D');
insert into komentar (id_komentara, id_game, id_user, komentar) values (idcoment.nextval, 4, 1, 'jej solitare');
/*select * from komentar;*/

/*SELECTING FROIM TABLES:*/
/*1.       Zoznam hráèov utriedený pod¾a dátumu registrácie*/
create view wu1 as
select * from pouzivatel order by DATUM_REGISTRACIE;

/*2.       Zoznam hier*/
create view wu2 as
select game_name from game;

/*3.       Zoznam hier s komentármi a menami používate¾ov*/
create view wu3 as
select k.komentar, g.game_name, p.USER_NAME from komentar k join pouzivatel p on p.ID_USER = k.ID_USER join game g on k.ID_GAME = g.ID_GAME;

/*4.       Hráè s najdlhším menom*/
create view wu4 as
select user_name from pouzivatel where length(user_name) = (select max(length(user_name)) from pouzivatel);

/*5.       Zoznam hier, ktoré nehral nikto (nemajú záznam v Score)*/
create view wu5 as
select g.game_name, s.score from game g left join score s on s.ID_GAME = g.ID_GAME where s.score is null;

/*6.       Zoznam používate¾ov, ktorí nehodnotili žiadnu hru*/
create view wu6 as
select p.user_name, s.score from pouzivatel p left join score s on s.ID_USER = p.ID_USER where s.score is null;

/*7.       Zoznam používate¾ov, ktorí nehodnotili jednu konkrétnu hru (napr. Minesweeper)*/
                /*create view g_u as
                select p.user_name, g.game_name, g.ID_GAME, p.id_user from game g cross join pouzivatel p; 
                select gu.user_name, gu.game_name, r.RAITING from g_u gu left join raiting r on r.ID_user = gu.ID_user and r.ID_GAME = gu.ID_GAME where r.RAITING is null and gu.GAME_NAME like 'minesweeper';*/
/* alebo aj takto */
create view wu7 as
select gu.user_name, gu.game_name, r.RAITING from (select p.user_name, g.game_name, g.ID_GAME, p.id_user from game g cross join pouzivatel p) gu 
left join raiting r on r.ID_user = gu.ID_user and r.ID_GAME = gu.ID_GAME where r.RAITING is null and gu.GAME_NAME like 'minesweeper';

/*8.       Poèet hier, poèet hráèov, poèet komentárov, poèet hodnotení*/
create view wu8 as
select * from 
(select count(*) as game_count from game) natural join 
(select count(*) as user_count from pouzivatel) natural join 
(select count(*) as raiting_count from raiting)natural join 
(select count(*) as koment_count from komentar);

/*9.       Najstaršia hra*/
create view wu9 as
select game_name from game where DATUM_PRIDANIA = (select min(datum_pridania) from game);

/*10.   Zoznam hier s ich priemerným ratingom a poètom hodnotení*/
create view wu10 as
select g.game_name, count(r.raiting) as pocet_hodnoteni, avg(r.raiting) as priemerne_hodnotenie from game g join raiting r on r.ID_GAME = g.ID_GAME group by g.game_name;

/*11.   Najviac komentované hry*/
create view wu11 as
select nazov_hry from (select g.game_name as nazov_hry, count(g.game_name) as pocet_komentarov from game g join komentar k on k.ID_GAME = g.ID_GAME group by g.GAME_NAME)
where pocet_komentarov = (select max(pocet_komentarov) from (select g.game_name as nazov_hry, count(g.game_name) as pocet_komentarov from game g join komentar k on k.ID_GAME = g.ID_GAME group by g.GAME_NAME));

/*12.   Zoznam hráèov s ich poètom hraním hier a celkovým skóre, ktoré nahrali */
create view wu12 as
select p.user_name, sum(s.score) as totalne_nahrate_score, count(s.id_user) as pocet_hrani_hier from score s join pouzivatel p on s.ID_USER = p.ID_USER group by p.user_name;

/*13.   Meno hráèa, ktorý hral naposledy hru*/
create view wu13 as
select p.user_name, s.DATUM_NAHRANIA from pouzivatel p join score s on s.ID_USER = p.ID_USER where s.DATUM_NAHRANIA = (select max(datum_nahrania) from score);

/*14.   Poèet komentárov pre najob¾úbenejšiu hru*/
                /*create view hry_a_hodnotenia as
                select g.ID_GAME as id_hry, g.game_name as meno_hry, avg(r.raiting) as priemerne_hodnotenie from game g join raiting r on r.ID_GAME = g.ID_GAME group by g.game_name, g.ID_GAME;
                create view best_game as
                select id_hry, meno_hry, priemerne_hodnotenie from 
                (hry_a_hodnotenia) 
                where priemerne_hodnotenie = (select max(priemerne_hodnotenie) from 
                (hry_a_hodnotenia));
                select meno_hry, count(k.komentar) from best_game b join komentar k on b.ID_HRY = k.id_game group by b.MENO_HRY;*/
/* alebo  aj takto */
create view wu14 as
select meno_hry, count(k.komentar) as pocet_komentarov from (select id_hry, meno_hry, priemerne_hodnotenie from 
(select g.ID_GAME as id_hry, g.game_name as meno_hry, avg(r.raiting) as priemerne_hodnotenie from game g join raiting r on r.ID_GAME = g.ID_GAME group by g.game_name, g.ID_GAME) 
where priemerne_hodnotenie = (select max(priemerne_hodnotenie) from 
(select g.ID_GAME as id_hry, g.game_name as meno_hry, avg(r.raiting) as priemerne_hodnotenie from game g join raiting r on r.ID_GAME = g.ID_GAME group by g.game_name, g.ID_GAME))) b 
join komentar k on b.ID_HRY = k.id_game group by b.MENO_HRY;

/*15.   Mená hráèov s poètom komentárov, ktoré pridali k hrám*/
create view wu15 as
select p.user_name, count(k.komentar) as pocet_komentarov from pouzivatel p join komentar k on p.ID_USER = k.ID_USER group by p.user_name;

/*MAKING INDEXES:*/
/*Kedze nie je mozne vytvarat indexy nad primary key a nad unique stlpcami, tak niekde su vytvorene nejake navyse*/
CREATE INDEX ix_komentar ON komentar (id_komentara, id_game);
CREATE INDEX ix_pouzivatel ON pouzivatel (user_pass);
CREATE INDEX ix_score ON score (score);
CREATE INDEX ix_raiting ON raiting (raiting);

/*SHOWING VIEWS*/
/*
select * from wu1;
select * from wu2;
select * from wu3;
select * from wu4;
select * from wu5;
select * from wu6;
select * from wu7;
select * from wu8;
select * from wu9;
select * from wu10;
select * from wu11;
select * from wu12;
select * from wu13;
select * from wu14;
select * from wu15;
*/
