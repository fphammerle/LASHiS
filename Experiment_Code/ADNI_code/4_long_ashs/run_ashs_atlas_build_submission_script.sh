#!/bin/bash
for subjName in `cat /data/fasttemp/uqtshaw/tomcat/data/subjnames.csv` ; do 
	 sbatch --export=SUBJNAME=$subjName /data/fasttemp/uqtshaw/tomcat/data/4_long_ashs/run_ashs_atlas_build_pbs_script.sh
done