#!/usr/bin/env bash
set -e

echo "🔧 Bootstrapping Starlight Docs Template..."

# Ensure direnv and pnpm are available
command -v direnv >/dev/null 2>&1 || { echo "direnv not found. Install it first."; exit 1; }
command -v pnpm >/dev/null 2>&1 || { echo "pnpm not found. Install it first."; exit 1; }

echo "✅ Running direnv allow..."
direnv allow

echo "📦 Installing dependencies..."
cd docs
pnpm install
cd ..

echo "🔗 Setting up Git hooks..."
pnpm dlx lefthook install

echo "✨ Done! Run 'just dev' to start the docs server."