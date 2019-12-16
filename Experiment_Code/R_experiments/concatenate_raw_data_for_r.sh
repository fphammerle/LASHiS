#!/bin/bash
#This script takes all ADNI data from the previous steps and formats it for the LME experiment
#FS Xs and Fs Long, LASHiS, Diet LASHis, and ASHS Xs
#Thomas Shaw 9/12/2019


#set the directory where the data now lives
base_dir=/30days/uqtshaw/ADNI_BIDS/derivatives
for subjName in `cat ${base_dir}/subjnames.csv ` ; do

# one liner from hell for ASHS results
#tr -s ' ' <input.csv | tr ' ' ',' | cut -c 2- | awk -F "\"*,\"*" '{print $7}' | awk '{for (i=1; i<=NF; i++) a[i,NR]=$i; max=(max<NF?NF:max)} END {for (i=1; i<=max; i++) {for (j=1; j<+NR; j++) printf "%s%s", a[ i,j], (j==NR?RS:FS) }}' > output.csv


for var in long_ashs_v1 long_ashs_JLF ; do
    for TP in 2TP_1-2 3TP ; do
       	mkdir ${base_dir}/4_long_ashs/results/${var}/cleaned/
	############
	##  ASHS  ##
	############
	cat ${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_right_lfseg_corr_usegray_warped_to_ses-01.csv>>${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-01.csv
	cat ${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_left_lfseg_corr_usegray_warped_to_ses-01.csv>>${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-01.csv
	echo -e ' 0 0 0 0 0 '`cat ${base_dir}/4_long_ashs/${subjName}_long_ashs_v1_${TP}/final/${subjName}_ashs_${TP}_SST_icv.txt`>>${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-01.csv
	echo -e ' 0 0 0 0 0 0 '"${subjName}_ses-01_${TP}_warped_to_ses-01">>${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-01.csv
	echo -e ' 0 0 0 0 0 0 0 0 0 ' >> ${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-01.csv
	tr -s ' ' <${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-01.csv | tr ' ' ',' | cut -c 2- | awk -F "\"*,\"*" '{print $7}' | awk '{for (i=1; i<=NF; i++) a[i,NR]=$i; max=(max<NF?NF:max)} END {for (i=1; i<=max; i++) {for (j=1; j<+NR; j++) printf "%s%s", a[ i,j], (j==NR?RS:FS) }}' > ${base_dir}/4_long_ashs/results/${var}/cleaned/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-01.csv
	echo `cat ${base_dir}/4_long_ashs/results/${var}/cleaned/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-01.csv` >> ${base_dir}/4_long_ashs/results/${var}/cleaned/ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-01.csv
    done
done
for var in long_ashs_v1 long_ashs_JLF ; do
    for TP in  2TP_1-2 2TP_2-3 3TP ; do
       	mkdir ${base_dir}/4_long_ashs/results/${var}/cleaned/
	cat ${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_right_lfseg_corr_usegray_warped_to_ses-02.csv>>${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-02.csv
	cat ${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_left_lfseg_corr_usegray_warped_to_ses-02.csv>>${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-02.csv
	echo -e ' 0 0 0 0 0 '`cat ${base_dir}/4_long_ashs/${subjName}_long_ashs_v1_${TP}/final/${subjName}_ashs_${TP}_SST_icv.txt`>>${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-02.csv
	echo -e ' 0 0 0 0 0 0 '"${subjName}_ses-02_${TP}_warped_to_ses-02">>${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-02.csv
	echo -e ' 0 0 0 0 0 0 0 0 0 ' >> ${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-02.csv
	tr -s ' ' <${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-02.csv | tr ' ' ',' | cut -c 2- | awk -F "\"*,\"*" '{print $7}' | awk '{for (i=1; i<=NF; i++) a[i,NR]=$i; max=(max<NF?NF:max)} END {for (i=1; i<=max; i++) {for (j=1; j<+NR; j++) printf "%s%s", a[ i,j], (j==NR?RS:FS) }}' > ${base_dir}/4_long_ashs/results/${var}/cleaned/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-02.csv
	echo `cat ${base_dir}/4_long_ashs/results/${var}/cleaned/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-02.csv` >> ${base_dir}/4_long_ashs/results/${var}/cleaned/ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-02.csv
    done
done
for var in long_ashs_v1 long_ashs_JLF ; do
    for TP in 2TP_2-3 3TP ; do
       	mkdir ${base_dir}/4_long_ashs/results/${var}/cleaned/
	cat ${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_right_lfseg_corr_usegray_warped_to_ses-03.csv>>${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-03.csv
	cat ${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_left_lfseg_corr_usegray_warped_to_ses-03.csv>>${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-03.csv
	echo -e ' 0 0 0 0 0 '`cat ${base_dir}/4_long_ashs/${subjName}_long_ashs_v1_${TP}/final/${subjName}_ashs_${TP}_SST_icv.txt`>>${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-03.csv
	echo -e ' 0 0 0 0 0 0 '"${subjName}_ses-03_${TP}_warped_to_ses-03">>${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-03.csv
	echo -e ' 0 0 0 0 0 0 0 0 0 ' >> ${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-03.csv
	tr -s ' ' <${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-03.csv | tr ' ' ',' | cut -c 2- | awk -F "\"*,\"*" '{print $7}' | awk '{for (i=1; i<=NF; i++) a[i,NR]=$i; max=(max<NF?NF:max)} END {for (i=1; i<=max; i++) {for (j=1; j<+NR; j++) printf "%s%s", a[ i,j], (j==NR?RS:FS) }}' > ${base_dir}/4_long_ashs/results/${var}/cleaned/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-03.csv
	echo `cat ${base_dir}/4_long_ashs/results/${var}/cleaned/${subjName}_ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-03.csv` >> ${base_dir}/4_long_ashs/results/${var}/cleaned/ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-03.csv
    done
done
done


<<EOF
#atlas based 3TP only
var=long_ashs_atlas 
TP=3TP
for ses in 01 02 03 ; do 
    mkdir ${base_dir}/4_long_ashs/results/${var}/cleaned
    cat ${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${ses}_SST_right_lfseg_corr_usegray_warped_to_ses-${ses}.csv>>${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${ses}_SST_combined_lfseg_corr_usegray_warped_to_ses-${ses}.csv
    cat ${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${ses}_SST_left_lfseg_corr_usegray_warped_to_ses-${ses}.csv>>${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${ses}_SST_combined_lfseg_corr_usegray_warped_to_ses-${ses}.csv
    
    echo -e ' 0 0 0 0 0 '`cat ${base_dir}/4_long_ashs/${subjName}_long_ashs_v1_${TP}/final/${subjName}_ashs_${TP}_SST_icv.txt`>>${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${ses}_SST_combined_lfseg_corr_usegray_warped_to_ses-${ses}.csv
    echo -e ' 0 0 0 0 0 0 '"${subjName}_ses-${ses}_${TP}_warped_to_ses-${ses}">>${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${ses}_SST_combined_lfseg_corr_usegray_warped_to_ses-${ses}.csv
    echo -e ' 0 0 0 0 0 0 0 0 0 ' >> ${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${ses}_SST_combined_lfseg_corr_usegray_warped_to_ses-${ses}.csv
    tr -s ' ' < ${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${ses}_SST_combined_lfseg_corr_usegray_warped_to_ses-${ses}.csv | tr ' ' ',' | cut -c 2- | awk -F "\"*,\"*" '{print $7}' | awk '{for (i=1; i<=NF; i++) a[i,NR]=$i; max=(max<NF?NF:max)} END {for (i=1; i<=max; i++) {for (j=1; j<+NR; j++) printf "%s%s", a[ i,j], (j==NR?RS:FS) }}' > ${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${ses}_SST_combined_lfseg_corr_usegray_warped_to_ses-${ses}.csv
    echo `cat ${base_dir}/4_long_ashs/results/${var}/${subjName}_ashs_${ses}_SST_combined_lfseg_corr_usegray_warped_to_ses-${ses}.csv` >> ${base_dir}/4_long_ashs/results/${var}/cleaned/ashs_${TP}_SST_combined_lfseg_corr_usegray_warped_to_ses-${ses}.csv
done

mkdir ${base_dir}/2_xs_ashs/cleaned
####ASHS XS#####
for ses in 01 02 03 ; do
    mkdir -p ${base_dir}/2_xs_ashs/results/cleaned
    cat ${base_dir}/2_xs_ashs/${subjName}_ses-${ses}_xs_ashs/final/${subjName}_ses-${ses}_xs_ashs_right_corr_usegray_volumes.txt>>${base_dir}/2_xs_ashs/${subjName}_ses-${ses}_xs_ashs/final/${subjName}_ses-${ses}_xs_ashs_combined_corr_usegray_volumes.csv
    cat ${base_dir}/2_xs_ashs/${subjName}_ses-${ses}_xs_ashs/final/${subjName}_ses-${ses}_xs_ashs_left_corr_usegray_volumes.txt>>${base_dir}/2_xs_ashs/${subjName}_ses-${ses}_xs_ashs/final/${subjName}_ses-${ses}_xs_ashs_combined_corr_usegray_volumes.csv
    echo -e ' 0 0 0 '`cat ${base_dir}/2_xs_ashs/${subjName}_ses-${ses}_xs_ashs/final/${subjName}_ses-${ses}_xs_ashs_icv.txt`>>${base_dir}/2_xs_ashs/${subjName}_ses-${ses}_xs_ashs/final/${subjName}_ses-${ses}_xs_ashs_combined_corr_usegray_volumes.csv
    echo -e ' 0 0 0 0 '"${subjName}_ses-${ses}_xs">>${base_dir}/2_xs_ashs/${subjName}_ses-${ses}_xs_ashs/final/${subjName}_ses-${ses}_xs_ashs_combined_corr_usegray_volumes.csv
    tr -s ' ' < ${base_dir}/2_xs_ashs/${subjName}_ses-${ses}_xs_ashs/final/${subjName}_ses-${ses}_xs_ashs_combined_corr_usegray_volumes.csv | tr ' ' ',' | cut -c 2- | awk -F "\"*,\"*" '{print $7}' | awk '{for (i=1; i<=NF; i++) a[i,NR]=$i; max=(max<NF?NF:max)} END {for (i=1; i<=max; i++) {for (j=1; j<+NR; j++) printf "%s%s", a[ i,j], (j==NR?RS:FS) }}' > ${base_dir}/2_xs_ashs/cleaned/${subjName}_ashs_ses-${ses}_SST_combined_lfseg_corr_usegray_warped_to_ses-${ses}.csv
    echo `cat ${base_dir}/2_xs_ashs/cleaned/${subjName}_ashs_ses-${ses}_SST_combined_lfseg_corr_usegray_warped_to_ses-${ses}.csv` >> ${base_dir}/2_xs_ashs/cleaned/ashs_ses-${ses}_SST_combined_lfseg_corr_usegray_warped_to_ses-${ses}.csv 
done


#freesurfer results.

for TP in 3TP 2TP_1-2 ; do
    mkdir -p ${base_dir}/freesurfer/results/cleaned/
    cat ${base_dir}/freesurfer/${subjName}_01_7T.long.${subjName}_${TP}/mri/rh.hippoSfVolumes-T1.long.v21.txt>>${base_dir}/freesurfer/results/${subjName}_01_7T.long.${subjName}_${TP}.csv
    cat ${base_dir}/freesurfer/${subjName}_01_7T.long.${subjName}_${TP}/mri/lh.hippoSfVolumes-T1.long.v21.txt>>${base_dir}/freesurfer/results/${subjName}_01_7T.long.${subjName}_${TP}.csv
    cat ${base_dir}/freesurfer/${subjName}_01_7T.long.${subjName}_${TP}/stats/aseg.stats | grep "Estimated Total Intracranial Volume" > ${base_dir}/freesurfer/results/${subjName}_01_7T.long.${subjName}_${TP}_icv.csv
    echo `cat ${base_dir}/freesurfer/results/${subjName}_01_7T.long.${subjName}_${TP}_icv.csv` >> ${base_dir}/freesurfer/results/${subjName}_01_7T.long.${subjName}_${TP}.csv
    sed 's/[^0-9.]*//g' ${base_dir}/freesurfer/results/${subjName}_01_7T.long.${subjName}_${TP}.csv >> ${base_dir}/freesurfer/results/${subjName}_01_7T.long.${subjName}_${TP}.csv
    echo ${subjName}_01_long_${TP} >> ${base_dir}/freesurfer/results/${subjName}_01_7T.long.${subjName}_${TP}1.csv
    echo 0 >> ${base_dir}/freesurfer/results/${subjName}_01_7T.long.${subjName}_${TP}1.csv
     cat  ${base_dir}/freesurfer/results/${subjName}_01_7T.long.${subjName}_${TP}1.csv | awk '{for (i=1; i<=NF; i++) a[i,NR]=$i; max=(max<NF?NF:max)} END {for (i=1; i<=max; i++) {for (j=1; j<+NR; j++) printf "%s%s", a[ i,j], (j==NR?RS:FS) }}' > ${base_dir}/freesurfer/results/${subjName}_01_7T.long.${subjName}_${TP}2.csv 
    echo `cat ${base_dir}/freesurfer/results/${subjName}_01_7T.long.${subjName}_${TP}2.csv` >> ${base_dir}/freesurfer/results/cleaned/FS_01_7T.long.${TP}_concat.csv 
done
for TP in 3TP 2TP_1-2 2TP_2-3 ; do
    mkdir -p ${base_dir}/freesurfer/results/cleaned/
    cat ${base_dir}/freesurfer/${subjName}_02_7T.long.${subjName}_${TP}/mri/rh.hippoSfVolumes-T1.long.v21.txt>>${base_dir}/freesurfer/results/${subjName}_02_7T.long.${subjName}_${TP}.csv
    cat ${base_dir}/freesurfer/${subjName}_02_7T.long.${subjName}_${TP}/mri/lh.hippoSfVolumes-T1.long.v21.txt>>${base_dir}/freesurfer/results/${subjName}_02_7T.long.${subjName}_${TP}.csv
    cat ${base_dir}/freesurfer/${subjName}_02_7T.long.${subjName}_${TP}/stats/aseg.stats | grep "Estimated Total Intracranial Volume" > ${base_dir}/freesurfer/results/${subjName}_02_7T.long.${subjName}_${TP}_icv.csv
    echo `cat ${base_dir}/freesurfer/results/${subjName}_02_7T.long.${subjName}_${TP}_icv.csv` >> ${base_dir}/freesurfer/results/${subjName}_02_7T.long.${subjName}_${TP}.csv
    sed 's/[^0-9.]*//g' ${base_dir}/freesurfer/results/${subjName}_02_7T.long.${subjName}_${TP}.csv >> ${base_dir}/freesurfer/results/${subjName}_02_7T.long.${subjName}_${TP}1.csv
    echo ${subjName}_02_long_${TP} >> ${base_dir}/freesurfer/results/${subjName}_02_7T.long.${subjName}_${TP}1.csv
    echo 0 >> ${base_dir}/freesurfer/results/${subjName}_02_7T.long.${subjName}_${TP}1.csv
    cat  ${base_dir}/freesurfer/results/${subjName}_02_7T.long.${subjName}_${TP}1.csv | awk '{for (i=1; i<=NF; i++) a[i,NR]=$i; max=(max<NF?NF:max)} END {for (i=1; i<=max; i++) {for (j=1; j<+NR; j++) printf "%s%s", a[ i,j], (j==NR?RS:FS) }}' > ${base_dir}/freesurfer/results/${subjName}_02_7T.long.${subjName}_${TP}2.csv 
    echo `cat ${base_dir}/freesurfer/results/${subjName}_02_7T.long.${subjName}_${TP}2.csv` >> ${base_dir}/freesurfer/results/cleaned/FS_02_7T.long.${TP}_concat.csv 
done
for TP in 3TP 2TP_2-3 ; do
    mkdir -p ${base_dir}/freesurfer/results/cleaned/
    cat ${base_dir}/freesurfer/${subjName}_03_7T.long.${subjName}_${TP}/mri/rh.hippoSfVolumes-T1.long.v21.txt>>${base_dir}/freesurfer/results/${subjName}_03_7T.long.${subjName}_${TP}.csv
    cat ${base_dir}/freesurfer/${subjName}_03_7T.long.${subjName}_${TP}/mri/lh.hippoSfVolumes-T1.long.v21.txt>>${base_dir}/freesurfer/results/${subjName}_03_7T.long.${subjName}_${TP}.csv
    cat ${base_dir}/freesurfer/${subjName}_03_7T.long.${subjName}_${TP}/stats/aseg.stats | grep "Estimated Total Intracranial Volume" > ${base_dir}/freesurfer/results/${subjName}_03_7T.long.${subjName}_${TP}_icv.csv
    echo `cat ${base_dir}/freesurfer/results/${subjName}_03_7T.long.${subjName}_${TP}_icv.csv`>> ${base_dir}/freesurfer/results/${subjName}_03_7T.long.${subjName}_${TP}.csv
    sed 's/[^0-9.]*//g' ${base_dir}/freesurfer/results/${subjName}_03_7T.long.${subjName}_${TP}.csv >> ${base_dir}/freesurfer/results/${subjName}_03_7T.long.${subjName}_${TP}1.csv
    echo ${subjName}_03_long_${TP} >> ${base_dir}/freesurfer/results/${subjName}_03_7T.long.${subjName}_${TP}1.csv
    echo 0 >> ${base_dir}/freesurfer/results/${subjName}_03_7T.long.${subjName}_${TP}1.csv
    cat  ${base_dir}/freesurfer/results/${subjName}_03_7T.long.${subjName}_${TP}1.csv | awk '{for (i=1; i<=NF; i++) a[i,NR]=$i; max=(max<NF?NF:max)} END {for (i=1; i<=max; i++) {for (j=1; j<+NR; j++) printf "%s%s", a[ i,j], (j==NR?RS:FS) }}' > ${base_dir}/freesurfer/results/${subjName}_03_7T.long.${subjName}_${TP}2.csv 
    echo `cat ${base_dir}/freesurfer/results/${subjName}_03_7T.long.${subjName}_${TP}2.csv` >> ${base_dir}/freesurfer/results/cleaned/FS_03_7T.long.${TP}_concat.csv 
done
#XS
for ses in 01_7T 02_7T 03_7T ; do
    cat ${base_dir}/freesurfer/${subjName}_${ses}/mri/lh.hippoSfVolumes-T2_Only.v21.txt>>${base_dir}/freesurfer/results/${subjName}_xs_${ses}.csv
    cat ${base_dir}/freesurfer/${subjName}_${ses}/mri/rh.hippoSfVolumes-T2_Only.v21.txt>>${base_dir}/freesurfer/results/${subjName}_xs_${ses}.csv
    cat ${base_dir}/freesurfer/${subjName}_${ses}/stats/aseg.stats | grep "Estimated Total Intracranial Volume" > ${base_dir}/freesurfer/results/${subjName}_xs_${ses}_icv.csv
    echo `cat ${base_dir}/freesurfer/results/${subjName}_xs_${ses}_icv.csv` >> ${base_dir}/freesurfer/results/${subjName}_xs_${ses}.csv
    sed 's/[^0-9.]*//g' ${base_dir}/freesurfer/results/${subjName}_xs_${ses}.csv >> ${base_dir}/freesurfer/results/${subjName}_xs_${ses}1.csv
    echo ${subjName}_xs_${ses}>>${base_dir}/freesurfer/results/${subjName}_xs_${ses}1.csv
    echo 0 >> ${base_dir}/freesurfer/results/${subjName}_xs_${ses}1.csv
    cat ${base_dir}/freesurfer/results/${subjName}_xs_${ses}1.csv | awk '{for (i=1; i<=NF; i++) a[i,NR]=$i; max=(max<NF?NF:max)} END {for (i=1; i<=max; i++) {for (j=1; j<+NR; j++) printf "%s%s", a[ i,j], (j==NR?RS:FS) }}' > ${base_dir}/freesurfer/results/${subjName}_xs_${ses}2.csv
    echo `cat ${base_dir}/freesurfer/results/${subjName}_xs_${ses}2.csv` >> ${base_dir}/freesurfer/results/cleaned/xs_${ses}_concat.csv
done
#you need to add 0s to the bottom of the fs ones
#then done
#yay
#also delete everything and re run
   #because the second tp for these wasnt workingfor subjName in sub-SF01 sub-JH09 ; do recon-all -subjid ${subjName}_02_7T -autorecon2 -autorecon3 -cm -openmp 16 -no-isrunning && segmentHA_T1.sh ${subjName:0:8}_02_7T $SUBJECTS_DIR && segmentHA_T2.sh ${subjName:0:8}_02_7T /data/fasttemp/uqtshaw/tomcat/data/derivatives/preprocessing/$subjName/${subjName}_ses-02_7T_T2w_NlinMoCo_res-iso.3_N4corrected_denoised_norm_brain_preproc.nii.gz T2_Only 0 $SUBJECTS_DIR ; done 

EOF
