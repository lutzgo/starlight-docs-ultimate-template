#!/usr/bin/env bash
set -e

echo "🧙 Welcome to the Starlight Docs Template Bootstrap Wizard!"
echo "──────────────────────────────────────────────────────────"

read -p "📦 Enter your project name: " PROJECT_NAME
[ -z "$PROJECT_NAME" ] && PROJECT_NAME="starlight-docs"

read -p "📈 Enable Plausible Analytics? (y/n): " ENABLE_PLAUSIBLE

echo "📜 Choose a license:"
echo "  1) MIT"
echo "  2) Apache-2.0"
echo "  3) GNU GPLv3"
read -p "   [1-3]: " LICENSE_CHOICE

case $LICENSE_CHOICE in
  1)
    curl -s https://opensource.org/licenses/MIT | sed -n '/<pre>/,/<\/pre>/p' | sed 's/<[^>]*>//g' > LICENSE
    echo "✅ MIT license added."
    ;;
  2)
    curl -s https://www.apache.org/licenses/LICENSE-2.0.txt -o LICENSE
    echo "✅ Apache 2.0 license added."
    ;;
  3)
    curl -s https://www.gnu.org/licenses/gpl-3.0.txt -o LICENSE
    echo "✅ GPLv3 license added."
    ;;
  *)
    echo "⚠ Invalid input. Skipping license."
    ;;
esac

read -p "🔗 Do you want to set a git remote now? (y/n): " SET_REMOTE
if [[ "$SET_REMOTE" == "y" ]]; then
  read -p "   Enter remote URL: " GIT_REMOTE
  git init
  git remote add origin "$GIT_REMOTE"
  echo "✅ Git remote set."
fi

direnv allow

cd docs
if ! grep -q '"astro"' package.json; then
  echo "🌠 Adding missing Astro & Starlight dependencies..."
  pnpm add -D astro @astrojs/starlight
fi

pnpm install
cd ..

pnpm dlx lefthook install

echo "✨ Done. You can now run 'just dev' to start the server."