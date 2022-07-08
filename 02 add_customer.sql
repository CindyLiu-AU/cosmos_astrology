
------------------add-customer() fuction-----------------------------
--input parameter is a customer's birth location postcode and birth date and time


create or replace function add_customer(birth_location_input int, birth_datetime_input timestamp without time zone) 
returns setof customer as $$
  begin
    insert into customer (birth_location, birth_datetime)
    values (birth_location_input, birth_datetime_input);
  end;
$$ language plpgsql;



