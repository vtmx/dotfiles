#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

playlist="https://music.youtube.com/playlist?list=PLaI_ujMy5jERUTZf6Aon75woA-aoiJDns"

main() {
  ytdlp -x --audio-format mp3 -o "%(title)s.%(ext)s" "${playlist}"
}

main
