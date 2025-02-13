alter table "public"."clinics" drop constraint "clinics_admin_id_fkey";

alter table "public"."clinics" drop constraint "clinics_admin_id_key";

drop index if exists "public"."clinics_admin_id_key";

alter table "public"."clinics" drop column "admin_id";


