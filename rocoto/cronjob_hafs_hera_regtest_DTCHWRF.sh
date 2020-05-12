#!/bin/sh
set -x
date

#zhang
#ROCOTOhafs=/scratch1/NCEPDEV/hwrf/save/${USER}/hafs_20191207/rocoto
ROCOTOhafs=/scratch1/BMC/gmtb/${USER}/_HAFS/HAFS/rocoto

cd ${ROCOTOhafs}
EXPT=$(basename $(dirname ${ROCOTOhafs}))
#dev="-f"
dev="-s sites/hera.ent -f"
scrubopt="config.scrub_work=no config.scrub_com=no"

#./run_hafs.py -t ${dev} 2019091600 09L HISTORY \
#    config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_rt_regional_static \
#    config.NHRS=12 \
#    ${scrubopt} \
#    ../parm/hafs_regional_static.conf

#zhang
#./run_hafs.py -t ${dev} 2019091600 09L HISTORY \
#    config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_rt_globnest_static \
#    config.NHRS=126 \
#    ${scrubopt} \
#    ../parm/hafs_globnest_static_DTCHWRF.conf

# ./run_hafs.py -t ${dev} 2019091600 09L HISTORY \
#     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_rt_regional \
#     config.NHRS=12 \
#     ${scrubopt}

# ./run_hafs.py -t ${dev} 2019091600 09L HISTORY \
#     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_rt_globnest \
#     config.NHRS=12 \
#     ${scrubopt} \
#     ../parm/hafs_globnest.conf

#./run_hafs.py -t ${dev} 2019091600 09L HISTORY \
#    config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_rt_regional_static_grib2ab_lbc \
#    config.ictype=gfsnemsio config.bctype=gfsgrib2ab_0p25 \
#    config.NHRS=12 \
#    ${scrubopt} \
#    ../parm/hafs_regional_static.conf

#./run_hafs.py -t ${dev} 2019091600 09L HISTORY \
#Dorian
#./run_hafs.py -t ${dev} 2019090118 05L HISTORY \
#Lorenzo
#./run_hafs.py -t ${dev} 2019092806 13L HISTORY \
#./run_hafs.py -t ${dev} 2019091600 09L HISTORY \
#./run_hafs.py -t ${dev} 2019090118 05L HISTORY \
./run_hafs.py -t ${dev} 2019092806 13L HISTORY \
    config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_rt_regional_static_grib2_lbc \
    config.ictype=gfsnemsio config.bctype=gfsgrib2_0p25 \
    config.NHRS=126 \
    ${scrubopt} \
    ../parm/hafs_regional_static_DTCHWRF.conf

# ./run_hafs.py -t ${dev} 2019091600 09L HISTORY \
#     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_rt_regional_grib2ab_lbc \
#     config.ictype=gfsnemsio config.bctype=gfsgrib2ab_0p25 \
#     config.NHRS=12 \
#     ${scrubopt}

# ./run_hafs.py -t ${dev} 2019091600 09L HISTORY \
#     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_rt_regional_grib2_lbc \
#     config.ictype=gfsnemsio config.bctype=gfsgrib2_0p25 \
#     config.NHRS=12 \
#     ${scrubopt}

date
echo 'cronjob done'
