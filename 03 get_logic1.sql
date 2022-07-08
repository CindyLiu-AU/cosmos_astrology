create or replace function get_logic1(customer_id_input int) --input parameter is customer_id
returns setof customer as $$ 
begin 
    insert into logic1( 
      customer_id,  --duplicate from the 'customer' table
      birth_location,  --duplicate from the 'customer' table
      birth_datetime,  --duplicate from the 'customer' table
      birth_gmt0,  --convert birth_datetime(GMT8) into GMT0
      birth_spn,  --spn = birth_since_pre_noon 
      birth_lat,  --the latitude of the birth location
      birth_lng,  --the longtitude of the birth location
      four_mins_every_degree --4 mins for every degree since Greenwich
      ) 
    select  customer_id,  
            birth_location,  
            birth_datetime, 
            (--birth_gmt0 
              select  birth_datetime + INTERVAL '-8 hour' 
            ), 

            (--birth_spn 
              select  
                case --when birth_gmt0 >=12, birth_gmt0 - 12 hours, else birth_gmt0 +12 hours 
                  when extract(hour from(select birth_datetime + INTERVAL '-8 hour')) >= 12  
                  then (select birth_datetime + INTERVAL '-8 hour') + INTERVAL '-12 hour'    
                  else (select birth_datetime + INTERVAL '-8 hour') + INTERVAL '+12 hour' 
                end 
            ), 

            (--birth_lat 
              select  lat 
              from    ref_citychinese 
              where   exists( 

                              select  * 
                              from  customer 
                              where customer.birth_location = ref_citychinese.locationkey 
                              and customer_id = customer_id_input 
                            ) 
            ), 

            (--birth_lng 

              select  lng 
              from    ref_citychinese 
              where   exists( 
                              select  * 
                              from  customer 
                              where customer.birth_location = ref_citychinese.locationkey 
                              and customer_id = customer_id_input 
                            ) 
            ), 

            (--four_mins_every_degree 
              select  lng * 4 
              from    ref_citychinese 
              where   exists( 
                              select  * 
                              from  customer 
                              where customer.birth_location = ref_citychinese.locationkey 
                              and customer_id = customer_id_input 
                            ) 
            ) 
    from    customer 
    where   customer_id = customer_id_input; 
end; 

$$ language plpgsql 