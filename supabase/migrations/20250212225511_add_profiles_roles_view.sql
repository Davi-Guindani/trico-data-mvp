create or replace view "public"."profiles_roles_view" as  SELECT pr.profile_id,
    array_agg(r.name) AS roles
   FROM (profiles_roles pr
     JOIN roles r ON ((pr.role_id = r.id)))
  GROUP BY pr.profile_id;



