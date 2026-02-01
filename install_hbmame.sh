#!/bin/bash
set -e

echo "==> Criando diretórios..."
mkdir -p /userdata/system/configs/retroarch/cores
mkdir -p /usr/lib/libretro
mkdir -p /usr/share/libretro/info
mkdir -p /userdata/roms/hbmame

echo "==> Baixando core hbmame_libretro.so..."
wget -q --show-progress -O /userdata/system/configs/retroarch/cores/hbmame_libretro.so \
https://github.com/JeversonDiasSilva/fbalpha2012/releases/download/V1.1/hbmame_libretro.so
chmod +x /userdata/system/configs/retroarch/cores/hbmame_libretro.so

echo "==> Criando link simbólico em /usr/lib/libretro..."
ln -sf /userdata/system/configs/retroarch/cores/hbmame_libretro.so \
/usr/lib/libretro/hbmame_libretro.so

echo "==> Baixando arquivo .info..."
wget -q --show-progress -O /usr/share/libretro/info/hbmame_libretro.info \
https://github.com/JeversonDiasSilva/fbalpha2012/releases/download/V1.1/hbmame_libretro.info

echo "==> Salvando overlay do Batocera..."
batocera-save-overlay 250

echo "==> Instalação concluída com sucesso!"
