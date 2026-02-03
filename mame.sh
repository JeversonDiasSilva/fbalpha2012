#!/bin/bash
# Curitiba 02 de Fevereiro de 2026.
# Editor: Jeverson D. Silva   ///@JCGAMESCLASSICOS...

echo "INSTALANDO CORES EXTRA DO SISTEMA MAME"


wget -q -O /tmp/mame-cores https://github.com/JeversonDiasSilva/fbalpha2012/releases/download/V1.1/mame-cores
unsquashfs -d /userdata/system/configs/retroarch/cores /tmp/mame-cores > /dev/null 2>&1
ln -s /userdata/system/configs/retroarch/cores/* /usr/lib/libretro
rm -f /tmp/mame-cores
wget -q -O /tmp/mame-cores-info https://github.com/JeversonDiasSilva/fbalpha2012/releases/download/V1.1/mame-cores-info
unsquashfs -d /usr/share/libretro/info /tmp/mame-cores-info > /dev/null 2>&1
rm -f /tmp/mame-cores-info
wget -q -O /userdata/system/configs/emulationstation/es_systems_mame.cfg https://github.com/JeversonDiasSilva/fbalpha2012/releases/download/V1.1/es_systems_mame.cfg

batocera-save-overlay 250

echo "BOM DIVERTIMENTO!"