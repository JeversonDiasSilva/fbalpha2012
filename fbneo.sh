#!/bin/bash
# Curitiba 06 de Maio de 2025
# Editor: Jeverson Dias da Silva

# Estilização das saídas no terminal 
clear
echo ""
echo ""
echo ""
echo ""
ROXO="\033[1;35m"
VERDE="\033[1;92m"
AZUL="\033[1;34m"
AMARELO="\033[1;33m"
RESET="\033[0m"
BOLD="\033[1m"
UNDERLINE="\033[4m"

echo -e "${ROXO}${BOLD}╔══════════════════════════════════════════════════════════╗${RESET}"
echo -e "${ROXO}${BOLD}  INSTALAÇÃO DO SISTEMA ${RESET} ${VERDE}${BOLD}FINAL BURN NEO PARA BATOCERA  ${RESET}"
echo -e "${ROXO}${BOLD}  V40 E V41 - JEVERTON DIAS DA SILVA - 06 DE MAIO DE 2025  ${RESET}"
echo -e "${ROXO}${BOLD}╚══════════════════════════════════════════════════════════╝${RESET}"
sleep 2

echo -e "${AMARELO}Iniciando o processo de instalação...${RESET}"
echo -e "${AZUL}Preparando o ambiente...${RESET}"
sleep 2

wget https://github.com/JeversonDiasSilva/fbalpha2012/releases/download/V1.1/FBNEO > /dev/null 2>&1
# Baixar roms para teste para as 3 versões do core
unsquashfs -d /userdata/system/configs/retroarch/cores FBNEO > /dev/null 2>&1
mv /userdata/system/configs/retroarch/cores/fbneo_old_libretro.info /usr/share/libretro/info

if [ -f /userdata/system/configs/emulationstation/es_systems.cfg ]; then
    sed -i '/<core default="true">fbneo<\/core>/a\                    <core>fbneo_old</core>' /userdata/system/configs/emulationstation/es_systems.cfg
fi
if [ -f /userdata/system/.dev/dependencias.zip ]; then
    sed -i '/<core default="true">fbneo<\/core>/a\                    <core>fbneo_old</core>' /userdata/system/.dev/dependencias.zip
fi
if [ -f /usr/share/emulationstation/es_systems.cfg ]; then
     wget -O /usr/share/emulationstation/es_systems.cfg \
https://github.com/JeversonDiasSilva/fbalpha2012/releases/download/V1.1/es_systems.cfg > /dev/null 2>&1
fi



rm FBNEO
rm /usr/lib/libretro/fbneo_libretro.so
ln -s /userdata/system/configs/retroarch/cores/fbneo_libretro.so /usr/lib/libretro/fbneo_libretro.so
ln -s /userdata/system/configs/retroarch/cores/fbneo_old_libretro.so /usr/lib/libretro/fbneo_old_libretro.so

echo -e "${AMARELO}Removendo arquivos temporários...${RESET}"
rm -f FBNEO > /dev/null 2>&1 || { echo -e "${VERDE}Erro ao remover o arquivo temporário FBAH${RESET}"; exit 1; }
sleep 2
batocera-save-overlay 250 > /dev/null 2>&1



# Exibindo WhatsApp com destaque
echo -e "${AMARELO}${BOLD}🔔 Para mais informações ou suporte, entre em contato pelo WhatsApp: ${RESET}${VERDE}${BOLD}(41) 99820-5080${RESET}"

# Exibindo @JCGAMESCLASSICOS com destaque
echo -e "${AMARELO}${BOLD}🚀 Siga-nos no Youtuba para mais novidades: ${RESET}${VERDE}${BOLD}@JCGAMESCLASSICOS${RESET}"


echo -e "${ROXO}${BOLD}╔══════════════════════════════════════════════════════════╗${RESET}"
echo -e "${VERDE}${BOLD}  INSTALAÇÃO CONCLUÍDA COM SUCESSO!                          ${RESET}"
echo -e "${ROXO}${BOLD}╚══════════════════════════════════════════════════════════╝${RESET}"
