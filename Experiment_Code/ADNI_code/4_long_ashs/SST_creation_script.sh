#!/bin/bash
for subjName in `cat /data/fasttemp/uqtshaw/tomcat/data/subjnames.csv`  ; do

#mkdir -p /data/fasttemp/uqtshaw/tomcat/data/derivatives/4_long_ashs/SST_creation/${subjName}_3TP /data/fasttemp/uqtshaw/tomcat/data/derivatives/4_long_ashs/SST_creation/${subjName}_2TP_1-2 /data/fasttemp/uqtshaw/tomcat/data/derivatives/4_long_ashs/SST_creation/${subjName}_2TP_2-3
#    echo "/data/fasttemp/uqtshaw/tomcat/data/derivatives/preprocessing/${subjName}/${subjName}_ses-02_7T_T1w_N4corrected_norm_brain_preproc.nii.gz,/data/fasttemp/uqtshaw/tomcat/data/derivatives/preprocessing/${subjName}/${subjName}_ses-02_7T_T2w_NlinMoCo_res-iso.3_N4corrected_denoised_norm_brain_preproc.nii.gz">>/data/fasttemp/uqtshaw/tomcat/data/derivatives/4_long_ashs/SST_creation/${subjName}_2TP_2-3/${subjName}_filenames.csv
#   echo "/data/fasttemp/uqtshaw/tomcat/data/derivatives/preprocessing/${subjName}/${subjName}_ses-03_7T_T1w_N4corrected_norm_brain_preproc.nii.gz,/data/fasttemp/uqtshaw/tomcat/data/derivatives/preprocessing/${subjName}/${subjName}_ses-03_7T_T2w_NlinMoCo_res-iso.3_N4corrected_denoised_norm_brain_preproc.nii.gz">>/data/fasttemp/uqtshaw/tomcat/data/derivatives/4_long_ashs/SST_creation/${subjName}_2TP_2-3/${subjName}_filenames.csv
#    echo "/data/fasttemp/uqtshaw/tomcat/data/derivatives/preprocessing/${subjName}/${subjName}_ses-01_7T_T1w_N4corrected_norm_brain_ses-02-space_preproc.nii.gz,/data/fasttemp/uqtshaw/tomcat/data/derivatives/preprocessing/${subjName}/${subjName}_ses-01_7T_T2w_NlinMoCo_res-iso.3_N4corrected_denoised_norm_brain_preproc.nii.gz">>/data/fasttemp/uqtshaw/tomcat/data/derivatives/4_long_ashs/SST_creation/${subjName}_2TP_1-2/${subjName}_filenames.csv
#  echo "/data/fasttemp/uqtshaw/tomcat/data/derivatives/preprocessing/${subjName}/${subjName}_ses-02_7T_T1w_N4corrected_norm_brain_preproc.nii.gz,/data/fasttemp/uqtshaw/tomcat/data/derivatives/preprocessing/${subjName}/${subjName}_ses-02_7T_T2w_NlinMoCo_res-iso.3_N4corrected_denoised_norm_brain_preproc.nii.gz">>/data/fasttemp/uqtshaw/tomcat/data/derivatives/4_long_ashs/SST_creation/${subjName}_2TP_1-2/${subjName}_filenames.csv
#   echo "/data/fasttemp/uqtshaw/tomcat/data/derivatives/preprocessing/${subjName}/${subjName}_ses-01_7T_T1w_N4corrected_norm_brain_ses-02-space_preproc.nii.gz,/data/fasttemp/uqtshaw/tomcat/data/derivatives/preprocessing/${subjName}/${subjName}_ses-01_7T_T2w_NlinMoCo_res-iso.3_N4corrected_denoised_norm_brain_preproc.nii.gz">>/data/fasttemp/uqtshaw/tomcat/data/derivatives/4_long_ashs/SST_creation/${subjName}_3TP/${subjName}_filenames.csv
#   echo "/data/fasttemp/uqtshaw/tomcat/data/derivatives/preprocessing/${subjName}/${subjName}_ses-02_7T_T1w_N4corrected_norm_brain_preproc.nii.gz,/data/fasttemp/uqtshaw/tomcat/data/derivatives/preprocessing/${subjName}/${subjName}_ses-02_7T_T2w_NlinMoCo_res-iso.3_N4corrected_denoised_norm_brain_preproc.nii.gz">>/data/fasttemp/uqtshaw/tomcat/data/derivatives/4_long_ashs/SST_creation/${subjName}_3TP/${subjName}_filenames.csv
#    echo "/data/fasttemp/uqtshaw/tomcat/data/derivatives/preprocessing/${subjName}/${subjName}_ses-03_7T_T1w_N4corrected_norm_brain_preproc.nii.gz,/data/fasttemp/uqtshaw/tomcat/data/derivatives/preprocessing/${subjName}/${subjName}_ses-03_7T_T2w_NlinMoCo_res-iso.3_N4corrected_denoised_norm_brain_preproc.nii.gz">>/data/fasttemp/uqtshaw/tomcat/data/derivatives/4_long_ashs/SST_creation/${subjName}_3TP/${subjName}_filenames.csv
#sleep 5s
# cd /data/fasttemp/uqtshaw/tomcat/data/derivatives/4_long_ashs/SST_creation/${subjName}_2TP_1-2
#nohup antsMultivariateTemplateConstruction.sh -d 3 -i 4 -b 0 -k 2 -m 100x70x30x3 -n 0 -s CC -t GR -g 0.25 -c 2 -j 4 -r 1 -o ${subjName}_2TP_1-2_ /data/fasttemp/uqtshaw/tomcat/data/derivatives/4_long_ashs/SST_creation/${subjName}_2TP_1-2/${subjName}_filenames.csv &
#sleep 10s
#cd /data/fasttemp/uqtshaw/tomcat/data/derivatives/4_long_ashs/SST_creation/${subjName}_3TP
#nohup antsMultivariateTemplateConstruction.sh -d 3 -i 4 -b 0 -k 2 -m 100x70x30x3 -n 0 -s CC -t GR -g 0.25 -c 2 -j 4 -r 1 -o ${subjName}_3TP_ /data/fasttemp/uqtshaw/tomcat/data/derivatives/4_long_ashs/SST_creation/${subjName}_3TP/${subjName}_filenames.csv &
#sleep 10s
cd /data/fasttemp/uqtshaw/tomcat/data/derivatives/4_long_ashs/SST_creation/${subjName}_2TP_2-3
nohup antsMultivariateTemplateConstruction.sh -d 3 -i 4 -b 0 -k 2 -m 100x70x30x3 -n 0 -s CC -t GR -g 0.25 -c 2 -j 4 -r 1 -o ${subjName}_2TP_2-3_ /data/fasttemp/uqtshaw/tomcat/data/derivatives/4_long_ashs/SST_creation/${subjName}_2TP_2-3/${subjName}_filenames.csv &
sleep 10s    
done
