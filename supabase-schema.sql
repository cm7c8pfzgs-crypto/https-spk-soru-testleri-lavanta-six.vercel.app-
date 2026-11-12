-- Run this in Supabase Dashboard > SQL Editor.
-- Each account can read and change only its own progress row.
create table if not exists public.quiz_user_progress (
  user_id uuid primary key references auth.users (id) on delete cascade,
  progress jsonb not null default '{"attempts": {}, "runs": []}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.quiz_user_progress enable row level security;

drop policy if exists "Users can read own quiz progress" on public.quiz_user_progress;
create policy "Users can read own quiz progress"
  on public.quiz_user_progress for select to authenticated
  using ((select auth.uid()) = user_id);

drop policy if exists "Users can create own quiz progress" on public.quiz_user_progress;
create policy "Users can create own quiz progress"
  on public.quiz_user_progress for insert to authenticated
  with check ((select auth.uid()) = user_id);

drop policy if exists "Users can update own quiz progress" on public.quiz_user_progress;
create policy "Users can update own quiz progress"
  on public.quiz_user_progress for update to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

grant select, insert, update on public.quiz_user_progress to authenticated;
