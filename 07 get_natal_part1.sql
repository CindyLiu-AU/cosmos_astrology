-- DROP FUNCTION get_natal_part1(customer_id_input int);

create or replace function get_natal_part1(customer_id_input int)--input parameter is customer_id
returns setof logic4 as $$
begin
      insert into natal_part1(
            customer_id,  --duplicate from the logic4 table
            h1_dec,       --house1 location in decimal
            h1_deg1,      --house1 location in degree1(degree)
            h1_deg2,      --house1 location in degree2(minute)
            h2_dec,       --house2...
            h2_deg1,
            h2_deg2,
            h3_dec,       --house3...
            h3_deg1,
            h3_deg2,
            h10_dec,      --house10...
            h10_deg1,
            h10_deg2,
            h11_dec,      --house11...
            h11_deg1,
            h11_deg2,
            h12_dec,      --house12...
            h12_deg1,
            h12_deg2
      )
      select  customer_id,
---------------------------------------h1------------------------------------------------
                (--h1_dec
                    (((h1_laAstB - h1_laAstA) * (birth_st - stA) / (stB - stA)  + h1_laAstA)*(-1) + (h1_laBstB - h1_laBstA) * (birth_st - stA) / (stB - stA) + h1_laBstA) 
                    * (birth_lat - laA) 
                    + ((h1_laAstB - h1_laAstA) * (birth_st - stA) / (stB - stA)  + h1_laAstA) 
                ) as h1_dec,
                
                (--h1_deg1
                  FLOOR(
                            
                                  (--h1_dec
                                      (((h1_laAstB - h1_laAstA) * (birth_st - stA) / (stB - stA)  + h1_laAstA)*(-1) + (h1_laBstB - h1_laBstA) * (birth_st - stA) / (stB - stA) + h1_laBstA) 
                                      * (birth_lat - laA) 
                                      + ((h1_laAstB - h1_laAstA) * (birth_st - stA) / (stB - stA)  + h1_laAstA) 
                                  )
                                  -
                                  FLOOR
                                  (                         
                                        (--h1_dec
                                            (((h1_laAstB - h1_laAstA) * (birth_st - stA) / (stB - stA)  + h1_laAstA)*(-1) + (h1_laBstB - h1_laBstA) * (birth_st - stA) / (stB - stA) + h1_laBstA) 
                                            * (birth_lat - laA) 
                                            + ((h1_laAstB - h1_laAstA) * (birth_st - stA) / (stB - stA)  + h1_laAstA) 
                                        ) / 30
                                  ) * 30
                       )
                ) as h1_deg1,

                (--h1_deg2
                
                    (
                            (--h1_dec
                                (((h1_laAstB - h1_laAstA) * (birth_st - stA) / (stB - stA)  + h1_laAstA)*(-1) + (h1_laBstB - h1_laBstA) * (birth_st - stA) / (stB - stA) + h1_laBstA) 
                                * (birth_lat - laA) 
                                + ((h1_laAstB - h1_laAstA) * (birth_st - stA) / (stB - stA)  + h1_laAstA) 
                            )
                            -
                            FLOOR
                                (                         
                                      (--h1_dec
                                          (((h1_laAstB - h1_laAstA) * (birth_st - stA) / (stB - stA)  + h1_laAstA)*(-1) + (h1_laBstB - h1_laBstA) * (birth_st - stA) / (stB - stA) + h1_laBstA) 
                                          * (birth_lat - laA) 
                                          + ((h1_laAstB - h1_laAstA) * (birth_st - stA) / (stB - stA)  + h1_laAstA) 
                                      ) / 30
                                ) * 30
                            -
                            FLOOR
                                  (
                                        (--h1_dec
                                            (((h1_laAstB - h1_laAstA) * (birth_st - stA) / (stB - stA)  + h1_laAstA)*(-1) + (h1_laBstB - h1_laBstA) * (birth_st - stA) / (stB - stA) + h1_laBstA) 
                                            * (birth_lat - laA) 
                                            + ((h1_laAstB - h1_laAstA) * (birth_st - stA) / (stB - stA)  + h1_laAstA) 
                                        )
                                        -
                                        FLOOR
                                        (                         
                                              (--h1_dec
                                                  (((h1_laAstB - h1_laAstA) * (birth_st - stA) / (stB - stA)  + h1_laAstA)*(-1) + (h1_laBstB - h1_laBstA) * (birth_st - stA) / (stB - stA) + h1_laBstA) 
                                                  * (birth_lat - laA) 
                                                  + ((h1_laAstB - h1_laAstA) * (birth_st - stA) / (stB - stA)  + h1_laAstA) 
                                              ) / 30
                                        ) * 30
                                  )
                    ) * 60
                ) as h1_deg2,
---------------------------------------h2------------------------------------------------
                (--h2_dec
                    (((h2_laAstB - h2_laAstA) * (birth_st - stA) / (stB - stA)  + h2_laAstA)*(-1) + (h2_laBstB - h2_laBstA) * (birth_st - stA) / (stB - stA) + h2_laBstA) 
                    * (birth_lat - laA) 
                    + ((h2_laAstB - h2_laAstA) * (birth_st - stA) / (stB - stA)  + h2_laAstA) 
                ) as h2_dec,
                
                (--h2_deg1
                  FLOOR(
                            
                                  (--h2_dec
                                      (((h2_laAstB - h2_laAstA) * (birth_st - stA) / (stB - stA)  + h2_laAstA)*(-1) + (h2_laBstB - h2_laBstA) * (birth_st - stA) / (stB - stA) + h2_laBstA) 
                                      * (birth_lat - laA) 
                                      + ((h2_laAstB - h2_laAstA) * (birth_st - stA) / (stB - stA)  + h2_laAstA) 
                                  )
                                  -
                                  FLOOR
                                  (                         
                                        (--h2_dec
                                            (((h2_laAstB - h2_laAstA) * (birth_st - stA) / (stB - stA)  + h2_laAstA)*(-1) + (h2_laBstB - h2_laBstA) * (birth_st - stA) / (stB - stA) + h2_laBstA) 
                                            * (birth_lat - laA) 
                                            + ((h2_laAstB - h2_laAstA) * (birth_st - stA) / (stB - stA)  + h2_laAstA) 
                                        ) / 30
                                  ) * 30
                       )
                ) as h2_deg1,

                (--h2_deg2
                
                    (
                            (--h2_dec
                                (((h2_laAstB - h2_laAstA) * (birth_st - stA) / (stB - stA)  + h2_laAstA)*(-1) + (h2_laBstB - h2_laBstA) * (birth_st - stA) / (stB - stA) + h2_laBstA) 
                                * (birth_lat - laA) 
                                + ((h2_laAstB - h2_laAstA) * (birth_st - stA) / (stB - stA)  + h2_laAstA) 
                            )
                            -
                            FLOOR
                                (                         
                                      (--h2_dec
                                          (((h2_laAstB - h2_laAstA) * (birth_st - stA) / (stB - stA)  + h2_laAstA)*(-1) + (h2_laBstB - h2_laBstA) * (birth_st - stA) / (stB - stA) + h2_laBstA) 
                                          * (birth_lat - laA) 
                                          + ((h2_laAstB - h2_laAstA) * (birth_st - stA) / (stB - stA)  + h2_laAstA) 
                                      ) / 30
                                ) * 30
                            -
                            FLOOR
                                  (
                                        (--h2_dec
                                            (((h2_laAstB - h2_laAstA) * (birth_st - stA) / (stB - stA)  + h2_laAstA)*(-1) + (h2_laBstB - h2_laBstA) * (birth_st - stA) / (stB - stA) + h2_laBstA) 
                                            * (birth_lat - laA) 
                                            + ((h2_laAstB - h2_laAstA) * (birth_st - stA) / (stB - stA)  + h2_laAstA) 
                                        )
                                        -
                                        FLOOR
                                        (                         
                                              (--h2_dec
                                                  (((h2_laAstB - h2_laAstA) * (birth_st - stA) / (stB - stA)  + h2_laAstA)*(-1) + (h2_laBstB - h2_laBstA) * (birth_st - stA) / (stB - stA) + h2_laBstA) 
                                                  * (birth_lat - laA) 
                                                  + ((h2_laAstB - h2_laAstA) * (birth_st - stA) / (stB - stA)  + h2_laAstA) 
                                              ) / 30
                                        ) * 30
                                  )
                    ) * 60
                ) as h2_deg2,
---------------------------------------h3------------------------------------------------
                (--h3_dec
                    (((h3_laAstB - h3_laAstA) * (birth_st - stA) / (stB - stA)  + h3_laAstA)*(-1) + (h3_laBstB - h3_laBstA) * (birth_st - stA) / (stB - stA) + h3_laBstA) 
                    * (birth_lat - laA) 
                    + ((h3_laAstB - h3_laAstA) * (birth_st - stA) / (stB - stA)  + h3_laAstA) 
                ) as h3_dec,
                
                (--h3_deg1
                  FLOOR(
                            
                                  (--h3_dec
                                      (((h3_laAstB - h3_laAstA) * (birth_st - stA) / (stB - stA)  + h3_laAstA)*(-1) + (h3_laBstB - h3_laBstA) * (birth_st - stA) / (stB - stA) + h3_laBstA) 
                                      * (birth_lat - laA) 
                                      + ((h3_laAstB - h3_laAstA) * (birth_st - stA) / (stB - stA)  + h3_laAstA) 
                                  )
                                  -
                                  FLOOR
                                  (                         
                                        (--h3_dec
                                            (((h3_laAstB - h3_laAstA) * (birth_st - stA) / (stB - stA)  + h3_laAstA)*(-1) + (h3_laBstB - h3_laBstA) * (birth_st - stA) / (stB - stA) + h3_laBstA) 
                                            * (birth_lat - laA) 
                                            + ((h3_laAstB - h3_laAstA) * (birth_st - stA) / (stB - stA)  + h3_laAstA) 
                                        ) / 30
                                  ) * 30
                       )
                ) as h3_deg1,

                (--h3_deg2
                
                    (
                            (--h3_dec
                                (((h3_laAstB - h3_laAstA) * (birth_st - stA) / (stB - stA)  + h3_laAstA)*(-1) + (h3_laBstB - h3_laBstA) * (birth_st - stA) / (stB - stA) + h3_laBstA) 
                                * (birth_lat - laA) 
                                + ((h3_laAstB - h3_laAstA) * (birth_st - stA) / (stB - stA)  + h3_laAstA) 
                            )
                            -
                            FLOOR
                                (                         
                                      (--h3_dec
                                          (((h3_laAstB - h3_laAstA) * (birth_st - stA) / (stB - stA)  + h3_laAstA)*(-1) + (h3_laBstB - h3_laBstA) * (birth_st - stA) / (stB - stA) + h3_laBstA) 
                                          * (birth_lat - laA) 
                                          + ((h3_laAstB - h3_laAstA) * (birth_st - stA) / (stB - stA)  + h3_laAstA) 
                                      ) / 30
                                ) * 30
                            -
                            FLOOR
                                  (
                                        (--h3_dec
                                            (((h3_laAstB - h3_laAstA) * (birth_st - stA) / (stB - stA)  + h3_laAstA)*(-1) + (h3_laBstB - h3_laBstA) * (birth_st - stA) / (stB - stA) + h3_laBstA) 
                                            * (birth_lat - laA) 
                                            + ((h3_laAstB - h3_laAstA) * (birth_st - stA) / (stB - stA)  + h3_laAstA) 
                                        )
                                        -
                                        FLOOR
                                        (                         
                                              (--h3_dec
                                                  (((h3_laAstB - h3_laAstA) * (birth_st - stA) / (stB - stA)  + h3_laAstA)*(-1) + (h3_laBstB - h3_laBstA) * (birth_st - stA) / (stB - stA) + h3_laBstA) 
                                                  * (birth_lat - laA) 
                                                  + ((h3_laAstB - h3_laAstA) * (birth_st - stA) / (stB - stA)  + h3_laAstA) 
                                              ) / 30
                                        ) * 30
                                  )
                    ) * 60
                ) as h3_deg2,
---------------------------------------h10------------------------------------------------
               (--h10_dec
                (h10_laAstB - h10_laAstA) / (stB - stA) * (birth_st - stA) + h10_laAstA
              ) as h10_dec,

              (--h10_deg1
                FLOOR(
                          (--h10_dec
                              (h10_laAstB - h10_laAstA) / (stB - stA) * (birth_st - stA) + h10_laAstA
                          )
                          -
                          FLOOR
                          (                         
                                (--h10_dec
                                    (h10_laAstB - h10_laAstA) / (stB - stA) * (birth_st - stA) + h10_laAstA
                                ) / 30
                          ) * 30
                      )
              ) as h10_deg1,

              (--h10_deg2
              
                  (
                          (--h10_dec
                              (h10_laAstB - h10_laAstA) / (stB - stA) * (birth_st - stA) + h10_laAstA
                          )
                          -
                          FLOOR
                              (                         
                                    (--h10_dec
                                        (h10_laAstB - h10_laAstA) / (stB - stA) * (birth_st - stA) + h10_laAstA
                                    ) / 30
                              ) * 30
                          -
                          FLOOR
                                (
                                      (--h10_dec
                                        (h10_laAstB - h10_laAstA) / (stB - stA) * (birth_st - stA) + h10_laAstA
                                      )
                                      -
                                      FLOOR
                                      (                         
                                            (--h10_dec
                                              (h10_laAstB - h10_laAstA) / (stB - stA) * (birth_st - stA) + h10_laAstA
                                            ) / 30
                                      ) * 30
                                )
                  ) * 60
              ) as h10_deg2,

---------------------------------------h11------------------------------------------------
                 (--h11_dec
                    (((h11_laAstB - h11_laAstA) * (birth_st - stA) / (stB - stA)  + h11_laAstA)*(-1) + (h11_laBstB - h11_laBstA) * (birth_st - stA) / (stB - stA) + h11_laBstA) 
                    * (birth_lat - laA) 
                    + ((h11_laAstB - h11_laAstA) * (birth_st - stA) / (stB - stA)  + h11_laAstA) 
                ) as h11_dec,
                
                (--h11_deg1
                  FLOOR(
                            
                                  (--h11_dec
                                      (((h11_laAstB - h11_laAstA) * (birth_st - stA) / (stB - stA)  + h11_laAstA)*(-1) + (h11_laBstB - h11_laBstA) * (birth_st - stA) / (stB - stA) + h11_laBstA) 
                                      * (birth_lat - laA) 
                                      + ((h11_laAstB - h11_laAstA) * (birth_st - stA) / (stB - stA)  + h11_laAstA) 
                                  )
                                  -
                                  FLOOR
                                  (                         
                                        (--h11_dec
                                            (((h11_laAstB - h11_laAstA) * (birth_st - stA) / (stB - stA)  + h11_laAstA)*(-1) + (h11_laBstB - h11_laBstA) * (birth_st - stA) / (stB - stA) + h11_laBstA) 
                                            * (birth_lat - laA) 
                                            + ((h11_laAstB - h11_laAstA) * (birth_st - stA) / (stB - stA)  + h11_laAstA) 
                                        ) / 30
                                  ) * 30
                       )
                ) as h11_deg1,

                (--h11_deg2
                
                    (
                            (--h11_dec
                                (((h11_laAstB - h11_laAstA) * (birth_st - stA) / (stB - stA)  + h11_laAstA)*(-1) + (h11_laBstB - h11_laBstA) * (birth_st - stA) / (stB - stA) + h11_laBstA) 
                                * (birth_lat - laA) 
                                + ((h11_laAstB - h11_laAstA) * (birth_st - stA) / (stB - stA)  + h11_laAstA) 
                            )
                            -
                            FLOOR
                                (                         
                                      (--h11_dec
                                          (((h11_laAstB - h11_laAstA) * (birth_st - stA) / (stB - stA)  + h11_laAstA)*(-1) + (h11_laBstB - h11_laBstA) * (birth_st - stA) / (stB - stA) + h11_laBstA) 
                                          * (birth_lat - laA) 
                                          + ((h11_laAstB - h11_laAstA) * (birth_st - stA) / (stB - stA)  + h11_laAstA) 
                                      ) / 30
                                ) * 30
                            -
                            FLOOR
                                  (
                                        (--h11_dec
                                            (((h11_laAstB - h11_laAstA) * (birth_st - stA) / (stB - stA)  + h11_laAstA)*(-1) + (h11_laBstB - h11_laBstA) * (birth_st - stA) / (stB - stA) + h11_laBstA) 
                                            * (birth_lat - laA) 
                                            + ((h11_laAstB - h11_laAstA) * (birth_st - stA) / (stB - stA)  + h11_laAstA) 
                                        )
                                        -
                                        FLOOR
                                        (                         
                                              (--h11_dec
                                                  (((h11_laAstB - h11_laAstA) * (birth_st - stA) / (stB - stA)  + h11_laAstA)*(-1) + (h11_laBstB - h11_laBstA) * (birth_st - stA) / (stB - stA) + h11_laBstA) 
                                                  * (birth_lat - laA) 
                                                  + ((h11_laAstB - h11_laAstA) * (birth_st - stA) / (stB - stA)  + h11_laAstA) 
                                              ) / 30
                                        ) * 30
                                  )
                    ) * 60
                ) as h11_deg2,

---------------------------------------h12------------------------------------------------
                (--h12_dec
                    (((h12_laAstB - h12_laAstA) * (birth_st - stA) / (stB - stA)  + h12_laAstA)*(-1) + (h12_laBstB - h12_laBstA) * (birth_st - stA) / (stB - stA) + h12_laBstA) 
                    * (birth_lat - laA) 
                    + ((h12_laAstB - h12_laAstA) * (birth_st - stA) / (stB - stA)  + h12_laAstA) 
                ) as h12_dec,
                
                (--h12_deg1
                  FLOOR(
                            
                                  (--h12_dec
                                      (((h12_laAstB - h12_laAstA) * (birth_st - stA) / (stB - stA)  + h12_laAstA)*(-1) + (h12_laBstB - h12_laBstA) * (birth_st - stA) / (stB - stA) + h12_laBstA) 
                                      * (birth_lat - laA) 
                                      + ((h12_laAstB - h12_laAstA) * (birth_st - stA) / (stB - stA)  + h12_laAstA) 
                                  )
                                  -
                                  FLOOR
                                  (                         
                                        (--h12_dec
                                            (((h12_laAstB - h12_laAstA) * (birth_st - stA) / (stB - stA)  + h12_laAstA)*(-1) + (h12_laBstB - h12_laBstA) * (birth_st - stA) / (stB - stA) + h12_laBstA) 
                                            * (birth_lat - laA) 
                                            + ((h12_laAstB - h12_laAstA) * (birth_st - stA) / (stB - stA)  + h12_laAstA) 
                                        ) / 30
                                  ) * 30
                       )
                ) as h12_deg1,

                (--h12_deg2
                
                    (
                            (--h12_dec
                                (((h12_laAstB - h12_laAstA) * (birth_st - stA) / (stB - stA)  + h12_laAstA)*(-1) + (h12_laBstB - h12_laBstA) * (birth_st - stA) / (stB - stA) + h12_laBstA) 
                                * (birth_lat - laA) 
                                + ((h12_laAstB - h12_laAstA) * (birth_st - stA) / (stB - stA)  + h12_laAstA) 
                            )
                            -
                            FLOOR
                                (                         
                                      (--h12_dec
                                          (((h12_laAstB - h12_laAstA) * (birth_st - stA) / (stB - stA)  + h12_laAstA)*(-1) + (h12_laBstB - h12_laBstA) * (birth_st - stA) / (stB - stA) + h12_laBstA) 
                                          * (birth_lat - laA) 
                                          + ((h12_laAstB - h12_laAstA) * (birth_st - stA) / (stB - stA)  + h12_laAstA) 
                                      ) / 30
                                ) * 30
                            -
                            FLOOR
                                  (
                                        (--h12_dec
                                            (((h12_laAstB - h12_laAstA) * (birth_st - stA) / (stB - stA)  + h12_laAstA)*(-1) + (h12_laBstB - h12_laBstA) * (birth_st - stA) / (stB - stA) + h12_laBstA) 
                                            * (birth_lat - laA) 
                                            + ((h12_laAstB - h12_laAstA) * (birth_st - stA) / (stB - stA)  + h12_laAstA) 
                                        )
                                        -
                                        FLOOR
                                        (                         
                                              (--h12_dec
                                                  (((h12_laAstB - h12_laAstA) * (birth_st - stA) / (stB - stA)  + h12_laAstA)*(-1) + (h12_laBstB - h12_laBstA) * (birth_st - stA) / (stB - stA) + h12_laBstA) 
                                                  * (birth_lat - laA) 
                                                  + ((h12_laAstB - h12_laAstA) * (birth_st - stA) / (stB - stA)  + h12_laAstA) 
                                              ) / 30
                                        ) * 30
                                  )
                    ) * 60
                ) as h12_deg2
        from logic4
        where customer_id = customer_id_input;
end;
$$ language plpgsql
