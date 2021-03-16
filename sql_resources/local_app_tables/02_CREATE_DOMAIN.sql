do $$
begin
DROP DOMAIN domain_email;
DROP DOMAIN ifscs;
DROP DOMAIN pan_numbers;

CREATE DOMAIN domain_email AS TEXT CHECK (
  VALUE ~ '^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$'
);
CREATE DOMAIN ifscs AS TEXT CHECK (
   char_length(VALUE) = 11
);
CREATE DOMAIN pan_numbers AS TEXT CHECK (
   char_length(VALUE) = 10
);
CREATE DOMAIN cheque_numbers AS INTEGER CHECK (
   VALUE > 0 AND VALUE <= 999999
);
CREATE DOMAIN investor_name AS
   VARCHAR NOT NULL CHECK (VALUE !~ '\s');

end $$ language plpgsql;
