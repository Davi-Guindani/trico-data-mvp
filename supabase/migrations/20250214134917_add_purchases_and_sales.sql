create table "public"."purchases" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "clinic_id" uuid not null default gen_random_uuid(),
    "date" date not null,
    "cost" real not null
);


alter table "public"."purchases" enable row level security;

create table "public"."purchases_items" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "purchase_id" uuid not null default gen_random_uuid(),
    "product_id" uuid not null default gen_random_uuid(),
    "quantity" smallint not null,
    "unit_price" real not null
);


alter table "public"."purchases_items" enable row level security;

create table "public"."sales" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "clinic_id" uuid not null default gen_random_uuid(),
    "date" date not null,
    "revenue" real not null
);


alter table "public"."sales" enable row level security;

create table "public"."sales_items" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "sale_id" uuid not null default gen_random_uuid(),
    "product_id" uuid not null default gen_random_uuid(),
    "quantity" smallint not null,
    "unit_price" real not null
);


alter table "public"."sales_items" enable row level security;

CREATE UNIQUE INDEX purchases_items_pkey ON public.purchases_items USING btree (id);

CREATE UNIQUE INDEX purchases_pkey ON public.purchases USING btree (id);

CREATE UNIQUE INDEX sales_items_pkey ON public.sales_items USING btree (id);

CREATE UNIQUE INDEX sales_pkey ON public.sales USING btree (id);

alter table "public"."purchases" add constraint "purchases_pkey" PRIMARY KEY using index "purchases_pkey";

alter table "public"."purchases_items" add constraint "purchases_items_pkey" PRIMARY KEY using index "purchases_items_pkey";

alter table "public"."sales" add constraint "sales_pkey" PRIMARY KEY using index "sales_pkey";

alter table "public"."sales_items" add constraint "sales_items_pkey" PRIMARY KEY using index "sales_items_pkey";

alter table "public"."purchases" add constraint "purchases_clinic_id_fkey" FOREIGN KEY (clinic_id) REFERENCES clinics(id) not valid;

alter table "public"."purchases" validate constraint "purchases_clinic_id_fkey";

alter table "public"."purchases_items" add constraint "purchases_items_product_id_fkey" FOREIGN KEY (product_id) REFERENCES products(id) not valid;

alter table "public"."purchases_items" validate constraint "purchases_items_product_id_fkey";

alter table "public"."purchases_items" add constraint "purchases_items_purchase_id_fkey" FOREIGN KEY (purchase_id) REFERENCES purchases(id) not valid;

alter table "public"."purchases_items" validate constraint "purchases_items_purchase_id_fkey";

alter table "public"."sales" add constraint "sales_clinic_id_fkey" FOREIGN KEY (clinic_id) REFERENCES clinics(id) not valid;

alter table "public"."sales" validate constraint "sales_clinic_id_fkey";

alter table "public"."sales_items" add constraint "sales_items_product_id_fkey" FOREIGN KEY (product_id) REFERENCES products(id) not valid;

alter table "public"."sales_items" validate constraint "sales_items_product_id_fkey";

alter table "public"."sales_items" add constraint "sales_items_sale_id_fkey" FOREIGN KEY (sale_id) REFERENCES sales(id) not valid;

alter table "public"."sales_items" validate constraint "sales_items_sale_id_fkey";

grant delete on table "public"."purchases" to "anon";

grant insert on table "public"."purchases" to "anon";

grant references on table "public"."purchases" to "anon";

grant select on table "public"."purchases" to "anon";

grant trigger on table "public"."purchases" to "anon";

grant truncate on table "public"."purchases" to "anon";

grant update on table "public"."purchases" to "anon";

grant delete on table "public"."purchases" to "authenticated";

grant insert on table "public"."purchases" to "authenticated";

grant references on table "public"."purchases" to "authenticated";

grant select on table "public"."purchases" to "authenticated";

grant trigger on table "public"."purchases" to "authenticated";

grant truncate on table "public"."purchases" to "authenticated";

grant update on table "public"."purchases" to "authenticated";

grant delete on table "public"."purchases" to "service_role";

grant insert on table "public"."purchases" to "service_role";

grant references on table "public"."purchases" to "service_role";

grant select on table "public"."purchases" to "service_role";

grant trigger on table "public"."purchases" to "service_role";

grant truncate on table "public"."purchases" to "service_role";

grant update on table "public"."purchases" to "service_role";

grant delete on table "public"."purchases_items" to "anon";

grant insert on table "public"."purchases_items" to "anon";

grant references on table "public"."purchases_items" to "anon";

grant select on table "public"."purchases_items" to "anon";

grant trigger on table "public"."purchases_items" to "anon";

grant truncate on table "public"."purchases_items" to "anon";

grant update on table "public"."purchases_items" to "anon";

grant delete on table "public"."purchases_items" to "authenticated";

grant insert on table "public"."purchases_items" to "authenticated";

grant references on table "public"."purchases_items" to "authenticated";

grant select on table "public"."purchases_items" to "authenticated";

grant trigger on table "public"."purchases_items" to "authenticated";

grant truncate on table "public"."purchases_items" to "authenticated";

grant update on table "public"."purchases_items" to "authenticated";

grant delete on table "public"."purchases_items" to "service_role";

grant insert on table "public"."purchases_items" to "service_role";

grant references on table "public"."purchases_items" to "service_role";

grant select on table "public"."purchases_items" to "service_role";

grant trigger on table "public"."purchases_items" to "service_role";

grant truncate on table "public"."purchases_items" to "service_role";

grant update on table "public"."purchases_items" to "service_role";

grant delete on table "public"."sales" to "anon";

grant insert on table "public"."sales" to "anon";

grant references on table "public"."sales" to "anon";

grant select on table "public"."sales" to "anon";

grant trigger on table "public"."sales" to "anon";

grant truncate on table "public"."sales" to "anon";

grant update on table "public"."sales" to "anon";

grant delete on table "public"."sales" to "authenticated";

grant insert on table "public"."sales" to "authenticated";

grant references on table "public"."sales" to "authenticated";

grant select on table "public"."sales" to "authenticated";

grant trigger on table "public"."sales" to "authenticated";

grant truncate on table "public"."sales" to "authenticated";

grant update on table "public"."sales" to "authenticated";

grant delete on table "public"."sales" to "service_role";

grant insert on table "public"."sales" to "service_role";

grant references on table "public"."sales" to "service_role";

grant select on table "public"."sales" to "service_role";

grant trigger on table "public"."sales" to "service_role";

grant truncate on table "public"."sales" to "service_role";

grant update on table "public"."sales" to "service_role";

grant delete on table "public"."sales_items" to "anon";

grant insert on table "public"."sales_items" to "anon";

grant references on table "public"."sales_items" to "anon";

grant select on table "public"."sales_items" to "anon";

grant trigger on table "public"."sales_items" to "anon";

grant truncate on table "public"."sales_items" to "anon";

grant update on table "public"."sales_items" to "anon";

grant delete on table "public"."sales_items" to "authenticated";

grant insert on table "public"."sales_items" to "authenticated";

grant references on table "public"."sales_items" to "authenticated";

grant select on table "public"."sales_items" to "authenticated";

grant trigger on table "public"."sales_items" to "authenticated";

grant truncate on table "public"."sales_items" to "authenticated";

grant update on table "public"."sales_items" to "authenticated";

grant delete on table "public"."sales_items" to "service_role";

grant insert on table "public"."sales_items" to "service_role";

grant references on table "public"."sales_items" to "service_role";

grant select on table "public"."sales_items" to "service_role";

grant trigger on table "public"."sales_items" to "service_role";

grant truncate on table "public"."sales_items" to "service_role";

grant update on table "public"."sales_items" to "service_role";

create policy "Enable read access for all users"
on "public"."profiles_roles"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."purchases"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."purchases_items"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."sales"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."sales_items"
as permissive
for select
to public
using (true);



