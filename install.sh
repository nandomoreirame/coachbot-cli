#!/usr/bin/env bash
set -euo pipefail

REPO="nandomoreirame/coachbot-cli"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}"
FILES=("coachbot" "phrases.json" "phrases-pt-br.json")

detect_install_dir() {
  local os
  os="$(uname -s)"

  case "$os" in
    Linux*)
      echo "${HOME}/.local/bin"
      ;;
    Darwin*)
      echo "${HOME}/.local/bin"
      ;;
    MINGW*|MSYS*|CYGWIN*)
      echo "${HOME}/.local/bin"
      ;;
    *)
      echo "Unsupported OS: $os" >&2
      exit 1
      ;;
  esac
}

download() {
  local url="$1" dest="$2"
  if command -v curl &>/dev/null; then
    curl -fsSL "$url" -o "$dest"
  elif command -v wget &>/dev/null; then
    wget -qO "$dest" "$url"
  else
    echo "Error: curl or wget is required" >&2
    exit 1
  fi
}

INSTALL_DIR="${COACHBOT_INSTALL_DIR:-$(detect_install_dir)}"

echo "Installing CoachBot to ${INSTALL_DIR}..."

mkdir -p "$INSTALL_DIR"

for file in "${FILES[@]}"; do
  echo "  Downloading ${file}..."
  download "${BASE_URL}/${file}" "${INSTALL_DIR}/${file}"
done

chmod +x "${INSTALL_DIR}/coachbot"

if ! echo "$PATH" | tr ':' '\n' | grep -qx "$INSTALL_DIR"; then
  echo ""
  echo "Add this to your shell profile (~/.bashrc, ~/.zshrc, etc.):"
  echo ""
  echo "  export PATH=\"${INSTALL_DIR}:\$PATH\""
  echo ""
fi

echo "Done! Run 'coachbot' to get coached."
