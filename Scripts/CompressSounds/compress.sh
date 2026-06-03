#!/bin/bash

# Comprime todos os mp3 da pasta atual para a pasta 'compressed/'

INPUT_DIR="."
OUTPUT_DIR="compressed"
BITRATE="64k"

mkdir -p "$OUTPUT_DIR"

GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'
AGL="ꕤ"

spinner() {
  local pid=$1
  local frames=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
  local i=0
  while kill -0 "$pid" 2>/dev/null; do
    printf "\r  ${CYAN}%s${RESET} Comprimindo..." "${frames[$i]}"
    i=$(( (i + 1) % ${#frames[@]} ))
    sleep 0.08
  done
}

progress_bar() {
  local current=$1
  local total=$2
  local width=40
  local filled=$(( current * width / total ))
  local empty=$(( width - filled ))
  local bar=""
  for ((i=0; i<filled; i++)); do bar+="█"; done
  for ((i=0; i<empty; i++)); do bar+="░"; done
  printf "\r  [${GREEN}%s${RESET}] %d/%d" "$bar" "$current" "$total"
}

total=$(ls "$INPUT_DIR"/*.mp3 2>/dev/null | wc -l)

if [ "$total" -eq 0 ]; then
  echo "Nenhum arquivo .mp3 encontrado na pasta atual."
  exit 1
fi

echo ""
printf "${CYAN}Compressor de mp3 %s${RESET}\n" "$AGL"
echo ""
echo -e "Bitrate: ${YELLOW}$BITRATE${RESET}  |  Arquivos: ${YELLOW}$total${RESET}  |  Saída: ${YELLOW}$OUTPUT_DIR/${RESET}"
echo ""

current=0
total_original=0
total_compressed=0

for f in "$INPUT_DIR"/*.mp3; do
  [ -f "$f" ] || continue
  filename=$(basename "$f")
  output="$OUTPUT_DIR/$filename"
  current=$(( current + 1 ))

  printf "  ${CYAN}%-30s${RESET}\n" "$filename"

  ffmpeg -i "$f" -b:a "$BITRATE" -map_metadata 0 -id3v2_version 3 -y "$output" -loglevel error &
  ffmpeg_pid=$!
  spinner "$ffmpeg_pid"
  wait "$ffmpeg_pid"

  orig=$(du -k "$f" | cut -f1)
  comp=$(du -k "$output" | cut -f1)
  total_original=$(( total_original + orig ))
  total_compressed=$(( total_compressed + comp ))
  orig_h=$(du -sh "$f" | cut -f1)
  comp_h=$(du -sh "$output" | cut -f1)
  saved=$(( 100 - comp * 100 / orig ))

  printf "\r  ${GREEN}✓${RESET} %-28s ${YELLOW}%s → %s${RESET} (-%d%%)\n" "$filename" "$orig_h" "$comp_h" "$saved"

  progress_bar "$current" "$total"
  echo ""
done

echo ""

total_saved=$(( 100 - total_compressed * 100 / total_original ))
orig_total_h=$(( total_original / 1024 ))
comp_total_h=$(( total_compressed / 1024 ))

echo -e "${CYAN}─────────────────────────────────────────${RESET}"
echo -e "  Total original:    ${YELLOW}${orig_total_h} MB${RESET}"
echo -e "  Total comprimido:  ${GREEN}${comp_total_h} MB${RESET}"
echo -e "  Economia total:    ${GREEN}-${total_saved}%${RESET}"
echo -e "${CYAN}─────────────────────────────────────────${RESET}"
echo -e "  Arquivos salvos em: ${YELLOW}$OUTPUT_DIR/${RESET}"
echo ""