# ⚓ Isaac's Ministry Hub

A personal ministry tracker — prayer, people, deadlines, study — backed by Supabase and deployed on Vercel.

---

## Setup (do this once)

### Step 1 — Run the database schema

1. Go to [supabase.com](https://supabase.com) → your `isaac-ministry-hub` project
2. Click **SQL Editor** in the left sidebar
3. Click **New Query**
4. Open the file `schema.sql` from this repo, copy everything, paste it in
5. Click **Run**
6. You should see: "Success. No rows returned"
7. This creates all your tables AND seeds all the prayer points from your phone notes

### Step 2 — Deploy to Vercel

1. Go to [vercel.com](https://vercel.com) and sign up with your GitHub account
2. Click **Add New → Project**
3. Find `Isaac-ministry-hub` in the list → click **Import**
4. Leave all settings as default
5. Click **Deploy**
6. Wait ~30 seconds — you'll get a live URL like `https://isaac-ministry-hub.vercel.app`

### Step 3 — Add to your phone home screen

**iPhone:**
1. Open the URL in Safari
2. Tap the Share button (box with arrow)
3. Tap **Add to Home Screen**
4. Tap **Add**

It'll appear as an app icon on your home screen and open full screen like a native app.

---

## How Claude can update it directly

Now that the app is live with a real database, Claude can:
- Add prayer points directly into Supabase via the API (no re-downloading)
- Update the code on GitHub and Vercel auto-deploys within seconds
- Read your prayer list and suggest additions

Just paste a Google Doc or phone notes into the chat and say "add these as prayer points" — Claude will push them straight to the database.

---

## File structure

```
index.html     — the entire app (HTML + CSS + JS)
schema.sql     — database tables + seeded prayer points
vercel.json    — routing config for Vercel
README.md      — this file
```

---

## Data

All data lives in your Supabase database — not on any device. Access from any phone, browser, or computer by visiting the Vercel URL.

The green dot in the top right of the app shows sync status:
- 🟢 Green = connected and saved
- 🟠 Orange = currently saving
- 🔴 Red = connection error
