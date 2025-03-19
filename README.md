# ✨ Starlight Docs Template (with Nix + direnv + pnpm)

This project is a **ready-to-roll template** for documentation projects using:

- [Starlight (Astro)](https://starlight.astro.build/)
- [Nix flakes](https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html)
- [direnv](https://direnv.net/) for shell automation
- [pnpm](https://pnpm.io/) and useful dev tooling
- Git hooks and linting for a clean dev workflow

---

## ⚡ Getting Started

```bash
# Clone the repo
git clone <your-repo-url>
cd starlight-docs-template

# Allow direnv to load the nix environment
direnv allow

# If not yet initialized, the docs/ folder will be bootstrapped automatically
cd docs/
pnpm dev
```

---


## 🧠 Included Tools
- Justfile (task runner alternative to Makefile)

- Node.js (latest via Nix)
- pnpm
- Prettier
- Markdownlint
- Typescript
- Git
- node-gyp

## 🧼 Git Hook Setup

```bash
pnpm dlx lefthook install
```

## 💡 Linting & Formatting

```bash
pnpm fmt
pnpm lint:md
```

## 📁 Project Structure
```
.
├── flake.nix
├── .envrc
├── docs/
│   └── Starlight project
├── .editorconfig
├── .prettierrc
├── tsconfig.json
├── lefthook.yml
├── .markdownlint.json
└── README.md
```

Happy documenting! ✍️

---

## 🧾 Using the Justfile

This project uses [just](https://just.systems) as a modern, minimal task runner.

Install it via:

```bash
# Debian/Ubuntu
sudo apt install just

# MacOS
brew install just

# Nix
nix profile install nixpkgs#just
```

### Common Commands

```bash
just dev       # Start dev server
just build     # Build docs
just install   # Install dependencies
just lint      # Run Prettier & Markdownlint
just fmt       # Format code
just setup     # Init Git hooks
just clean     # Remove build output
```

Now you’re all set to roll!---

## 🔗 Using this Template from GitHub

1. **Clone the repository:**

```bash
git clone https://github.com/YOUR_USERNAME/starlight-docs-template.git
cd starlight-docs-template
```

2. **(Optional) Change the remote:**

If you forked or want to push to a new origin:

```bash
git remote set-url origin git@github.com:YOUR_USERNAME/YOUR_NEW_REPO.git
```

3. **Create your own content:**

Edit the docs inside the `docs/` directory — you can use Markdown, Astro components, and more.

4. **Commit & Push your changes:**

```bash
git add .
git commit -m "Your message"
git push
```

---

## 🚀 Quick Start with bootstrap.sh

```bash
./bootstrap.sh
```

This will:
- Run `direnv allow`
- Install dependencies
- Set up Git hooks

---

## 📜 License Management

Choose or update your license via:

```bash
./license-chooser.sh
```

---

## 📈 Add Analytics (Optional)

Include the `Plausible.astro` component in your layout:

```astro
<Plausible domain="yourdomain.com" />
```