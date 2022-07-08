create or replace function get_logic4(customer_id_input int)--input parameter is customer_id
returns setof logic3 as $$
begin
    insert into logic4(
                  customer_id,      --duplicate from the logic3 table
                  birth_st,         --duplicate from the logic3 table
                  birth_lat,        --duplicate from the logic3 table
                  laA,              --duplicate from the logic3 table
                  laB,              --duplicate from the logic3 table
                  stA,              --duplicate from the logic3 table
                  stB,              --duplicate from the logic3 table
                  h1_laAstA,        --the 1st house: laA & stA combination
                  h1_laAstB,        --the 1st house: laA & stB combination
                  h1_laBstA,        --the 1st house: laB & stA combination
                  h1_laBstB,        --the 1st house: laB & stB combination
                  h2_laAstA,        --the 2nd house...
                  h2_laAstB,
                  h2_laBstA,
                  h2_laBstB,
                  h3_laAstA,        --the 3rd house...
                  h3_laAstB,
                  h3_laBstA,
                  h3_laBstB,
                  h10_laAstA,       --the 10th house...
                  h10_laAstB,
                  h10_laBstA,
                  h10_laBstB,
                  h11_laAstA,        --the 11th house...
                  h11_laAstB,
                  h11_laBstA,
                  h11_laBstB,
                  h12_laAstA,        --the 12th house...
                  h12_laAstB,
                  h12_laBstA,
                  h12_laBstB
                  )
      select        customer_id,
                        birth_st,
                        birth_lat,
                        laA,
                        laB,
                        stA,
                        stB,
                        ---------------------------------------------h1--------------------------------------------
                        (--h1_laAstA
                              select "house_1st_Asc" as h1_laAstA
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laA = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stA = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h1_laAstB
                              select   "house_1st_Asc" as h1_laAstB
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laA = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stB = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h1_laBstA
                              select  "house_1st_Asc" as h1_laBstA
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laB = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stA = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h1_laBstB
                              select  "house_1st_Asc" as h1_laBstB
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laB = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stB = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        ---------------------------------------------h2--------------------------------------------
                        (--h2_laAstA
                              select "house_2nd" as h2_laAstA
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laA = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stA = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h2_laAstB
                              select   "house_2nd" as h2_laAstB
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laA = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stB = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h2_laBstA
                              select  "house_2nd" as h2_laBstA
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laB = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stA = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h2_laBstB
                              select  "house_2nd" as h2_laBstB
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laB = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stB = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        ---------------------------------------------h3--------------------------------------------
                        (--h3_laAstA
                              select "house_3rd" as h3_laAstA
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laA = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stA = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h3_laAstB
                              select   "house_3rd" as h3_laAstB
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laA = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stB = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h3_laBstA
                              select  "house_3rd" as h3_laBstA
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laB = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stA = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h3_laBstB
                              select  "house_3rd" as h3_laBstB
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laB = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stB = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        ---------------------------------------------h10--------------------------------------------
                        (--h10_laAstA
                              select "house_10th_MC" as h10_laAstA
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laA = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stA = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h10_laAstB
                              select   "house_10th_MC" as h10_laAstB
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laA = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stB = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h10_laBstA
                              select  "house_10th_MC" as h10_laBstA
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laB = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stA = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h10_laBstB
                              select  "house_10th_MC" as h10_laBstB
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laB = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stB = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        ---------------------------------------------h11--------------------------------------------
                        (--h11_laAstA
                              select "house_11th" as h11_laAstA
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laA = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stA = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h11_laAstB
                              select   "house_11th" as h11_laAstB
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laA = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stB = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h11_laBstA
                              select  "house_11th" as h11_laBstA
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laB = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stA = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h11_laBstB
                              select  "house_11th" as h11_laBstB
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laB = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stB = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        ---------------------------------------------h12--------------------------------------------
                        (--h12_laAstA
                              select "house_12th" as h12_laAstA
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laA = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stA = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h12_laAstB
                              select   "house_12th" as h12_laAstB
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laA = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stB = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h12_laBstA
                              select  "house_12th" as h12_laBstA
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laB = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stA = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        ),
                        (--h12_laBstB
                              select  "house_12th" as h12_laBstB
                              from    ref_northern_4min as r
                              where   exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.laB = r.lat
                                                and customer_id = customer_id_input
                                          )
                              and     exists
                                          (
                                                select *
                                                from logic3
                                                where logic3.stB = r.sid_times_t
                                                and customer_id = customer_id_input
                                          )
                        )
      from logic3
      where   customer_id = customer_id_input; 
end; 

$$ language plpgsql 