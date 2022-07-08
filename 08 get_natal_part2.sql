-- DROP FUNCTION get_natal_part2(customer_id_input int);

create or replace function get_natal_part2(customer_id_input int)--input parameter is customer_id
returns setof natal_part1 as $$
begin
      insert into natal_part2(
            customer_id,    --duplicate from the natal_part1 table
            h4_dec,         --house4 location in decimal
            h4_deg1,        --house4 location in degree1(degree)
            h4_deg2,        --house4 location in degree2(minute)
            h5_dec,         --house5...
            h5_deg1,
            h5_deg2,
            h6_dec,         --house6...
            h6_deg1,
            h6_deg2,
            h7_dec,         --house7...
            h7_deg1,
            h7_deg2,
            h8_dec,         --house8...
            h8_deg1,
            h8_deg2,
            h9_dec,         --house9...
            h9_deg1,
            h9_deg2
      )
      select  customer_id,
--------------------------------------h4---------------------------------------
            (--h4_dec
              case
                  when h10_dec > 180
                  then h10_dec - 180
                  else h10_dec + 180
              end 
            ) as h4_dec,
            (--h4_deg1
              case
                  when h10_dec > 180
                  then (FLOOR((h10_dec - 180)-FLOOR((h10_dec - 180) / 30) * 30)) 
                  else (FLOOR((h10_dec + 180)-FLOOR((h10_dec + 180) / 30) * 30))
              end 
            ) as h4_deg1,
            (--h4_deg2
              case
                  when h10_dec > 180
                  then (((h10_dec - 180)-FLOOR((h10_dec - 180) / 30) * 30-FLOOR((h10_dec - 180)-FLOOR((h10_dec - 180) / 30) * 30)) * 60)
                  else (((h10_dec + 180)-FLOOR((h10_dec + 180) / 30) * 30-FLOOR((h10_dec + 180)-FLOOR((h10_dec + 180) / 30) * 30)) * 60)
              end 
            ) as h4_deg2,
--------------------------------------h5---------------------------------------
            (--h5_dec
              case
                  when h11_dec > 180
                  then h11_dec - 180
                  else h11_dec + 180
              end 
            ) as h5_dec,
            (--h5_deg1
              case
                  when h11_dec > 180
                  then (FLOOR((h11_dec - 180)-FLOOR((h11_dec - 180) / 30) * 30)) 
                  else (FLOOR((h11_dec + 180)-FLOOR((h11_dec + 180) / 30) * 30))
              end 
            ) as h5_deg1,
            (--h5_deg2
              case
                  when h11_dec > 180
                  then (((h11_dec - 180)-FLOOR((h11_dec - 180) / 30) * 30-FLOOR((h11_dec - 180)-FLOOR((h11_dec - 180) / 30) * 30)) * 60)
                  else (((h11_dec + 180)-FLOOR((h11_dec + 180) / 30) * 30-FLOOR((h11_dec + 180)-FLOOR((h11_dec + 180) / 30) * 30)) * 60)
              end 
            ) as h5_deg2,
--------------------------------------h6---------------------------------------
            (--h6_dec
              case
                  when h12_dec > 180
                  then h12_dec - 180
                  else h12_dec + 180
              end 
            ) as h6_dec,
            (--h6_deg1
              case
                  when h12_dec > 180
                  then (FLOOR((h12_dec - 180)-FLOOR((h12_dec - 180) / 30) * 30)) 
                  else (FLOOR((h12_dec + 180)-FLOOR((h12_dec + 180) / 30) * 30))
              end 
            ) as h6_deg1,
            (--h6_deg2
              case
                  when h12_dec > 180
                  then (((h12_dec - 180)-FLOOR((h12_dec - 180) / 30) * 30-FLOOR((h12_dec - 180)-FLOOR((h12_dec - 180) / 30) * 30)) * 60)
                  else (((h12_dec + 180)-FLOOR((h12_dec + 180) / 30) * 30-FLOOR((h12_dec + 180)-FLOOR((h12_dec + 180) / 30) * 30)) * 60)
              end 
            ) as h6_deg2,
--------------------------------------h7---------------------------------------
              (--h7_dec
              case
                  when h1_dec > 180
                  then h1_dec - 180
                  else h1_dec + 180
              end 
            ) as h7_dec,
            (--h7_deg1
              case
                  when h1_dec > 180
                  then (FLOOR((h1_dec - 180)-FLOOR((h1_dec - 180) / 30) * 30)) 
                  else (FLOOR((h1_dec + 180)-FLOOR((h1_dec + 180) / 30) * 30))
              end 
            ) as h7_deg1,
            (--h7_deg2
              case
                  when h1_dec > 180
                  then (((h1_dec - 180)-FLOOR((h1_dec - 180) / 30) * 30-FLOOR((h1_dec - 180)-FLOOR((h1_dec - 180) / 30) * 30)) * 60)
                  else (((h1_dec + 180)-FLOOR((h1_dec + 180) / 30) * 30-FLOOR((h1_dec + 180)-FLOOR((h1_dec + 180) / 30) * 30)) * 60)
              end 
            ) as h7_deg2,
--------------------------------------h8---------------------------------------
              (--h8_dec
              case
                  when h2_dec > 180
                  then h2_dec - 180
                  else h2_dec + 180
              end 
            ) as h8_dec,
            (--h8_deg1
              case
                  when h2_dec > 180
                  then (FLOOR((h2_dec - 180)-FLOOR((h2_dec - 180) / 30) * 30)) 
                  else (FLOOR((h2_dec + 180)-FLOOR((h2_dec + 180) / 30) * 30))
              end 
            ) as h8_deg1,
            (--h8_deg2
              case
                  when h2_dec > 180
                  then (((h2_dec - 180)-FLOOR((h2_dec - 180) / 30) * 30-FLOOR((h2_dec - 180)-FLOOR((h2_dec - 180) / 30) * 30)) * 60)
                  else (((h2_dec + 180)-FLOOR((h2_dec + 180) / 30) * 30-FLOOR((h2_dec + 180)-FLOOR((h2_dec + 180) / 30) * 30)) * 60)
              end 
            ) as h8_deg2,
--------------------------------------h9---------------------------------------
              (--h9_dec
              case
                  when h3_dec > 180
                  then h3_dec - 180
                  else h3_dec + 180
              end 
            ) as h9_dec,
            (--h9_deg1
              case
                  when h3_dec > 180
                  then (FLOOR((h3_dec - 180)-FLOOR((h3_dec - 180) / 30) * 30)) 
                  else (FLOOR((h3_dec + 180)-FLOOR((h3_dec + 180) / 30) * 30))
              end 
            ) as h9_deg1,
            (--h9_deg2
              case
                  when h3_dec > 180
                  then (((h3_dec - 180)-FLOOR((h3_dec - 180) / 30) * 30-FLOOR((h3_dec - 180)-FLOOR((h3_dec - 180) / 30) * 30)) * 60)
                  else (((h3_dec + 180)-FLOOR((h3_dec + 180) / 30) * 30-FLOOR((h3_dec + 180)-FLOOR((h3_dec + 180) / 30) * 30)) * 60)
              end 
            ) as h9_deg2
      from natal_part1
      where customer_id = customer_id_input;
end;
$$ language plpgsql