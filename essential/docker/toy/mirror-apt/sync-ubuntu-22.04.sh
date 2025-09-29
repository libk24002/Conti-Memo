#!/bin/bash
set -euo pipefail

# =========================
# Ensure rsync is installed
# =========================
if ! command -v rsync &>/dev/null; then
    echo "[INFO] rsync not found, installing..."
    if command -v apt-get &>/dev/null; then
        apt-get update -y && apt-get install -y rsync
    elif command -v yum &>/dev/null; then
        yum install -y rsync
    elif command -v dnf &>/dev/null; then
        dnf install -y rsync
    else
        echo "[ERROR] Package manager not found. Please install rsync manually."
        exit 1
    fi
fi

# =========================
# Config
# =========================
MIRROR="rsync://mirrors.tuna.tsinghua.edu.cn/ubuntu"
DIST_BASE="/data/ubuntu/dists"
POOL_BASE="/data/ubuntu/pool"
DIST_LIST=(jammy jammy-backports jammy-proposed jammy-security jammy-updates)
POOL_LIST=(main restricted universe multiverse)

# =========================
# Helper
# =========================
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

mkdir -p "$DIST_BASE" "$POOL_BASE"

# =========================
# Sync dists
# =========================
for DIST in "${DIST_LIST[@]}"; do
    log "Syncing dist: $DIST ..."
    rsync -avz --delete "${MIRROR}/dists/${DIST}" "$DIST_BASE" &
done

# =========================
# Sync pools
# =========================
for SECTION in "${POOL_LIST[@]}"; do
    log "Syncing pool: $SECTION ..."
    rsync -avz --delete "${MIRROR}/pool/${SECTION}" "$POOL_BASE" &
done

wait
log "Ubuntu 22.04 mirror sync finished!"
