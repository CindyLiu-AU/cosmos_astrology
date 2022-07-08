

create or replace function get_logic3(customer_id_input int)--input parameter is customer_id
returns setof logic2 as $$
begin
    insert into logic3(
                customer_id,              --duplicate from the logic2 table
                birth_location,           --duplicate from the logic2 table
                birth_datetime,           --duplicate from the logic2 table
                birth_gmt0,               --duplicate from the logic2 table
                birth_spn,                --duplicate from the logic2 table
                birth_lng,                --duplicate from the logic2 table
                birth_lat,                --duplicate from the logic2 table
                four_mins_every_degree,   --duplicate from the logic2 table
                spn_hours,                --duplicate from the logic2 table
                spn_mins,                 --duplicate from the logic2 table
                add_ten_seconds,          --duplicate from the logic2 table
                comp_mins_spn,            --duplicate from the logic2 table
                st_for_pre_noon,          --duplicate from the logic2 table
                birth_st,                 --birth with Sideral Time
                stA,                      --birth with Sideral Time in range(A, B)
                stB,                      --birth with Sideral Time in range(A, B)
                laA,                      --birth latitude in range(A, B)
                laB                       --birth latitude in range(A, B)
        )
    select    customer_id,              
              birth_location,          
              birth_datetime,           
              birth_gmt0,               
              birth_spn,                
              birth_lng,                
              birth_lat,                
              four_mins_every_degree,   
              spn_hours,                
              spn_mins,                 
              add_ten_seconds,          
              comp_mins_spn,            
              st_for_pre_noon,          
              (--birth_st
                    select
                          case
                              when st_for_pre_noon + comp_mins_spn/60 > 24
                              then fmod((st_for_pre_noon + comp_mins_spn/60), 24)
                              else st_for_pre_noon + comp_mins_spn/60
                          end
              ) as birth_st,
              (--stA
                  select  max(sid_times_t)
                  from    (
                              select sid_times_t
                              from ref_northern_4min
                              group by sid_times_t
                          ) as tempTable2   
                  where   sid_times_t < 
                                        (--birth_sideral_time(convert to a number that less than 24h)
                                          select
                                                  case
                                                    when st_for_pre_noon + comp_mins_spn/60 > 24
                                                    then fmod((st_for_pre_noon + comp_mins_spn/60), 24)
                                                    else st_for_pre_noon + comp_mins_spn/60
                                                  end
                                          from    logic2
                                          where   customer_id = customer_id_input
                                        )
              ) as stA,
              (--stB
                  select  min(sid_times_t)
                  from    (select sid_times_t
                          from ref_northern_4min
                          group by sid_times_t
                          ) as tempTable1
                  where   sid_times_t > 
                                        (--birth_sideral_time(convert to a number that less than 24h)
                                          select
                                                  case
                                                    when st_for_pre_noon + comp_mins_spn/60 > 24
                                                    then fmod((st_for_pre_noon + comp_mins_spn/60), 24)
                                                    else st_for_pre_noon + comp_mins_spn/60
                                                  end
                                          from    logic2
                                          where   customer_id = customer_id_input
                                        )
              ) as stB,
              (--laA
                    select  max(lat)
                    from    (
                              select  lat
                              from    ref_northern_4min
                              group by lat
                            ) as temptable3
                    where   lat < (
                                    select  birth_lat 
                                    from    logic2
                                    where   customer_id = customer_id_input
                                  )
              ) as laA,
              (--laB
                    select min(lat)
                    from    (
                              select lat
                              from ref_northern_4min
                              group by lat
                            ) as temptable3
                    where   lat > (
                                    select birth_lat 
                                    from logic2
                                    where customer_id = customer_id_input
                                  )
              ) as laB
    from logic2
    where customer_id = customer_id_input;
end;
$$ language plpgsql


