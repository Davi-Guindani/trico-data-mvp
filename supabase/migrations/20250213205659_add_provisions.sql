create table "public"."provisions" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "service_id" uuid not null default gen_random_uuid(),
    "tricologist_id" uuid not null default gen_random_uuid(),
    "secretary_id" uuid not null default gen_random_uuid(),
    "customer_id" uuid not null default gen_random_uuid(),
    "date" timestamp with time zone not null
);


alter table "public"."provisions" enable row level security;

CREATE UNIQUE INDEX provisions_pkey ON public.provisions USING btree (id);

alter table "public"."provisions" add constraint "provisions_pkey" PRIMARY KEY using index "provisions_pkey";

alter table "public"."provisions" add constraint "provisions_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(id) not valid;

alter table "public"."provisions" validate constraint "provisions_customer_id_fkey";

alter table "public"."provisions" add constraint "provisions_secretary_id_fkey" FOREIGN KEY (secretary_id) REFERENCES profiles(id) not valid;

alter table "public"."provisions" validate constraint "provisions_secretary_id_fkey";

alter table "public"."provisions" add constraint "provisions_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."provisions" validate constraint "provisions_service_id_fkey";

alter table "public"."provisions" add constraint "provisions_tricologist_id_fkey" FOREIGN KEY (tricologist_id) REFERENCES profiles(id) not valid;

alter table "public"."provisions" validate constraint "provisions_tricologist_id_fkey";

grant delete on table "public"."provisions" to "anon";

grant insert on table "public"."provisions" to "anon";

grant references on table "public"."provisions" to "anon";

grant select on table "public"."provisions" to "anon";

grant trigger on table "public"."provisions" to "anon";

grant truncate on table "public"."provisions" to "anon";

grant update on table "public"."provisions" to "anon";

grant delete on table "public"."provisions" to "authenticated";

grant insert on table "public"."provisions" to "authenticated";

grant references on table "public"."provisions" to "authenticated";

grant select on table "public"."provisions" to "authenticated";

grant trigger on table "public"."provisions" to "authenticated";

grant truncate on table "public"."provisions" to "authenticated";

grant update on table "public"."provisions" to "authenticated";

grant delete on table "public"."provisions" to "service_role";

grant insert on table "public"."provisions" to "service_role";

grant references on table "public"."provisions" to "service_role";

grant select on table "public"."provisions" to "service_role";

grant trigger on table "public"."provisions" to "service_role";

grant truncate on table "public"."provisions" to "service_role";

grant update on table "public"."provisions" to "service_role";

create policy "Enable read access for all users"
on "public"."provisions"
as permissive
for select
to public
using (true);



