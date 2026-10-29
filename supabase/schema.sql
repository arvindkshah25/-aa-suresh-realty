create extension if not exists pgcrypto;
create table if not exists public.properties (
 id uuid primary key default gen_random_uuid(),
 title text not null, category text not null default 'Apartment',
 listing_type text not null default 'Buy' check (listing_type in ('Buy','Rent','Resale')),
 price numeric not null default 0, location text not null default 'Ulwe, Navi Mumbai',
 bedrooms integer not null default 1, bathrooms integer not null default 1, area_sqft integer not null default 0,
 image_url text not null default '', description text not null default '',
 status text not null default 'Available' check (status in ('Available','Sold','Rented')),
 created_by uuid references auth.users(id) on delete set null, created_at timestamptz not null default now()
);
create table if not exists public.favorites (
 user_id uuid references auth.users(id) on delete cascade not null,
 property_id uuid references public.properties(id) on delete cascade not null,
 created_at timestamptz not null default now(), primary key(user_id,property_id)
);
alter table public.properties enable row level security;
alter table public.favorites enable row level security;
create policy "Public can read properties" on public.properties for select using (true);
create policy "Users insert own listings" on public.properties for insert to authenticated with check(auth.uid()=created_by);
create policy "Creators update own listings" on public.properties for update to authenticated using(auth.uid()=created_by) with check(auth.uid()=created_by);
create policy "Creators delete own listings" on public.properties for delete to authenticated using(auth.uid()=created_by);
create policy "Users manage own favorites" on public.favorites for all to authenticated using(auth.uid()=user_id) with check(auth.uid()=user_id);