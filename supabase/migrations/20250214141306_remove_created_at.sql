drop view if exists "public"."profiles_roles_view";

alter table "public"."clinics" drop column "created_at";

alter table "public"."customers" drop column "created_at";

alter table "public"."products" drop column "created_at";

alter table "public"."profiles_roles" drop column "created_at";

alter table "public"."provisions" drop column "created_at";

alter table "public"."purchases" drop column "created_at";

alter table "public"."purchases_products" drop column "created_at";

alter table "public"."roles" drop column "created_at";

alter table "public"."sales" drop column "created_at";

alter table "public"."sales_products" drop column "created_at";

alter table "public"."sales_services" drop column "created_at";

alter table "public"."services" drop column "created_at";

create or replace view "public"."profiles_roles_view" as  SELECT pr.profile_id,
    array_agg(r.name) AS roles
   FROM (profiles_roles pr
     JOIN roles r ON ((pr.role_id = r.id)))
  GROUP BY pr.profile_id;



