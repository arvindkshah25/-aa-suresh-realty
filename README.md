# AA Suresh Realty

Responsive real-estate website for Ulwe, Navi Mumbai, built with React + Vite.

## Deploy with Vercel
- Import this GitHub repository into Vercel.
- Framework: Vite
- Build command: `npm run build`
- Output directory: `dist`

## Production setup
The current site has a browser-only preview mode. For real customer accounts, shared favorites and persistent property management, configure Supabase:
1. Create a Supabase project and run `supabase/schema.sql` in SQL Editor.
2. In Vercel Environment Variables set `VITE_SUPABASE_URL`, `VITE_SUPABASE_ANON_KEY`, and `VITE_OWNER_EMAIL`.
3. Redeploy. Do not put a Supabase service-role key in frontend environment variables.

## Business contact details
- Dilip Sonkar: 7021828058 / 7700994077
- Deepak Sonkar: 7021182005
- Haribhau Kunj, Shop No. 03, Plot No. 398, Sector-24, Ulwe, Navi Mumbai 410 206

Demo listings are illustrative; verify details before publishing.