-- PREPARE BRAZILIAN COVID DATABASE
-- I am creating a new table and loading all the data for the table Brazil into to the new table covidBrazil
-- changed null valeu to ND  and change Words in Portugues to words in English and reorganised tha date.

create or replace table COVID.covidBrazil AS (
  select case when regiao is null then "ND" else replace(regiao,"'","") end as Region
        ,case when estado is null then "ND" else replace(estado,"'","") end as State
        ,case when municipio is null then "ND"  end as City
        ,case when coduf is null then "ND"  end as CodUF
        ,codmun as CodCity
        ,codRegiaoSaude as codRegionHealth
        ,case when nomeRegiaoSaude is null then "ND" else replace(nomeRegiaoSaude,"'","")	end as nameRegionHealth
        ,FORMAT_DATE("%d/%m/%Y", data) as Date
        ,case when CHAR_LENGTH(concat(extract(year from data),extract(month from data))) <= 5 then concat(extract(year from data),"0",extract(month from data))
          else concat(extract(year from data),extract(month from data)) end as YearMonth
        ,semanaEpi as weekEpidemic
        ,populacaoTCU2019 as Polulation
        ,casosAcumulado as casesAccumulated
        ,casosNovos as newCases
        ,obitosAcumulado as deathsAccumulated
        ,obitosNovos as newdeaths
        ,Recuperadosnovos as recoveredNew
        ,emAcompanhamentoNovos as inFollow_upNew
        ,interior_metropolitana as interior_metropolitan
  from disco-light-354711.COVID.Brazil
);

select distinct 	City from disco-light-354711.COVID.covidBrazil where City is null;

-- PREPARE COVID GLOBAL DATABASE 
-- I am creating a new table and loading all the data for the table World into to the new table covidGlobal
-- changed null valeu to ND and reorganised tha date and Tittle.

create or replace table COVID.covidGlobal AS (
  select FORMAT_DATE("%d/%m/%Y", Date_reported) as  DateReported
        ,case when CHAR_LENGTH(concat(extract(year from Date_reported),extract(month from Date_reported))) <= 5 then concat(extract(year from Date_reported),"0",extract(month from Date_reported))
          else concat(extract(year from Date_reported),extract(month from Date_reported)) end as YearMonth
       ,case when Country_code =" " then "ND" else Country_code end as CodCountry
       ,case when Country = " " then "ND" else Country end as Country
       ,case when WHO_region = " " then "ND" else WHO_region end as Region
       ,New_cases as NewCases
       ,Cumulative_cases as CumulativeCases
       ,New_deaths as NewDeaths
       ,Cumulative_deaths as CumulativeDeaths
  from disco-light-354711.COVID.World
);