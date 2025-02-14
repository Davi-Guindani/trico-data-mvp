alter table "public"."products" drop column "price";

alter table "public"."products" add column "sale_price" real not null;

alter table "public"."profiles_roles" alter column "profile_id" set not null;

alter table "public"."profiles_roles" alter column "role_id" set not null;

alter table "public"."services" drop column "price";

alter table "public"."services" add column "sale_price" real not null;


