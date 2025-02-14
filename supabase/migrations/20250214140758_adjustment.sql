drop policy "Enable read access for all users" on "public"."purchases_items";

drop policy "Enable read access for all users" on "public"."sales_items";

revoke delete on table "public"."purchases_items" from "anon";

revoke insert on table "public"."purchases_items" from "anon";

revoke references on table "public"."purchases_items" from "anon";

revoke select on table "public"."purchases_items" from "anon";

revoke trigger on table "public"."purchases_items" from "anon";

revoke truncate on table "public"."purchases_items" from "anon";

revoke update on table "public"."purchases_items" from "anon";

revoke delete on table "public"."purchases_items" from "authenticated";

revoke insert on table "public"."purchases_items" from "authenticated";

revoke references on table "public"."purchases_items" from "authenticated";

revoke select on table "public"."purchases_items" from "authenticated";

revoke trigger on table "public"."purchases_items" from "authenticated";

revoke truncate on table "public"."purchases_items" from "authenticated";

revoke update on table "public"."purchases_items" from "authenticated";

revoke delete on table "public"."purchases_items" from "service_role";

revoke insert on table "public"."purchases_items" from "service_role";

revoke references on table "public"."purchases_items" from "service_role";

revoke select on table "public"."purchases_items" from "service_role";

revoke trigger on table "public"."purchases_items" from "service_role";

revoke truncate on table "public"."purchases_items" from "service_role";

revoke update on table "public"."purchases_items" from "service_role";

revoke delete on table "public"."sales_items" from "anon";

revoke insert on table "public"."sales_items" from "anon";

revoke references on table "public"."sales_items" from "anon";

revoke select on table "public"."sales_items" from "anon";

revoke trigger on table "public"."sales_items" from "anon";

revoke truncate on table "public"."sales_items" from "anon";

revoke update on table "public"."sales_items" from "anon";

revoke delete on table "public"."sales_items" from "authenticated";

revoke insert on table "public"."sales_items" from "authenticated";

revoke references on table "public"."sales_items" from "authenticated";

revoke select on table "public"."sales_items" from "authenticated";

revoke trigger on table "public"."sales_items" from "authenticated";

revoke truncate on table "public"."sales_items" from "authenticated";

revoke update on table "public"."sales_items" from "authenticated";

revoke delete on table "public"."sales_items" from "service_role";

revoke insert on table "public"."sales_items" from "service_role";

revoke references on table "public"."sales_items" from "service_role";

revoke select on table "public"."sales_items" from "service_role";

revoke trigger on table "public"."sales_items" from "service_role";

revoke truncate on table "public"."sales_items" from "service_role";

revoke update on table "public"."sales_items" from "service_role";

alter table "public"."purchases_items" drop constraint "purchases_items_product_id_fkey";

alter table "public"."purchases_items" drop constraint "purchases_items_purchase_id_fkey";

alter table "public"."sales_items" drop constraint "sales_items_product_id_fkey";

alter table "public"."sales_items" drop constraint "sales_items_sale_id_fkey";

alter table "public"."purchases_items" drop constraint "purchases_items_pkey";

alter table "public"."sales_items" drop constraint "sales_items_pkey";

drop index if exists "public"."purchases_items_pkey";

drop index if exists "public"."sales_items_pkey";

drop table "public"."purchases_items";

drop table "public"."sales_items";

create table "public"."purchases_products" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "purchase_id" uuid not null default gen_random_uuid(),
    "product_id" uuid not null default gen_random_uuid(),
    "quantity" smallint not null,
    "unit_price" real not null
);


alter table "public"."purchases_products" enable row level security;

create table "public"."sales_products" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "sale_id" uuid not null default gen_random_uuid(),
    "product_id" uuid not null default gen_random_uuid(),
    "quantity" smallint not null,
    "unit_price" real not null
);


alter table "public"."sales_products" enable row level security;

create table "public"."sales_services" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "sale_id" uuid not null default gen_random_uuid(),
    "service_id" uuid not null default gen_random_uuid(),
    "quantity" smallint not null,
    "unit_price" real not null
);


alter table "public"."sales_services" enable row level security;

alter table "public"."products" add column "price" real;

alter table "public"."services" add column "price" real;

CREATE UNIQUE INDEX sales_services_pkey ON public.sales_services USING btree (id);

CREATE UNIQUE INDEX purchases_items_pkey ON public.purchases_products USING btree (id);

CREATE UNIQUE INDEX sales_items_pkey ON public.sales_products USING btree (id);

alter table "public"."purchases_products" add constraint "purchases_items_pkey" PRIMARY KEY using index "purchases_items_pkey";

alter table "public"."sales_products" add constraint "sales_items_pkey" PRIMARY KEY using index "sales_items_pkey";

alter table "public"."sales_services" add constraint "sales_services_pkey" PRIMARY KEY using index "sales_services_pkey";

alter table "public"."purchases_products" add constraint "purchases_items_product_id_fkey" FOREIGN KEY (product_id) REFERENCES products(id) not valid;

alter table "public"."purchases_products" validate constraint "purchases_items_product_id_fkey";

alter table "public"."purchases_products" add constraint "purchases_items_purchase_id_fkey" FOREIGN KEY (purchase_id) REFERENCES purchases(id) not valid;

alter table "public"."purchases_products" validate constraint "purchases_items_purchase_id_fkey";

alter table "public"."sales_products" add constraint "sales_items_product_id_fkey" FOREIGN KEY (product_id) REFERENCES products(id) not valid;

alter table "public"."sales_products" validate constraint "sales_items_product_id_fkey";

alter table "public"."sales_products" add constraint "sales_items_sale_id_fkey" FOREIGN KEY (sale_id) REFERENCES sales(id) not valid;

alter table "public"."sales_products" validate constraint "sales_items_sale_id_fkey";

alter table "public"."sales_services" add constraint "sales_services_sale_id_fkey" FOREIGN KEY (sale_id) REFERENCES sales(id) not valid;

alter table "public"."sales_services" validate constraint "sales_services_sale_id_fkey";

alter table "public"."sales_services" add constraint "sales_services_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."sales_services" validate constraint "sales_services_service_id_fkey";

grant delete on table "public"."purchases_products" to "anon";

grant insert on table "public"."purchases_products" to "anon";

grant references on table "public"."purchases_products" to "anon";

grant select on table "public"."purchases_products" to "anon";

grant trigger on table "public"."purchases_products" to "anon";

grant truncate on table "public"."purchases_products" to "anon";

grant update on table "public"."purchases_products" to "anon";

grant delete on table "public"."purchases_products" to "authenticated";

grant insert on table "public"."purchases_products" to "authenticated";

grant references on table "public"."purchases_products" to "authenticated";

grant select on table "public"."purchases_products" to "authenticated";

grant trigger on table "public"."purchases_products" to "authenticated";

grant truncate on table "public"."purchases_products" to "authenticated";

grant update on table "public"."purchases_products" to "authenticated";

grant delete on table "public"."purchases_products" to "service_role";

grant insert on table "public"."purchases_products" to "service_role";

grant references on table "public"."purchases_products" to "service_role";

grant select on table "public"."purchases_products" to "service_role";

grant trigger on table "public"."purchases_products" to "service_role";

grant truncate on table "public"."purchases_products" to "service_role";

grant update on table "public"."purchases_products" to "service_role";

grant delete on table "public"."sales_products" to "anon";

grant insert on table "public"."sales_products" to "anon";

grant references on table "public"."sales_products" to "anon";

grant select on table "public"."sales_products" to "anon";

grant trigger on table "public"."sales_products" to "anon";

grant truncate on table "public"."sales_products" to "anon";

grant update on table "public"."sales_products" to "anon";

grant delete on table "public"."sales_products" to "authenticated";

grant insert on table "public"."sales_products" to "authenticated";

grant references on table "public"."sales_products" to "authenticated";

grant select on table "public"."sales_products" to "authenticated";

grant trigger on table "public"."sales_products" to "authenticated";

grant truncate on table "public"."sales_products" to "authenticated";

grant update on table "public"."sales_products" to "authenticated";

grant delete on table "public"."sales_products" to "service_role";

grant insert on table "public"."sales_products" to "service_role";

grant references on table "public"."sales_products" to "service_role";

grant select on table "public"."sales_products" to "service_role";

grant trigger on table "public"."sales_products" to "service_role";

grant truncate on table "public"."sales_products" to "service_role";

grant update on table "public"."sales_products" to "service_role";

grant delete on table "public"."sales_services" to "anon";

grant insert on table "public"."sales_services" to "anon";

grant references on table "public"."sales_services" to "anon";

grant select on table "public"."sales_services" to "anon";

grant trigger on table "public"."sales_services" to "anon";

grant truncate on table "public"."sales_services" to "anon";

grant update on table "public"."sales_services" to "anon";

grant delete on table "public"."sales_services" to "authenticated";

grant insert on table "public"."sales_services" to "authenticated";

grant references on table "public"."sales_services" to "authenticated";

grant select on table "public"."sales_services" to "authenticated";

grant trigger on table "public"."sales_services" to "authenticated";

grant truncate on table "public"."sales_services" to "authenticated";

grant update on table "public"."sales_services" to "authenticated";

grant delete on table "public"."sales_services" to "service_role";

grant insert on table "public"."sales_services" to "service_role";

grant references on table "public"."sales_services" to "service_role";

grant select on table "public"."sales_services" to "service_role";

grant trigger on table "public"."sales_services" to "service_role";

grant truncate on table "public"."sales_services" to "service_role";

grant update on table "public"."sales_services" to "service_role";

create policy "Enable read access for all users"
on "public"."purchases_products"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."sales_products"
as permissive
for select
to public
using (true);



