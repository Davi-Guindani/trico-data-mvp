alter table "public"."branches" add column "admin_id" uuid not null;

alter table "public"."clinics" add column "admin_id" uuid not null;

CREATE UNIQUE INDEX clinics_admin_id_key ON public.clinics USING btree (admin_id);

alter table "public"."branches" add constraint "branches_admin_id_fkey" FOREIGN KEY (admin_id) REFERENCES profiles(id) not valid;

alter table "public"."branches" validate constraint "branches_admin_id_fkey";

alter table "public"."clinics" add constraint "clinics_admin_id_fkey" FOREIGN KEY (admin_id) REFERENCES profiles(id) not valid;

alter table "public"."clinics" validate constraint "clinics_admin_id_fkey";

alter table "public"."clinics" add constraint "clinics_admin_id_key" UNIQUE using index "clinics_admin_id_key";


