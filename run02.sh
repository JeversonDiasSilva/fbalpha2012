#!/bin/bash
# Curitiba 06 de Maio de 2025
# Editor: Jeverson Dias da Silva 

ROXO="\033[1;35m"
VERDE="\033[1;92m"
RESET="\033[0m"

echo -e "${ROXO}INSTALAÇÃO DO SISTEMA FINAL BURN ALPHA 2012 PARA BATOCERA V40 E V41...${RESET}"
echo -e "${ROXO}INICIANDO A INSTALAÇÃO...${RESET}"
sleep 3

cd /userdata/roms > /dev/null 2>&1
mkdir -p fbalpha > /dev/null 2>&1

echo -e "${ROXO}BAIXANDO PACOTES...${RESET}"
wget https://github.com/JeversonDiasSilva/fbalpha2012/releases/download/V1.1/FBAH > /dev/null 2>&1
sleep 3

echo -e "${ROXO}INSTALANDO OS PACOTES...${RESET}"
unsquashfs -d fba_libretro FBAH > /dev/null 2>&1
sleep 3

echo -e "${ROXO}FINALIZANDO INSTALAÇÃO...${RESET}"
mv "/userdata/roms/fbalpha/dep/es_systems_fba_libretro.cfg" /userdata/system/configs/emulationstation > /dev/null 2>&1
chattr +i "/userdata/system/configs/emulationstation/es_systems_fba_libretro.cfg"
mv /userdata/roms/fbalpha/dep/fbalpha2012_libretro.so /userdata/system/configs/retroarch/cores > /dev/null 2>&1
ln -sf /userdata/system/configs/retroarch/cores/fbalpha2012_libretro.so /usr/lib/libretro/fbalpha2012_libretro.so > /dev/null 2>&1
sleep 3

echo -e "${ROXO}LIMPANDO ARQUIVOS TEMPORÁRIOS...${RESET}"
rm FBAH> /dev/null 2>&1
sleep 3

echo -e "${ROXO}SALVANDO OVERLAY...${RESET}"
batocera-save-overlay > /dev/null 2>&1
sleep 3

echo -e "${ROXO}INSTALAÇÃO CONCLUÍDA COM SUCESSO!${RESET}"
sleep 2

echo -e "${VERDE}@JCGAMESCLASSICOS${RESET}"
