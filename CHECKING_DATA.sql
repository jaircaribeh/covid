
-- CHECKING DATA
SELECT regiao as Regiao ,count (*)as qtde
FROM`disco-light-354711.COVID.Brazil`
group by 1 ;

SELECT * from `disco-light-354711.COVID.Brazil`;

SELECT * from `disco-light-354711.COVID.Brazil`;

SELECT regiao as Regiao ,count (*)as qtde
FROM`disco-light-354711.COVID.Brazil`
group by 1
UNION ALL 
select "Total" as Total 
                  ,count(*)
from `disco-light-354711.COVID.Brazil`;


SELECT estado as Estado ,count (*)as qtde
FROM`disco-light-354711.COVID.Brazil`
group by 1
UNION ALL 
select "Total" as Total 
                  ,count(*)
from `disco-light-354711.COVID.Brazil`;


select * from `disco-light-354711.COVID.Brazil` 
where estado is null;

SELECT case when estado is null then "ND" else replace(estado, "'","") end as Estados 
,count(*)as qtde 
,count (*)/ (select count(*)FROM`disco-light-354711.COVID.Brazil`) as Perc
FROM`disco-light-354711.COVID.Brazil`
group by 1
UNION ALL 
select "Total" as Total 
                  ,count(*) as qtde
                  ,count (*)as Perc
from `disco-light-354711.COVID.Brazil`;