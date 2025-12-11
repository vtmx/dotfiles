#!/usr/bin/env python3
# File: y3
# Last Change: Wed, Dec 2025/12/10 - 08:11:20
# YouTube downloader com áudio por padrão, vídeo opcional, cortes de tempo,
# saída customizável e slug seguro.
# Autor: Sergio Araujo

import os
import sys
import subprocess
from slugify import slugify


# -------------------------------------------------------------
# HELP
# -------------------------------------------------------------
def show_help():
    print("""
Uso: y3 [opções] <URL> [INÍCIO] [FIM]

Padrão: baixa ÁUDIO (mp3), na pasta atual, com metadados e thumbnail.

Opções:
  -o, --out DIR      define pasta de saída
  --video            baixa o VÍDEO em máxima qualidade (MP4)
  --from TEMPO       tempo inicial (ex: 1:30, 90)
  --to TEMPO         tempo final
  -h, --help         mostra este help

Exemplos:

  y3 https://youtu.be/abc123
      → baixa em mp3, com metadados

  y3 https://youtu.be/abc123 1:30 2:30
      → baixa do 1:30 ao 2:30

  y3 https://youtu.be/abc123 --from 30 --to 90
      → baixa do 0:30 ao 1:30

  y3 --video https://youtu.be/abc123
      → baixa vídeo em máxima qualidade e mescla para MP4

  y3 -o ~/Music https://youtu.be/abc123
      → baixa áudio em ~/Music
""")
    sys.exit(0)


# -------------------------------------------------------------
# Converter tempo flexível (1:23, 01:20, 70, 1:02:03, etc.)
# -------------------------------------------------------------
def normalize_time(t):
    if t is None:
        return None
    if t.isdigit():
        return int(t)

    parts = [int(x) for x in t.split(":")]
    if len(parts) == 2:
        m, s = parts
        return m * 60 + s
    if len(parts) == 3:
        h, m, s = parts
        return h * 3600 + m * 60 + s

    raise ValueError(f"Formato de tempo inválido: {t}")


# -------------------------------------------------------------
# Executar comando
# -------------------------------------------------------------
def run(cmd):
    return subprocess.run(cmd, check=False)


# -------------------------------------------------------------
# MAIN
# -------------------------------------------------------------
def main():
    args = sys.argv[1:]

    if not args or args[0] in ("-h", "--help"):
        show_help()

    # Flags
    out_dir = "./"
    video_mode = False
    time_from = None
    time_to = None

    # Processamento manual
    cleaned = []
    i = 0
    while i < len(args):
        a = args[i]

        if a in ("-o", "--out") and i + 1 < len(args):
            out_dir = args[i + 1]
            i += 1

        elif a == "--video":
            video_mode = True

        elif a == "--from" and i + 1 < len(args):
            time_from = args[i + 1]
            i += 1

        elif a == "--to" and i + 1 < len(args):
            time_to = args[i + 1]
            i += 1

        else:
            cleaned.append(a)

        i += 1

    if len(cleaned) == 0:
        print("Erro: URL ausente.")
        sys.exit(1)

    url = cleaned[0]
    extra_times = cleaned[1:]

    # Tempos diretos
    if len(extra_times) >= 1 and time_from is None:
        time_from = extra_times[0]
    if len(extra_times) >= 2 and time_to is None:
        time_to = extra_times[1]

    # Normalizar tempos
    try:
        t_start = normalize_time(time_from)
        t_end = normalize_time(time_to)
    except ValueError as e:
        print(e)
        sys.exit(1)

    # Obtém título
    get_title = subprocess.run(
        ["yt-dlp", "--get-title", url],
        capture_output=True,
        text=True
    )
    title = get_title.stdout.strip()

    if not title:
        print("Erro: não foi possível obter o título.")
        sys.exit(1)

    slug = slugify(title)
    print(f"Título: {title}")
    print(f"Slug:   {slug}")
    print("Baixando...\n")

    # Montar comando yt-dlp
    cmd = ["yt-dlp"]

    # ---------------------------------------------------------
    # MODO VÍDEO
    # ---------------------------------------------------------
    if video_mode:
        cmd += [
            "-o", os.path.join(out_dir, f"{slug}.%(ext)s"),
            "-f", "bestvideo+bestaudio/best",
            "--merge-output-format", "mp4"
        ]

    # ---------------------------------------------------------
    # MODO ÁUDIO (PADRÃO)
    # ---------------------------------------------------------
    else:
        cmd += [
            "-o", os.path.join(out_dir, f"{slug}.%(ext)s"),
            "-x",
            "--audio-format", "mp3",
            "--add-metadata",
            "--embed-thumbnail"
        ]

    # Cortes de tempo
    if t_start is not None:
        if t_end is None:
            section = f"*{t_start}-"
        else:
            section = f"*{t_start}-{t_end}"

        cmd += ["--download-sections", section]

    cmd.append(url)

    # Executar
    run(cmd)

    print("\nConcluído.")


if __name__ == "__main__":
    main()
