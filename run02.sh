#!/bin/bash
# Curitiba 06 de Maio de 2025
# Editor: Jeverson Dias da Silva

ROXO="\033[1;35m"
VERDE="\033[1;92m"
RESET="\033[0m"

echo -e "${ROXO}INSTALAÇÃO DO SISTEMA FINAL BURN ALPHA 2012 PARA BATOCERA V40 E V41...${RESET}"
echo -e "${ROXO}INICIANDO A INSTALAÇÃO...${RESET}"
sleep 3

# Verificando e criando diretório fbalpha, se necessário
cd /userdata/roms || { echo "Erro ao acessar /userdata/roms"; exit 1; }
mkdir -p fbalpha || { echo "Erro ao criar diretório fbalpha"; exit 1; }

echo -e "${ROXO}BAIXANDO PACOTES...${RESET}"
wget https://github.com/JeversonDiasSilva/fbalpha2012/releases/download/V1.1/FBAH -O FBAH || { echo "Erro ao baixar pacotes"; exit 1; }
sleep 3

echo -e "${ROXO}INSTALANDO OS PACOTES...${RESET}"
unsquashfs -d fba_libretro FBAH || { echo "Erro ao extrair pacotes"; exit 1; }
sleep 3

echo -e "${ROXO}FINALIZANDO INSTALAÇÃO...${RESET}"
# Verificando se o arquivo de configuração existe antes de movê-lo
if [ -f "/userdata/roms/fbalpha/dep/es_systems_fba_libretro.cfg" ]; then
    mv "/userdata/roms/fbalpha/dep/es_systems_fba_libretro.cfg" /userdata/system/configs/emulationstation || { echo "Erro ao mover o arquivo de configuração"; exit 1; }
    chattr +i "/userdata/system/configs/emulationstation/es_systems_fba_libretro.cfg" || { echo "Erro ao bloquear arquivo de configuração"; exit 1; }
else
    echo "Arquivo es_systems_fba_libretro.cfg não encontrado!"
    exit 1
fi

# Verificando e movendo o arquivo do core
if [ -f "/userdata/roms/fbalpha/dep/fbalpha2012_libretro.so" ]; then
    mv /userdata/roms/fbalpha/dep/fbalpha2012_libretro.so /userdata/system/configs/retroarch/cores || { echo "Erro ao mover o core"; exit 1; }
    ln -sf /userdata/system/configs/retroarch/cores/fbalpha2012_libretro.so /usr/lib/libretro/fbalpha2012_libretro.so || { echo "Erro ao criar link simbólico para o core"; exit 1; }
else
    echo "Core fbalpha2012_libretro.so não encontrado!"
    exit 1
fi

sleep 3

echo -e "${ROXO}LIMPANDO ARQUIVOS TEMPORÁRIOS...${RESET}"
rm -f FBAH || { echo "Erro ao remover o arquivo temporário FBAH"; exit 1; }
sleep 3

echo -e "${ROXO}SALVANDO OVERLAY...${RESET}"
batocera-save-overlay || { echo "Erro ao salvar overlay"; exit 1; }
sleep 3

echo -e "${ROXO}INSTALAÇÃO CONCLUÍDA COM SUCESSO!${RESET}"
sleep 2

echo -e "${VERDE}@JCGAMESCLASSICOS${RESET}"

# Finalizando
cd || exit 1
