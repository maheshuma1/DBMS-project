
insert into Actor values(123,'leonardo','DeCaprio',56);

insert into Actress values(54,'kate','winslet',39);

update Actor set act_id=214 where act_fname='leonardo';

update Actress set actress_age=35 where actress_fname='kate';

delete from actor where act_id=214;

select * from actor;

SELECT act_id, film_id from Actor INNER join film_cast on act_id=film_cast;

select act_id,actress_id,oh_year from Actor,Actress,Oscar_held;