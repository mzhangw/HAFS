#! /usr/bin/env bash
set -eux

source ./machine-setup.sh > /dev/null 2>&1
cwd=`pwd`

USE_PREINST_LIBS=${USE_PREINST_LIBS:-"true"}
if [ $USE_PREINST_LIBS = true ]; then
  export MOD_PATH=/scratch3/NCEPDEV/nwprod/lib/modulefiles
else
  export MOD_PATH=${cwd}/lib/modulefiles
fi

# Check final exec folder exists
if [ ! -d "../exec" ]; then
  mkdir ../exec
fi

if [ $target = hera ]; then target=hera.intel ; fi
if [ $target = theia ]; then target=theia.intel ; fi
if [ $target = jet ]; then target=jet.intel ; fi

cd hafs_forecast.fd/
FV3=$( pwd -P )/FV3
cd tests/
#./compile.sh "$FV3" "$target" "CCPP=Y STATIC=Y SUITES=HAFS_v0_gfdlmp_nocp,HAFS_v0_gfdlmp 32BIT=Y" 32bit YES NO
#mz: add HWRF suite:HAFS_v0_hwrf
./compile.sh "$FV3" "$target" "CCPP=Y STATIC=Y SUITES=HAFS_v0_gfdlmp,HAFS_v0_gfdlmp_nogwdps,HAFS_v0_hwrf,HAFS_v0_hwrf_nogwdps 32BIT=Y " 32bit YES NO
#./compile.sh "$FV3" "$target" "CCPP=Y REPRO=Y 32BIT=Y" 32bit YES NO
#./compile.sh "$FV3" "$target" "CCPP=Y 32BIT=Y" 32bit YES NO
#cp -p fv3_32bit.exe ../NEMS/exe/
#cp -p fv3_32bit.exe ../../../exec/hafs_forecast.exe
