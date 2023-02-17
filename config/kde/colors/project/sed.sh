#!/usr/bin/env bash

declare -A colors
colors[shade0]="#23272e"
colors[shade1]="#1e2227"
colors[shade2]="#3d4556"
colors[shade3]="#5c6370"
colors[shade4]="#2c313c"
colors[shade5]="#828997"
colors[shade6]="#979eab"
colors[shade7]="#abb2bf"
colors[accent0]="#e06c75"
colors[accent1]="#d19a66"
colors[accent2]="#e5c07b"
colors[accent3]="#98c379"
colors[accent4]="#56b6c2"
colors[accent5]="#61afef"
colors[accent6]="#c678dd"
colors[accent7]="#be5046"

input_file="input.colors"
output_file="output.colors"

sed \
-e s/\$shade0/${colors[shade0]}/g \
-e s/\$shade1/${colors[shade1]}/g \
-e s/\$shade2/${colors[shade2]}/g \
-e s/\$shade3/${colors[shade3]}/g \
-e s/\$shade4/${colors[shade4]}/g \
-e s/\$shade5/${colors[shade5]}/g \
-e s/\$shade6/${colors[shade6]}/g \
-e s/\$shade7/${colors[shade7]}/g \
-e s/\$accent0/${colors[accent0]}/g \
-e s/\$accent1/${colors[accent1]}/g \
-e s/\$accent2/${colors[accent2]}/g \
-e s/\$accent3/${colors[accent3]}/g \
-e s/\$accent4/${colors[accent4]}/g \
-e s/\$accent5/${colors[accent5]}/g \
-e s/\$accent6/${colors[accent6]}/g \
-e s/\$accent7/${colors[accent7]}/g \
${input_file} > ${output_file}
