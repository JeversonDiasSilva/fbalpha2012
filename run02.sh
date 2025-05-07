#!/bin/bash
# Curitiba 06 de Maio de 2025
# Editor: Jeverson Dias da Silva

ROXO="\033[1;35m"
VERDE="\033[1;92m"
AZUL="\033[1;34m"
AMARELO="\033[1;33m"
RESET="\033[0m"
BOLD="\033[1m"
UNDERLINE="\033[4m"

echo -e "${ROXO}${BOLD}╔══════════════════════════════════════════════════════════╗${RESET}"
echo -e "${ROXO}${BOLD}  INSTALAÇÃO DO SISTEMA FINAL BURN ALPHA 2012 PARA BATOCERA  ${RESET}"
echo -e "${ROXO}${BOLD}  V40 E V41 - JEVERTON DIAS DA SILVA - 06 DE MAIO DE 2025  ${RESET}"
echo -e "${ROXO}${BOLD}╚══════════════════════════════════════════════════════════╝${RESET}"
sleep 2

echo -e "${AMARELO}Iniciando o processo de instalação...${RESET}"
echo -e "${AZUL}Preparando o ambiente...${RESET}"
sleep 2

# Verificando e criando diretório fbalpha, se necessário
cd /userdata/roms || { echo -e "${VERDE}Erro ao acessar o diretório /userdata/roms${RESET}"; exit 1; }
mkdir -p fbalpha || { echo -e "${VERDE}Erro ao criar o diretório fbalpha${RESET}"; exit 1; }

echo -e "${AMARELO}Baixando pacotes...${RESET}"
wget https://github.com/JeversonDiasSilva/fbalpha2012/releases/download/V1.1/FBAH -O FBAH > /dev/null 2>&1 || { echo -e "${VERDE}Erro ao baixar pacotes. Tente novamente mais tarde.${RESET}"; exit 1; }
sleep 2

echo -e "${AZUL}Instalando pacotes...${RESET}"
unsquashfs -d fba_libretro FBAH > /dev/null 2>&1 || { echo -e "${VERDE}Erro ao extrair pacotes. Tente novamente.${RESET}"; exit 1; }
sleep 2

echo -e "${AMARELO}Preparando os arquivos para o Batocera...${RESET}"
sleep 1

# Verificando se o diretório 'dep' existe
if [ -d "/userdata/roms/fba_libretro/dep" ]; then
    echo -e "${ROXO}✔️  Diretório /userdata/roms/fba_libretro/dep encontrado! Iniciando a cópia dos arquivos...${RESET}"

    # Movendo os arquivos para os destinos corretos
    if [ -f "/userdata/roms/fba_libretro/dep/es_systems_fba_libretro.cfg" ]; then
        mv /userdata/roms/fba_libretro/dep/es_systems_fba_libretro.cfg /userdata/system/configs/emulationstation > /dev/null 2>&1 || { echo -e "${VERDE}Erro ao mover o arquivo de configuração${RESET}"; exit 1; }
        chattr +i "/userdata/system/configs/emulationstation/es_systems_fba_libretro.cfg" > /dev/null 2>&1 || { echo -e "${VERDE}Erro ao proteger o arquivo de configuração${RESET}"; exit 1; }
        echo -e "${AZUL}✔️  Arquivo de configuração 'es_systems_fba_libretro.cfg' movido com sucesso!${RESET}"
    else
        echo -e "${VERDE}⚠️  Arquivo 'es_systems_fba_libretro.cfg' não encontrado!${RESET}"
        exit 1
    fi

    if [ -f "/userdata/roms/fba_libretro/dep/fbalpha2012_libretro.so" ]; then
        mv /userdata/roms/fba_libretro/dep/fbalpha2012_libretro.so /userdata/system/configs/retroarch/cores > /dev/null 2>&1 || { echo -e "${VERDE}Erro ao mover o core${RESET}"; exit 1; }
        ln -sf /userdata/system/configs/retroarch/cores/fbalpha2012_libretro.so /usr/lib/libretro/fbalpha2012_libretro.so > /dev/null 2>&1 || { echo -e "${VERDE}Erro ao criar o link simbólico${RESET}"; exit 1; }
        echo -e "${AZUL}✔️  Core 'fbalpha2012_libretro.so' movido e link simbólico criado com sucesso!${RESET}"
    else
        echo -e "${VERDE}⚠️  Core 'fbalpha2012_libretro.so' não encontrado!${RESET}"
        exit 1
    fi
else
    echo -e "${VERDE}⚠️  Diretório '/userdata/roms/fba_libretro/dep' não encontrado!${RESET}"
    exit 1
fi

sleep 2

echo -e "${AMARELO}Removendo arquivos temporários...${RESET}"
rm -f FBAH > /dev/null 2>&1 || { echo -e "${VERDE}Erro ao remover o arquivo temporário FBAH${RESET}"; exit 1; }
sleep 2

echo -e "${AMARELO}Salvando as configurações de overlay...${RESET}"
batocera-save-overlay > /dev/null 2>&1 || { echo -e "${VERDE}Erro ao salvar overlay. Tente novamente.${RESET}"; exit 1; }
sleep 2

echo -e "${ROXO}${BOLD}╔══════════════════════════════════════════════════════════╗${RESET}"
echo -e "${ROXO}${BOLD}  INSTALAÇÃO CONCLUÍDA COM SUCESSO!                          ${RESET}"
echo -e "${ROXO}${BOLD}╚══════════════════════════════════════════════════════════╝${RESET}"

# Exibindo WhatsApp com destaque
echo -e "${AMARELO}${BOLD}🔔 Para mais informações ou suporte, entre em contato pelo WhatsApp: ${RESET}${VERDE}${BOLD}(41) 99820-5080${RESET}"

# Exibindo @JCGAMESCLASSICOS com destaque
echo -e "${AMARELO}${BOLD}🚀 Siga-nos no Instagram para mais novidades: ${RESET}${VERDE}${BOLD}@JCGAMESCLASSICOS${RESET}"

# Finalizando
cd || exit 1
