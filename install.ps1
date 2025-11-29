$ErrorActionPreference = "Stop"

$OWNER = "Jumper-Carrot"
$REPO = "Carrot-deploy"
$BRANCH = "main"
$BASE_URL = "https://raw.githubusercontent.com/$OWNER/$REPO/$BRANCH"

$FILES = @(
    "docker-compose.yml",
    "docker-compose.traefik.yml",
    ".env.sample",
    "README.md"
)

$INSTALL_DIR = Get-Location
Write-Host "📁 Installing in: $INSTALL_DIR"

foreach ($f in $FILES) {
    $DEST = Join-Path $INSTALL_DIR $f
    $DEST_DIR = Split-Path $DEST -Parent
    if (-not (Test-Path $DEST_DIR)) {
        New-Item -ItemType Directory -Path $DEST_DIR -Force | Out-Null
    }
    Write-Host "↓ $f"
    Invoke-WebRequest -Uri "$BASE_URL/$f" -OutFile $DEST -UseBasicParsing
}

Write-Host "✅ Installation completed. Existing files have been replaced if present."
Write-Host ""
Write-Host "Next steps:"
Write-Host "1. Copy .env.sample to .env and configure it:"
Write-Host "   Copy-Item .env.sample .env"
Write-Host "2. Run the application with Docker Compose:"
Write-Host "   docker compose up -d"
