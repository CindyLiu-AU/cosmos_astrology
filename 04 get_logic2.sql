create or replace function get_logic2(customer_id_input int)--input parameter is customer_id
returns setof logic1 as $$
begin
    insert into logic2(
      customer_id,--duplicate from the logic1 table
      birth_location,--duplicate from the logic1 table
      birth_datetime,--duplicate from the logic1 table
      birth_gmt0,--duplicate from the logic1 table
      birth_spn, --duplicate from the logic1 table
      birth_lng,--duplicate from the logic1 table
      birth_lat,--duplicate from the logic1 table
      four_mins_every_degree,--duplicate from the logic1 table
      spn_hours, --How many hrs since previous noon
      spn_mins, --How many mins since previous noon 
      add_ten_seconds,--Add 10 seonds per GMT since previous noon
      comp_mins_spn,--comp_mins_spn = [spn_hour*60+spn_min] + [add_ten_seconds] + [four_mins_every_degree]
      st_for_pre_noon --Seridial Time for previous noon
    )
    select  customer_id,
            birth_location,
            birth_datetime,
            birth_gmt0,
            birth_spn,
            birth_lng,
            birth_lat,
            four_mins_every_degree,
            (--spn_hours
              select extract(hour from birth_spn)
            ) as spn_hours,
            (--spn_mins
              select extract(min from birth_spn)
            ) as spn_mins,
            (--add_ten_seconds
              (
                (select extract(hour from birth_spn)) + (select extract(min from birth_spn))/60
              ) * 10 / 60
            ) as add_ten_seconds,
            (--comp_mins_spn = [spn_hour*60+spn_min] + [add_ten_seconds] + [four_mins_every_degree]
              select
                    (
                      (--spn_hour*60+spn_min
                        select extract(hour from birth_spn))*60 + (select extract(min from birth_spn))
                      ) 
                      + 
                      (--add_ten_seconds
                        (select extract(hour from birth_spn)) + (select extract(min from birth_spn))/60
                      ) * 10 / 60 -- 10 seconds => 10/60 mins
                      + 
                      four_mins_every_degree --four_mins_every_degree
            ) as comp_mins_spn,
            (--st_for_pre_noon
              select sid_hour + sid_min/60
              from ref_sideral_time	as r
              where exists(
                              select *
                              from logic1
                              where date(birth_gmt0) = r.date
                              and customer_id = customer_id_input
                          )
            ) as st_for_pre_noon
    from logic1
    where customer_id = customer_id_input;
end;
$$ language plpgsql
