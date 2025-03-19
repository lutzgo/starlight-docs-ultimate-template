#!/usr/bin/env bash
set -e

clear
echo "
────────────────────────────────────────────────────────────
⛧  STARLIGHT DOCS TEMPLATE  ::  CYBER NODE INITIATED ∎
────────────────────────────────────────────────────────────
"
echo "🧙 BOOTSTRAP WIZARD :: INITIATING NODE UPLINK"
echo

read -p "📦 Project codename: " PROJECT_NAME
[ -z "$PROJECT_NAME" ] && PROJECT_NAME="starlight-docs"

read -p "📈 Enable Plausible Analytics Surveillance Bypass? (y/n): " ENABLE_PLAUSIBLE

echo "📜 Inject License Protocol:"
echo "  1) MIT"
echo "  2) Apache-2.0"
echo "  3) GNU GPLv3"
read -p "   Choose [1-3]: " LICENSE_CHOICE

case $LICENSE_CHOICE in
  1)
    curl -s https://opensource.org/licenses/MIT | sed -n '/<pre>/,/<\/pre>/p' | sed 's/<[^>]*>//g' > LICENSE
    echo "✅ MIT license activated."
    ;;
  2)
    curl -s https://www.apache.org/licenses/LICENSE-2.0.txt -o LICENSE
    echo "✅ Apache 2.0 license injected."
    ;;
  3)
    curl -s https://www.gnu.org/licenses/gpl-3.0.txt -o LICENSE
    echo "✅ GPLv3 license encrypted in vault."
    ;;
  *)
    echo "⚠ License undefined. Proceeding under Ghost Mode."
    ;;
esac

read -p "🔗 Configure git uplink? (y/n): " SET_REMOTE
if [[ "$SET_REMOTE" == "y" ]]; then
  read -p "   Enter remote URL: " GIT_REMOTE
  git init
  git remote add origin "$GIT_REMOTE"
  echo "✅ Remote uplink established."
fi

echo "🔐 Authorizing devshell protocol..."
direnv allow

echo "📂 Syncing node modules..."
cd docs
pnpm install
cd ..

echo "⚙ Deploying hookwatch daemons..."
pnpm dlx lefthook install

echo "✅ NODE READY :: RUN 'just dev' TO BOOT THE SYSTEM"