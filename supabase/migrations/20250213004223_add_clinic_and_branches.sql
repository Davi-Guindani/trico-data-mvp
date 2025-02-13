create table "public"."branches" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "clinic_id" uuid not null,
    "name" text not null
);


alter table "public"."branches" enable row level security;

create table "public"."clinics" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "name" text not null
);


alter table "public"."clinics" enable row level security;

alter table "public"."profiles_roles" alter column "profile_id" drop default;

alter table "public"."profiles_roles" alter column "role_id" drop default;

CREATE UNIQUE INDEX branches_pkey ON public.branches USING btree (id);

CREATE UNIQUE INDEX clinics_pkey ON public.clinics USING btree (id);

alter table "public"."branches" add constraint "branches_pkey" PRIMARY KEY using index "branches_pkey";

alter table "public"."clinics" add constraint "clinics_pkey" PRIMARY KEY using index "clinics_pkey";

alter table "public"."branches" add constraint "branches_clinic_id_fkey" FOREIGN KEY (clinic_id) REFERENCES clinics(id) not valid;

alter table "public"."branches" validate constraint "branches_clinic_id_fkey";

grant delete on table "public"."branches" to "anon";

grant insert on table "public"."branches" to "anon";

grant references on table "public"."branches" to "anon";

grant select on table "public"."branches" to "anon";

grant trigger on table "public"."branches" to "anon";

grant truncate on table "public"."branches" to "anon";

grant update on table "public"."branches" to "anon";

grant delete on table "public"."branches" to "authenticated";

grant insert on table "public"."branches" to "authenticated";

grant references on table "public"."branches" to "authenticated";

grant select on table "public"."branches" to "authenticated";

grant trigger on table "public"."branches" to "authenticated";

grant truncate on table "public"."branches" to "authenticated";

grant update on table "public"."branches" to "authenticated";

grant delete on table "public"."branches" to "service_role";

grant insert on table "public"."branches" to "service_role";

grant references on table "public"."branches" to "service_role";

grant select on table "public"."branches" to "service_role";

grant trigger on table "public"."branches" to "service_role";

grant truncate on table "public"."branches" to "service_role";

grant update on table "public"."branches" to "service_role";

grant delete on table "public"."clinics" to "anon";

grant insert on table "public"."clinics" to "anon";

grant references on table "public"."clinics" to "anon";

grant select on table "public"."clinics" to "anon";

grant trigger on table "public"."clinics" to "anon";

grant truncate on table "public"."clinics" to "anon";

grant update on table "public"."clinics" to "anon";

grant delete on table "public"."clinics" to "authenticated";

grant insert on table "public"."clinics" to "authenticated";

grant references on table "public"."clinics" to "authenticated";

grant select on table "public"."clinics" to "authenticated";

grant trigger on table "public"."clinics" to "authenticated";

grant truncate on table "public"."clinics" to "authenticated";

grant update on table "public"."clinics" to "authenticated";

grant delete on table "public"."clinics" to "service_role";

grant insert on table "public"."clinics" to "service_role";

grant references on table "public"."clinics" to "service_role";

grant select on table "public"."clinics" to "service_role";

grant trigger on table "public"."clinics" to "service_role";

grant truncate on table "public"."clinics" to "service_role";

grant update on table "public"."clinics" to "service_role";

create policy "Enable read access for all users"
on "public"."branches"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."clinics"
as permissive
for select
to public
using (true);



