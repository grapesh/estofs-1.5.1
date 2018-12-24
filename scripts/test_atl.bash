#!/bin/bash

## Load Python 2.7.13
#module use /usrx/local/dev/modulefiles
#module load python/2.7.13

export pyPath="/usrx/local/dev/python/2.7.13/bin"
export platform=""

export myModules=${platform}"/gpfs/hps3/nos/noscrub/nwprod/csdlpy-1.5.1"
export pythonCode=${platform}"/gpfs/hps3/nos/noscrub/nwprod/estofs-1.5.1/estofs/post.py"
export logFile=${platform}"/gpfs/hps3/nos/noscrub/polar/estofs_atl/estofs_post.log"

export ofsDir=${platform}"/gpfs/hps/nco/ops/com/estofs/prod/"
export basin="atl"
export stormCycle="latest"   #"2018030218"
#export stormCycle="2018081200"

export outputDir=${platform}"/gpfs/hps3/nos/noscrub/polar/estofs_atl/"
export tmpDir=${platform}"/gpfs/hps3/nos/noscrub/tmp/estofs_atl/"
export pltCfgFile=${platform}"/gpfs/hps3/nos/noscrub/nwprod/estofs-1.5.1/scripts/config.plot.estofs.atl.ini"

export ftpLogin="svinogradov@emcrzdm"
export ftpPath="/home/www/polar/estofs/atl/"
#export ftpPath="/home/www/polar/estofs/atl_"${stormCycle}

cd ${tmpDir}
PYTHONPATH=${myModules} ${pyPath}/python -W ignore ${pythonCode} -i ${ofsDir} -s ${basin} -z ${stormCycle} -o ${outputDir} -t ${tmpDir} -p ${pltCfgFile} -u ${ftpLogin} -f ${ftpPath} > ${logFile}
