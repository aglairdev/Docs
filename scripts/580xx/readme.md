# [![580xx](https://img.shields.io/badge/580xx-E25252?style=for-the-badge)](https://github.com/aglairdev/Docs/tree/main/scripts/580xx)

## Que isso?

Driver legado para GPUs NVIDIA Maxwell e Pascal no **Arch Linux**.

![Shell](https://img.shields.io/badge/Shell-121011?style=flat-square&logo=gnu-bash&logoColor=white)

Ah, você quer mais detalhes?

- Detecta a GPU NVIDIA e aborta se não encontrar nenhuma
- Instala o `paru` se não estiver presente
- Ativa o repositório `multilib` se necessário
- Remove drivers conflitantes apenas se existirem
- Instala `nvidia-580xx-dkms`, `nvidia-580xx-utils`, `nvidia-580xx-settings` e `lib32-nvidia-580xx-utils` 
- Aplica blacklist do nouveau e recria o initramfs

> [!WARNING]
> Testado apenas em GTX 950. O script mexe com driver de kernel, blacklist de módulo e initramfs. Se preferir mais controle, segue os passos manuais da [referência](https://dev.to/hopsayer/nvidia-drops-gtx-9001000-support-in-590-driver-how-to-fix-on-arch-linux-1175). Rodando o script, é por sua conta e risco.

## Compatibilidade
- **Maxwell**: GTX 950, 960, 970, 980, 980 Ti, 750, 750 Ti
- **Pascal**: GTX 1050, 1060, 1070, 1080, 1080 Ti
- **Mobile**: GTX 950M, 960M, 970M, 980M, 1050M, 1060M, 1070M

## Uso

```bash
curl -fsSL nvidia580.pages.dev/install | bash
```

Após o reboot, verifica com `nvidia-smi`.

<p align="center">ꕤ AGL</p>
