-- Lolito: tablas y permisos. Pegar completo en Supabase → SQL Editor → Run (una sola vez).
-- Cada usuario solo puede ver y cambiar sus propias filas (RLS).

-- Un shift o una llamada freelance por fila
create table public.registros (
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  id text not null,
  datos jsonb not null,
  primary key (user_id, id)
);

-- Una fila por usuario: tarifas, tipo de cambio, ciclos de pago y plan de la semana
create table public.ajustes (
  user_id uuid primary key default auth.uid() references auth.users on delete cascade,
  datos jsonb not null,
  actualizado timestamptz not null default now()
);

alter table public.registros enable row level security;
alter table public.ajustes enable row level security;

create policy "Solo sus registros" on public.registros
  for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));

create policy "Solo sus ajustes" on public.ajustes
  for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));

grant select, insert, update, delete on public.registros, public.ajustes to authenticated;
