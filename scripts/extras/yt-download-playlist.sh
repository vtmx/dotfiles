#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

echo
read -rp "Playlist: " playlist
read -rp "Link: " url
dist="~/Music/${playlist}"

if [[ ! -d "{dist}" ]]; then
  mkdir -p "${dist}"
fi

yt-dlp -x --audio-format mp3 -o "${dist}/%(title)s.%(ext)s" "${url}"

