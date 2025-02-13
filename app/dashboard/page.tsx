import { redirect } from "next/navigation";
import type { Tables } from "@/database.types";
import { createClient } from "@/utils/supabase/server";

export default async function PrivatePage() {
  const supabase = await createClient();

  const {
    data: { user },
    error,
  } = await supabase.auth.getUser();
  if (!user || error) redirect("/login");

  const { data: profile } = await supabase
    .from("profiles")
    .select("*")
    .eq("id", user.id)
    .single<Tables<"profiles">>();

  return (
    <div>
      <p>Hello {profile?.full_name}</p>
      <p>Username: {profile?.username}</p>
    </div>
  );
}
