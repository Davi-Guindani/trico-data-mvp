alter table "public"."products" alter column "sale_price" set data type numeric using "sale_price"::numeric;

alter table "public"."purchases" alter column "cost" set data type numeric using "cost"::numeric;

alter table "public"."purchases_products" alter column "unit_price" set data type numeric using "unit_price"::numeric;

alter table "public"."sales" alter column "revenue" set data type numeric using "revenue"::numeric;

alter table "public"."sales_products" alter column "unit_price" set data type numeric using "unit_price"::numeric;

alter table "public"."sales_services" alter column "unit_price" set data type numeric using "unit_price"::numeric;

alter table "public"."services" alter column "sale_price" set data type numeric using "sale_price"::numeric;


