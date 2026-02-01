#!/bin/bash

BLUE_BOLD="\e[1;34m"
GREEN_BOLD="\e[1;32m"
RESET="\e[0m"

# Mensagem inicial
echo -e "${GREEN_BOLD}INSTALANDO SISTEMA HBMAME${RESET}"
echo -e "${BLUE_BOLD}HBMAME por AlexxandreFS${RESET}"
echo -e "${BLUE_BOLD}Batocera.PLUS${RESET}"
echo -e "${BLUE_BOLD}https://github.com/AlexxandreFS/Batocera.PLUS${RESET}"

# Criar diretórios
mkdir -p /userdata/system/configs/retroarch/cores        > /dev/null 2>&1
mkdir -p /usr/lib/libretro                                > /dev/null 2>&1
mkdir -p /usr/share/libretro/info                         > /dev/null 2>&1
mkdir -p /userdata/roms/hbmame                            > /dev/null 2>&1

# Baixar core HBMAME
wget -q -O /userdata/system/configs/retroarch/cores/hbmame_libretro.so \
https://github.com/JeversonDiasSilva/fbalpha2012/releases/download/V1.1/hbmame_libretro.so \
> /dev/null 2>&1

chmod +x /userdata/system/configs/retroarch/cores/hbmame_libretro.so > /dev/null 2>&1

# Criar link simbólico
ln -sf /userdata/system/configs/retroarch/cores/hbmame_libretro.so \
/usr/lib/libretro/hbmame_libretro.so \
> /dev/null 2>&1

# Baixar arquivo .info
wget -q -O /usr/share/libretro/info/hbmame_libretro.info \
https://github.com/JeversonDiasSilva/fbalpha2012/releases/download/V1.1/hbmame_libretro.info \
> /dev/null 2>&1

# Baixar es_systems do HBMAME
wget -q -O /usr/share/emulationstation/es_systems_hbmame.cfg \
https://github.com/JeversonDiasSilva/fbalpha2012/releases/download/V1.1/es_systems_hbmame.cfg \
> /dev/null 2>&1

# Baixar hbmame_clone na pasta de ROMs e dar permissão
wget -q -O /userdata/roms/hbmame/hbmame_clone \
https://github.com/JeversonDiasSilva/fbalpha2012/releases/download/V1.1/hbmame_clone \
> /dev/null 2>&1

chmod +x /userdata/roms/hbmame/hbmame_clone > /dev/null 2>&1

# Baixar ROMs squash em /tmp
wget -q -O /tmp/roms-hbmame.squashfs \
https://github.com/JeversonDiasSilva/fbalpha2012/releases/download/V1.1/roms-hbmame \
> /dev/null 2>&1

# Extrair para a pasta de ROMs sem exibir saída
if [ -f /tmp/roms-hbmame.squashfs ]; then
    unsquashfs -f -d /userdata/roms/hbmame /tmp/roms-hbmame.squashfs > /dev/null 2>&1
    rm -f /tmp/roms-hbmame.squashfs > /dev/null 2>&1
fi

# Salvar overlay
batocera-save-overlay 250 > /dev/null 2>&1

# Mensagem final
echo -e "${GREEN_BOLD}HBMAME INSTALADO COM SUCESSO!${RESET}"
