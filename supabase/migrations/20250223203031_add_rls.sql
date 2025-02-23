create policy "Enable read access for all users"
on "public"."sales_services"
as permissive
for select
to public
using (true);



