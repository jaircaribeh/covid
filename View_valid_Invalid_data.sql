-- Creating view to check amount of valid, Invalid i have in my dataset
-- 

SELECT column_name
      ,case when column_name = "CodCountry" then (select count(*) from COVID.covidGlobal where CodCountry != "ND") 
            when column_name = "Country" then (select count(*) from COVID.covidGlobal where 	Country != "ND" or Country != "Other")
            when column_name = "Region" then (select count(*) from COVID.covidGlobal where 	Region != "ND" or Region != "Other")
            else 0 end as Amount_of_valid_data
            
      ,case when column_name = "CodCountry" then (select count(*) from COVID.covidGlobal where CodCountry = "ND")
            when column_name = "Country" then (select count(*) from COVID.covidGlobal where Country = "ND" or Country = "Other")
            when column_name = "Region" then (select count(*) from COVID.covidGlobal where Region = "ND" or Region = "Other")
            else 0 end as Amount_Invalid_Data
            
      ,case when column_name = "CodCountry" 
            then round((select count(*) from COVID.covidGlobal where CodCountry = "ND") / 
                 (select count(*) from COVID.covidGlobal where CodCountry != "ND") ,4)
                 
            when column_name = "Country" 
            then round((select count(*) from COVID.covidGlobal where Country = "ND" or Country = "Other") / 
                 (select count(*) from COVID.covidGlobal where Country != "ND" or Country != "Other") ,4)
                 
            when column_name = "Region" 
            then round((select count(*) from COVID.covidGlobal where Region = "ND" or Region = "Other") / 
                 (select count(*) from COVID.covidGlobal where Region != "ND" or Region != "Other") ,4)
            else 0 end as Invalid_Data_Percentage
      
FROM
 COVID.INFORMATION_SCHEMA.COLUMNS
WHERE
 table_name="COVID.covidGlobal";



 SELECT column_name
      ,case when column_name = "State" then (select count(*) from COVID.covidBrazil where State != "ND") 
            when column_name = "City" then (select count(*) from COVID.covidBrazil where 	City != "ND" or City != "Other")
            when column_name = "Region" then (select count(*) from COVID.covidBrazil where 	Region != "ND" or Region != "Other")
            when column_name = "nameRegionHealth" then (select count(*) from COVID.covidBrazil where nameRegionHealth != "Other")
            else 0 end as Amount_of_valid_data
            
      ,case when column_name = "State" then (select count(*) from COVID.covidBrazil where State = "ND")
            when column_name = "City" then (select count(*) from COVID.covidBrazil where City = "ND" or City = "Other")
            when column_name = "Region" then (select count(*) from COVID.covidBrazil where Region = "ND" or Region = "Other")
            when column_name = "nameRegionHealth" then (select count(*) from COVID.covidBrazil where nameRegionHealth = "ND" or nameRegionHealth = "Other")
            else 0 end as Amount_Invalid_Data
            
      ,case when column_name = "State" 
            then round((select count(*) from COVID.covidBrazil where State = "ND") / 
                 (select count(*) from COVID.covidBrazil where State != "ND") ,5)
                 
            when column_name = "City" 
            then round((select count(*) from COVID.covidBrazil where City = "ND" or City = "Other") / 
                 (select count(*) from COVID.covidBrazil where City != "ND" or City != "Other") ,5)
                 
            when column_name = "Region" 
            then round((select count(*) from COVID.covidBrazil where Region = "ND" or Region = "Other") / 
                 (select count(*) from COVID.covidBrazil where Region != "ND" or Region != "Other") ,5)

            when column_name = "nameRegionHealth" 
            then round((select count(*) from COVID.covidBrazil where nameRegionHealth = "ND" or nameRegionHealth = "Other") / 
                 (select count(*) from COVID.covidBrazil where nameRegionHealth != "ND" or nameRegionHealth != "Other") ,5)
            else 0 end as Invalid_Data_Percentage
      
FROM
 COVID.INFORMATION_SCHEMA.COLUMNS
WHERE
 table_name="COVID.covidBrazil";
 
 