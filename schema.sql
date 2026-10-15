-- Run in Supabase Dashboard > SQL Editor.
create table if not exists public.galleries (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  slug text not null unique,
  subtitle text default 'Pre-Wedding Story',
  shoot_date text,
  folder_url text not null,
  folder_id text not null,
  description text,
  published boolean not null default true,
  created_at timestamptz not null default now()
);

alter table public.galleries enable row level security;

drop policy if exists "Public read published galleries" on public.galleries;
create policy "Public read published galleries" on public.galleries
for select to anon using (published = true);

drop policy if exists "Signed-in users read galleries" on public.galleries;
create policy "Signed-in users read galleries" on public.galleries
for select to authenticated using (true);

drop policy if exists "Signed-in users insert galleries" on public.galleries;
create policy "Signed-in users insert galleries" on public.galleries
for insert to authenticated with check (true);

drop policy if exists "Signed-in users update galleries" on public.galleries;
create policy "Signed-in users update galleries" on public.galleries
for update to authenticated using (true) with check (true);

drop policy if exists "Signed-in users delete galleries" on public.galleries;
create policy "Signed-in users delete galleries" on public.galleries
for delete to authenticated using (true);
