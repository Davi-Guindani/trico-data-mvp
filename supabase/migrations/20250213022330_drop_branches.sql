drop policy "Enable read access for all users" on "public"."branches";

revoke delete on table "public"."branches" from "anon";

revoke insert on table "public"."branches" from "anon";

revoke references on table "public"."branches" from "anon";

revoke select on table "public"."branches" from "anon";

revoke trigger on table "public"."branches" from "anon";

revoke truncate on table "public"."branches" from "anon";

revoke update on table "public"."branches" from "anon";

revoke delete on table "public"."branches" from "authenticated";

revoke insert on table "public"."branches" from "authenticated";

revoke references on table "public"."branches" from "authenticated";

revoke select on table "public"."branches" from "authenticated";

revoke trigger on table "public"."branches" from "authenticated";

revoke truncate on table "public"."branches" from "authenticated";

revoke update on table "public"."branches" from "authenticated";

revoke delete on table "public"."branches" from "service_role";

revoke insert on table "public"."branches" from "service_role";

revoke references on table "public"."branches" from "service_role";

revoke select on table "public"."branches" from "service_role";

revoke trigger on table "public"."branches" from "service_role";

revoke truncate on table "public"."branches" from "service_role";

revoke update on table "public"."branches" from "service_role";

alter table "public"."branches" drop constraint "branches_admin_id_fkey";

alter table "public"."branches" drop constraint "branches_clinic_id_fkey";

alter table "public"."branches" drop constraint "branches_pkey";

drop index if exists "public"."branches_pkey";

drop table "public"."branches";


