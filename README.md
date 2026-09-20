# Chethan Private Diary 🔒

A dark, cross-device personal diary. Diary content is stored in Supabase, not browser localStorage.

## Setup
1. Create a Supabase project.
2. In Authentication → Users, create the private account used by index.html.
3. Run schema.sql in Supabase SQL Editor.
4. Open index.html and replace YOUR_SUPABASE_URL and YOUR_SUPABASE_ANON_KEY.
5. Deploy with GitHub Pages, Netlify, or another static host.

## Daily behavior
- All dates use Asia/Kolkata (IST).
- Writing opens at 12:00 AM IST and closes at 12:00 PM IST.
- If no entry exists when the window closes, that date is shown as MISSED.
- Each entry becomes a card with a date and summary; clicking it opens the complete entry.
- Entries live in Supabase, so they are available on another device after logging in.
- The frontend does not use localStorage for diary data or persisted sessions.

## Security
Use only the Supabase anon/public key in the browser. Never put a Supabase service-role key in index.html. Row Level Security in schema.sql limits diary rows to the authenticated account.