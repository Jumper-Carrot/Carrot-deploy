#!/usr/bin/env bash
set -e

OWNER="Jumper-Carrot"
REPO="Carrot-deploy"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/$OWNER/$REPO/$BRANCH"

FILES=(
  "docker-compose.yml"
  "docker-compose.traefik.yml"
  ".env.sample"
  "README.md"
)


INSTALL_DIR="$(pwd)"
echo "📁 Installing in: $INSTALL_DIR"

for f in "${FILES[@]}"; do
    DEST="$INSTALL_DIR/$f"
    DEST_DIR=$(dirname "$DEST")
    mkdir -p "$DEST_DIR"
    echo "↓ $f"
    curl -fsSL "$BASE_URL/$f" -o "$DEST"
done

echo "✅ Installation completed. Existing files have been replaced if present."
echo -e "\nNext steps:"
echo "1. Rename .env.sample to .env and configure it:"
echo "   mv .env.sample .env"
echo "2. Run the application with Docker Compose:"
echo "   docker compose up -d"