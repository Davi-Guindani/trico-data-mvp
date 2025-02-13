alter table "public"."profiles" add column "clinic_id" uuid;

alter table "public"."profiles" add constraint "profiles_clinic_id_fkey" FOREIGN KEY (clinic_id) REFERENCES clinics(id) not valid;

alter table "public"."profiles" validate constraint "profiles_clinic_id_fkey";


