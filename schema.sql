create table if not exists public.diary_entries(id uuid primary key default gen_random_uuid(),user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,entry_date date not null,content text not null,created_at timestamptz not null default now(),updated_at timestamptz not null default now(),unique(user_id,entry_date));
alter table public.diary_entries enable row level security;
create policy "owner read" on public.diary_entries for select using(auth.uid()=user_id);
create policy "owner insert" on public.diary_entries for insert with check(auth.uid()=user_id);
create policy "owner update" on public.diary_entries for update using(auth.uid()=user_id) with check(auth.uid()=user_id);
create policy "owner delete" on public.diary_entries for delete using(auth.uid()=user_id);