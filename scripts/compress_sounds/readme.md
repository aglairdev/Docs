# [![COMPRESS__SOUNDS](https://img.shields.io/badge/COMPRESS__SOUNDS-E25252?style=for-the-badge)](https://github.com/aglairdev/Docs/tree/main/scripts/compress_sounds)

## Que isso?

Compressor de `.mp3` interativo, com opção de reduzir bitrate, cortar duração, ou os dois juntos.

![Shell](https://img.shields.io/badge/Shell-121011?style=flat-square&logo=gnu-bash&logoColor=white)

E os detalhes?

- Detecta todos os `.mp3` na pasta atual e aborta se não achar nenhum
- Pergunta se você quer otimizar bitrate, reduzir duração, ou ambos
- Pula arquivos que já estão com bitrate igual ou menor que o alvo (64k)
- Mostra progresso com spinner e barra por arquivo
- Preserva metadata (ID3v2) nos arquivos comprimidos
- Salva tudo em `compressed/`, sem alterar os originais
- Exibe resumo final com tamanho total antes/depois e economia em %

> [!TIP]
> Rode dentro da pasta com os mp3s ~ o script só olha o diretório atual (`-maxdepth 1`), não desce em subpastas.

## Demo

<img width="482" height="831" alt="demo" src="https://github.com/user-attachments/assets/b6dd7534-fe9e-43b2-a5ed-61d3d1100d3f" />

## Requisitos
- `ffmpeg` instalado (inclui `ffprobe`)

## Uso

```bash
./compress.sh
```

Escolha uma opção no menu interativo:

- **1** ~ Otimizar bitrate (mantém duração)
- **2** ~ Reduzir duração (corta cada arquivo em N minutos)
- **3** ~ Ambos

<p align="center">ꕤ AGL</p>
