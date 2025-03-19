# 🤝 Contributing Guide

Thanks for your interest in contributing to this project!

## 🛠 Development Setup

- Make sure you have **direnv** and **Nix** installed.
- Run `direnv allow` in the root directory.
- Work inside the `devShell` environment.

## 📦 Add or Update Packages

Use `pnpm` inside the `docs/` folder. Run:

```bash
cd docs/
pnpm install <your-package>
```

## ✅ Checklist before committing

- Run `pnpm fmt` and `pnpm lint:md`
- Run `pnpm build` to make sure everything still compiles
- If you've added a new feature, consider updating the README/docs.

## 📬 Submit a Pull Request

- Make sure your changes are atomic and well-described.
- Link to any related issues.
- Keep commits clean and meaningful.

Thanks, console cowboy 🖖