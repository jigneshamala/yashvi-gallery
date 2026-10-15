# Yashvi Studio Gallery Manager

## Included
- `index.html`: responsive website with admin login, create/edit/delete/publish gallery, copy client link, client photo grid and download links.
- `schema.sql`: Supabase database table and row-level security policies.
- Admin route: `https://YOUR-DOMAIN/?admin=1`
- Client route: `https://YOUR-DOMAIN/?gallery=rahul-priya`

## Setup before deployment
1. Create a project at https://supabase.com/
2. In Supabase, open SQL Editor and run `schema.sql`.
3. In Supabase Authentication settings, disable public sign-ups.
4. In Authentication > Users, create your own admin user/email/password.
5. In Supabase project API settings, copy Project URL and publishable/anon key. Never use the service_role key in browser code.
6. Edit `index.html` in an Android code editor and replace:
   - `PASTE_SUPABASE_PROJECT_URL_HERE`
   - `PASTE_SUPABASE_PUBLISHABLE_OR_ANON_KEY_HERE`
   - `PASTE_YOUR_GOOGLE_DRIVE_API_KEY_HERE`
7. Create a Google Cloud project, enable Google Drive API, create an API key, restrict API restrictions to Google Drive API. After deployment, add website referrer restriction for the exact Vercel domain, e.g. `https://your-real-site.vercel.app/*`.
8. Upload `index.html` and `schema.sql` to a GitHub repository named `yashvi-gallery`.
9. Import the repository in https://vercel.com/ and deploy as a plain HTML site. No build command is needed.
10. Open `/?admin=1`, sign in and add each couple's gallery. Paste the Drive folder URL; folder ID auto-fills from a standard Drive URL. Save, then tap Copy client link.

## Google Drive setup
For the simple public-link method, set each couple's folder General access to "Anyone with the link — Viewer", only with client consent. Photos must be directly inside the folder, not nested subfolders. Public Drive links are not private: anyone who obtains the folder/gallery link may be able to view or download photos. Use a private authenticated storage system if privacy is required.

## Important security note
This is a starter, not a security-audited production system. The SQL policies assume only trusted users are added in Supabase Auth. Disable public sign-ups and only create admin accounts you trust. If you later add staff accounts, implement explicit admin roles before granting management access. Never put service_role keys, passwords or OAuth client secrets in `index.html`.
