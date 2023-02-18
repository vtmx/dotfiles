#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

#!/bin/bash

# Nome do arquivo de texto
filename="arquivo.txt"

# Ler cada linha do arquivo e armazená-la no array 'lines'
readarray -t lines < "$filename"

# Criar dois arrays para armazenar os atributos e os valores
declare -a attributes
declare -a values

# Percorrer cada linha do arquivo e armazenar os atributos e valores nos arrays correspondentes
for line in "${lines[@]}"
do
    attribute="$(echo "$line" | cut -d'=' -f1)"
    value="$(echo "$line" | cut -d'=' -f2)"
    attributes+=("$attribute")
    values+=("$value")
done

# Imprimir o conteúdo dos arrays
echo "Atributos: ${attributes[@]}"
echo "Valores: ${values[@]}"



