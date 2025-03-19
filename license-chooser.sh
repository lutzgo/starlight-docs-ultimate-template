#!/usr/bin/env bash
set -e

echo "📜 License Chooser"
echo "Available licenses:"
echo "1) MIT"
echo "2) Apache-2.0"
echo "3) GNU GPLv3"
read -p "Choose a license [1-3]: " choice

case $choice in
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
    echo "❌ Invalid choice."
    ;;
esac