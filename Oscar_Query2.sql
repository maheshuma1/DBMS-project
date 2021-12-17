use OSCAR;

create index ndx_actor
on Actor(act_fname);

create index ndx_awm
on Award_Winning_movies(movie_id);

create index ndx_Oscar_held
on Oscar_held(oh_year);

create view [Oscar_movies] as
select awm.film_name, a.act_fname, at.actress_fname, awm.Oscar_held_oh_year
from Award_Winning_movies awm, Actor a, Actress at, Oscar_held o, film_cast fc
where awm.movie_id=fc.film_id and a.act_id=fc.Actor_act_id and at.Actress_id=fc.Actress_Actress_id;

create view [Oscar_movies_premiere] as
select awm.film_name, fn.premiere_yr
from Award_Winning_movies awm, Films_nominated fn
where awm.movie_id=fn.Award_Winning_movies_movie_id;

select * from [Oscar_movies];
select * from [Oscar_movies_premiere];


drop view [Oscar_movies];

insert into film_cast values(1,128,103,21);
insert into film_cast values(2,129,104,22);

insert into Actor values(128,'leonardo','DeCaprio',47);
insert into Actor values(129,'Andy','Serkis',57);

insert into Actress values(103,'Kate','Winslet',46);
insert into Actress values(104,'Amiah','Miller',17);

insert into Oscar_held values(2000,20,4000,'los angeles');
insert into Oscar_held values(2005,25,5000,'Hollywood');

delete from Films_nominated;
insert into Films_nominated values(100,1997,1);
insert into Films_nominated values(101,2001,2);
insert into Films_nominated values(103,2005,null);

CREATE TABLE Films_nominated (
    film_id int NOT NULL,
    premiere_yr int NOT NULL,
    Award_Winning_movies_movie_id int NULL,
    CONSTRAINT Films_nominated_pk PRIMARY KEY (film_id)
);


select * from Actor;
select * from Actress;
select * from Award_Winning_movies;
select * from film_cast;
select * from Films_nominated;
select * from Oscar_held;

create trigger Print_record
on Award_Winning_movies
for delete
as
	print 'Record Deleted!!';
go

delete from Award_Winning_movies where movie_id=3;

begin tran
delete from Actor
where act_id=126
select @@TRANCOUNT as OpenTransactionsCount
commit tran

select @@TRANCOUNT as OpenTransactionsCount;

backup database OSCAR
to disk='I:\OSCAR.bak';
