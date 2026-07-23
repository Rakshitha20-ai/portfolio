# Rakshitha S — Data Analyst Portfolio

A single-page portfolio site (`index.html`) — no build step, no dependencies to install. Just upload and host.

## What's in this folder
```
portfolio/
├── index.html          ← the whole site (HTML + CSS + JS in one file)
├── resume/
│   └── Rakshitha_Sudharshna_Resume.pdf   ← ADD YOUR RESUME PDF HERE (see step 2)
└── README.md
```

## Before you publish — 2 things to do

1. **Add your GitHub link.** Open `index.html`, search for `add your GitHub URL` in the Contact section, and replace the `href="#"` with your real GitHub profile URL.
2. **Add your resume PDF.** Create a folder named `resume` next to `index.html`, and put your resume PDF inside it named exactly `Rakshitha_Sudharshna_Resume.pdf` — the "Resume" buttons already link to that path.

## How to host it on GitHub Pages (free, ~5 minutes)

**Option A — using the GitHub website (no command line needed)**

1. Go to [github.com](https://github.com) and log in (create a free account if you don't have one).
2. Click the **+** icon top-right → **New repository**.
3. Name it exactly `your-username.github.io` (replace `your-username` with your actual GitHub username). This exact naming makes GitHub host it automatically at that URL.
4. Set it to **Public**, then click **Create repository**.
5. On the new repo page, click **uploading an existing file**.
6. Drag in `index.html`, the `resume` folder (with your PDF inside), and `README.md`.
7. Scroll down, click **Commit changes**.
8. Go to **Settings → Pages** (left sidebar).
9. Under "Build and deployment", Source should be **Deploy from a branch**, Branch: **main**, folder: **/ (root)**. Click **Save**.
10. Wait 1–2 minutes, then visit `https://your-username.github.io` — your portfolio is live.

**Option B — using git from the command line**

```bash
# inside this portfolio folder
git init
git add .
git commit -m "Add portfolio site"
git branch -M main
git remote add origin https://github.com/your-username/your-username.github.io.git
git push -u origin main
```

Then repeat steps 8–10 above to turn on Pages.

## Updating the site later

Any time you edit `index.html` (new project, updated numbers, new job), just re-upload it to the same GitHub repo (or `git add . && git commit -m "update" && git push`). GitHub Pages redeploys automatically within a minute or two.

## Notes

- The site has no external image dependencies — the "RS" avatar is pure CSS, so nothing breaks if you don't add a photo. To add a real photo later, replace the `.avatar` div in `index.html` with an `<img>` tag pointing to an image you add to an `images/` folder.
- Fully responsive down to mobile, and respects reduced-motion settings.
- If you want a custom domain later (e.g. `rakshithas.com`) instead of the `github.io` address, GitHub Pages supports that too — ask and I can walk you through it.
