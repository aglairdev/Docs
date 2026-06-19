# Nvidia 580xx ꕤ
Driver legado para GPUs NVIDIA Maxwell e Pascal no Arch Linux.
## Compatível com
- **Maxwell**: GTX 950, 960, 970, 980, 980 Ti, 750, 750 Ti
- **Pascal**: GTX 1050, 1060, 1070, 1080, 1080 Ti
- **Mobile**: GTX 950M, 960M, 970M, 980M, 1050M, 1060M, 1070M
## O que faz
- Detecta a GPU NVIDIA e aborta se não encontrar nenhuma
- Instala o `paru` automaticamente se não estiver presente
- Ativa o repositório `multilib` se necessário
- Remove drivers conflitantes apenas se existirem
- Instala `nvidia-580xx-dkms`, `nvidia-580xx-utils`, `nvidia-580xx-settings` e `lib32-nvidia-580xx-utils`
- Aplica blacklist do nouveau e recria o initramfs
```bash
curl -fsSL nvidia580.pages.dev/install | bash
```
Após o reboot, verifique com `nvidia-smi`.