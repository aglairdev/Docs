# [![LIMPA](https://img.shields.io/badge/LIMPA-E25252?style=for-the-badge)](https://github.com/aglairdev/Docs/tree/main/scripts/limpa)

## Que isso?

Automatiza a limpeza de caches, logs e pacotes desnecessários pra recuperar espaço na partição raiz.

![Shell](https://img.shields.io/badge/Shell-121011?style=flat-square&logo=gnu-bash&logoColor=white)

Detalhando:

- Detecta a distro (Arch ou Debian)
- **Arch**: mantém as 2 últimas versões do cache (`paccache`), remove cache de pacotes desinstalados, identifica órfãos e pergunta antes de remover
- **Debian**: roda `autoremove`, `autoclean` e `clean` do APT
- Reduz os logs do `journalctl` pros últimos 7 dias
- Limpa resíduos de Flatpak e Snap, se estiverem instalados
- Limpa lixeira e cache de thumbnails
- Mantém o `sudo` ativo durante toda a execução (sem pedir senha de novo no meio do processo)
- Mostra o total de espaço recuperado no final

> [!NOTE]
> Pra órfãos no Arch, o script pergunta antes de remover (timeout de 30s, padrão é não remover).

## Compatibilidade
- **Arch Linux** (e derivados com `pacman`)
- **Debian** (e derivados com `apt`)

## Uso

```bash
./limpa.sh
```
<p align="center">ꕤ AGL</p>
