------------------check out customer table-----------------------------
select * from customer;

------------------add a customer-----------------------------
select add_customer(410106, '1990-9-10 6:15:00');
select * from customer;

------------------calculate logic1-3 and check out the result from logic3-----------------------------
select get_logic1(2);
select get_logic2(2);
select get_logic3(2);
select * from logic3

-------------calculate logic4 and check out the result----------------
select get_logic4(2);
select * from logic4;

--------------calculate natal and check out the result---------------
select get_natal_part1(2);
select get_natal_part2(2);
select * from natal_part1;
select * from natal_part2;
select * from natal_part1, natal_part2;


