create table "public"."profiles_roles" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "profile_id" uuid default gen_random_uuid(),
    "role_id" uuid default gen_random_uuid()
);


alter table "public"."profiles_roles" enable row level security;

create table "public"."roles" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "name" text not null
);


alter table "public"."roles" enable row level security;

CREATE UNIQUE INDEX profiles_roles_pkey ON public.profiles_roles USING btree (id);

CREATE UNIQUE INDEX roles_name_key ON public.roles USING btree (name);

CREATE UNIQUE INDEX roles_pkey ON public.roles USING btree (id);

alter table "public"."profiles_roles" add constraint "profiles_roles_pkey" PRIMARY KEY using index "profiles_roles_pkey";

alter table "public"."roles" add constraint "roles_pkey" PRIMARY KEY using index "roles_pkey";

alter table "public"."profiles_roles" add constraint "profiles_roles_profile_id_fkey" FOREIGN KEY (profile_id) REFERENCES profiles(id) not valid;

alter table "public"."profiles_roles" validate constraint "profiles_roles_profile_id_fkey";

alter table "public"."profiles_roles" add constraint "profiles_roles_role_id_fkey" FOREIGN KEY (role_id) REFERENCES roles(id) not valid;

alter table "public"."profiles_roles" validate constraint "profiles_roles_role_id_fkey";

alter table "public"."roles" add constraint "roles_name_key" UNIQUE using index "roles_name_key";

grant delete on table "public"."profiles_roles" to "anon";

grant insert on table "public"."profiles_roles" to "anon";

grant references on table "public"."profiles_roles" to "anon";

grant select on table "public"."profiles_roles" to "anon";

grant trigger on table "public"."profiles_roles" to "anon";

grant truncate on table "public"."profiles_roles" to "anon";

grant update on table "public"."profiles_roles" to "anon";

grant delete on table "public"."profiles_roles" to "authenticated";

grant insert on table "public"."profiles_roles" to "authenticated";

grant references on table "public"."profiles_roles" to "authenticated";

grant select on table "public"."profiles_roles" to "authenticated";

grant trigger on table "public"."profiles_roles" to "authenticated";

grant truncate on table "public"."profiles_roles" to "authenticated";

grant update on table "public"."profiles_roles" to "authenticated";

grant delete on table "public"."profiles_roles" to "service_role";

grant insert on table "public"."profiles_roles" to "service_role";

grant references on table "public"."profiles_roles" to "service_role";

grant select on table "public"."profiles_roles" to "service_role";

grant trigger on table "public"."profiles_roles" to "service_role";

grant truncate on table "public"."profiles_roles" to "service_role";

grant update on table "public"."profiles_roles" to "service_role";

grant delete on table "public"."roles" to "anon";

grant insert on table "public"."roles" to "anon";

grant references on table "public"."roles" to "anon";

grant select on table "public"."roles" to "anon";

grant trigger on table "public"."roles" to "anon";

grant truncate on table "public"."roles" to "anon";

grant update on table "public"."roles" to "anon";

grant delete on table "public"."roles" to "authenticated";

grant insert on table "public"."roles" to "authenticated";

grant references on table "public"."roles" to "authenticated";

grant select on table "public"."roles" to "authenticated";

grant trigger on table "public"."roles" to "authenticated";

grant truncate on table "public"."roles" to "authenticated";

grant update on table "public"."roles" to "authenticated";

grant delete on table "public"."roles" to "service_role";

grant insert on table "public"."roles" to "service_role";

grant references on table "public"."roles" to "service_role";

grant select on table "public"."roles" to "service_role";

grant trigger on table "public"."roles" to "service_role";

grant truncate on table "public"."roles" to "service_role";

grant update on table "public"."roles" to "service_role";

create policy "Enable read access for all users"
on "public"."roles"
as permissive
for select
to public
using (true);



