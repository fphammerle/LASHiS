#!/bin/bash
#this is the ashs longitudinal script for TOMCAT 
#data should be processed using antsLongitudinalCorticalThickness beforehand. 
#Processing will be completed for participants with 2 time points and then 3 if they have them.
#15/11/18
#Thomas Shaw

subjName=$1
source ~/.bashrc
ants_singularity="singularity exec --bind /data:/data/ /data/fasttemp/uqtshaw/tomcat/data/ants_fsl_robex_20180524.simg"
ashs_singularity="singularity exec --bind /data:/data/ /data/fasttemp/uqtshaw/tomcat/data/ashs_20180706.simg"
#everything necessary should be in 4_long, and then cp and chmod to TMPDIR (needs the whole folder with the warps etc)
mkdir -p /data/fasttemp/uqtshaw/tomcat/data/derivatives/ashs_long/${subjName}

if [[ -e /data/fasttemp/uqtshaw/tomcat/data/derivatives/$subjName/${subjName}lct_3_timepointsSingleSubjectTemplate/T_template0.nii.gz ]] ; then
cp -r /data/fasttemp/uqtshaw/tomcat/data/derivatives/$subjName/${subjName}lct_3_timepointsSingleSubjectTemplate /data/fasttemp/uqtshaw/tomcat/data/derivatives/ashs_long/${subjName}

##########3 TIMEPOINTS##############
    $ashs_singularity /ashs-1.0.0/bin/ashs_main.sh -I $subjName -a /ashs_atlas_upennpmc_20170810 -g ${subjName}lct_3_timepointsSingleSubjectTemplate/T_template0.nii.gz -f ${subjName}lct_3_timepointsSingleSubjectTemplate/T_template1.nii.gz -w ${subjName}_ashs_long_three_timepoints

#warp segmentations back to subject space. 
#TP1 FIXME to be like the other one in 7TEA 
    $ants_singularity antsApplyTransforms -d 3 -i ${subjName}_ashs_long_three_timepoints/final/${subjName}_left_lfseg_corr_nogray.nii.gz -o ${subjName}_ashs_long_three_timepoints/final/${subjName}_left_lfseg_corr_nogray_WarpedToSubjectSpace01.nii.gz -t ${subjName}lct_3_timepoints/${subjName}_ses-01_T1w_N4corrected_norm_preproc_0/${subjName}_ses-01_T1w_N4corrected_norm_preprocTemplateToSubject1GenericAffine.mat -t ${subjName}lct_3_timepoints/${subjName}_ses-01_T1w_N4corrected_norm_preproc_0/${subjName}_ses-01_T1w_N4corrected_norm_preprocTemplateToSubject0Warp.nii.gz -r ${subjName}lct_3_timepointsSingleSubjectTemplate/T_template0.nii.gz

    $ants_singularity antsApplyTransforms -d 3 -i ${subjName}_ashs_long_three_timepoints/final/${subjName}_right_lfseg_corr_nogray.nii.gz -o ${subjName}_ashs_long_three_timepoints/final/${subjName}_right_lfseg_corr_nogray_WarpedToSubjectSpace01.nii.gz -t ${subjName}lct_3_timepoints/${subjName}_ses-01_T1w_N4corrected_norm_preproc_0/${subjName}_ses-01_T1w_N4corrected_norm_preprocTemplateToSubject1GenericAffine.mat -t ${subjName}lct_3_timepoints/${subjName}_ses-01_T1w_N4corrected_norm_preproc_0/${subjName}_ses-01_T1w_N4corrected_norm_preprocTemplateToSubject0Warp.nii.gz -r ${subjName}lct_3_timepointsSingleSubjectTemplate/T_template0.nii.gz

#TP06
    $ants_singularity antsApplyTransforms -d 3 -i ${subjName}_ashs_long_three_timepoints/final/${subjName}_left_lfseg_corr_nogray.nii.gz -o ${subjName}_ashs_long_three_timepoints/final/${subjName}_left_lfseg_corr_nogray_WarpedToSubjectSpace06.nii.gz -t ${subjName}lct_3_timepoints/${subjName}_ses-06_T1w_N4corrected_norm_preproc_1/${subjName}_ses-06_T1w_N4corrected_norm_preprocTemplateToSubject1GenericAffine.mat -t ${subjName}lct_3_timepoints/${subjName}_ses-06_T1w_N4corrected_norm_preproc_1/${subjName}_ses-06_T1w_N4corrected_norm_preprocTemplateToSubject0Warp.nii.gz -r ${subjName}lct_3_timepointsSingleSubjectTemplate/T_template0.nii.gz

    $ants_singularity antsApplyTransforms -d 3 -i ${subjName}_ashs_long_three_timepoints/final/${subjName}_right_lfseg_corr_nogray.nii.gz -o ${subjName}_ashs_long_three_timepoints/final/${subjName}_right_lfseg_corr_nogray_WarpedToSubjectSpace06.nii.gz -t ${subjName}lct_3_timepoints/${subjName}_ses-06_T1w_N4corrected_norm_preproc_1/${subjName}_ses-06_T1w_N4corrected_norm_preprocTemplateToSubject1GenericAffine.mat -t ${subjName}lct_3_timepoints/${subjName}_ses-06_T1w_N4corrected_norm_preproc_1/${subjName}_ses-06_T1w_N4corrected_norm_preprocTemplateToSubject0Warp.nii.gz -r ${subjName}lct_3_timepointsSingleSubjectTemplate/T_template0.nii.gz

#TP12
    $ants_singularity antsApplyTransforms -d 3 -i ${subjName}_ashs_long_three_timepoints/final/${subjName}_left_lfseg_corr_nogray.nii.gz -o ${subjName}_ashs_long_three_timepoints/final/${subjName}_left_lfseg_corr_nogray_WarpedToSubjectSpace12.nii.gz -t ${subjName}lct_3_timepoints/${subjName}_ses-12_T1w_N4corrected_norm_preproc_2/${subjName}_ses-12_T1w_N4corrected_norm_preprocTemplateToSubject1GenericAffine.mat -t ${subjName}lct_3_timepoints/${subjName}_ses-12_T1w_N4corrected_norm_preproc_2/${subjName}_ses-12_T1w_N4corrected_norm_preprocTemplateToSubject0Warp.nii.gz -r ${subjName}lct_3_timepointsSingleSubjectTemplate/T_template0.nii.gz

    $ants_singularity antsApplyTransforms -d 3 -i ${subjName}_ashs_long_three_timepoints/final/${subjName}_right_lfseg_corr_nogray.nii.gz -o ${subjName}_ashs_long_three_timepoints/final/${subjName}_right_lfseg_corr_nogray_WarpedToSubjectSpace12.nii.gz -t ${subjName}lct_3_timepoints/${subjName}_ses-12_T1w_N4corrected_norm_preproc_2/${subjName}_ses-12_T1w_N4corrected_norm_preprocTemplateToSubject1GenericAffine.mat -t ${subjName}lct_3_timepoints/${subjName}_ses-12_T1w_N4corrected_norm_preproc_2/${subjName}_ses-12_T1w_N4corrected_norm_preprocTemplateToSubject0Warp.nii.gz -r ${subjName}lct_3_timepointsSingleSubjectTemplate/T_template0.nii.gz

#copy the TSE to TMPDIR for ease #PROLLY A FIXME HERE
    cp $TMPDIR/$subjName/${subjName}lct_3_timepoints/${subjName}_ses-01_T1w_N4corrected_norm_preproc_0/${subjName}_ses-01_T2w_NlinMoCo_res-iso.3_N4corrected_norm_denoised_brain_preprocRigidToSSTWarped.nii.gz $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/
    cp $TMPDIR/4_long_ashs/$subjName/${subjName}lct_3_timepoints/${subjName}_ses-06_T1w_N4corrected_norm_preproc_1/${subjName}_ses-06_T2w_NlinMoCo_res-iso.3_N4corrected_norm_denoised_brain_preprocRigidToSSTWarped.nii.gz $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/
    cp $TMPDIR/4_long_ashs/$subjName/${subjName}lct_3_timepoints/${subjName}_ses-12_T1w_N4corrected_norm_preproc_2/${subjName}_ses-12_T2w_NlinMoCo_res-iso.3_N4corrected_norm_denoised_brain_preprocRigidToSSTWarped.nii.gz $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/

#get the values
    $ashs_singularity /ashs-1.0.0/ext/Linux/bin/c3d ${subjName}_ashs_long_three_timepoints/final/${subjName}_ses-01_T2w_NlinMoCo_res-iso.3_N4corrected_norm_denoised_brain_preprocRigidToSSTWarped.nii.gz ${subjName}_ashs_long_three_timepoints/final/${subjName}_left_lfseg_corr_nogray_WarpedToSubjectSpace01.nii.gz -lstat >> $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_left_nogray_vols_01.txt
    $ashs_singularity /ashs-1.0.0/ext/Linux/bin/c3d ${subjName}_ashs_long_three_timepoints/final/${subjName}_ses-01_T2w_NlinMoCo_res-iso.3_N4corrected_norm_denoised_brain_preprocRigidToSSTWarped.nii.gz ${subjName}_ashs_long_three_timepoints/final/${subjName}_right_lfseg_corr_nogray_WarpedToSubjectSpace01.nii.gz -lstat >> $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_right_nogray_vols_01.txt

    $ashs_singularity /ashs-1.0.0/ext/Linux/bin/c3d ${subjName}_ashs_long_three_timepoints/final/${subjName}_ses-06_T2w_NlinMoCo_res-iso.3_N4corrected_norm_denoised_brain_preprocRigidToSSTWarped.nii.gz ${subjName}_ashs_long_three_timepoints/final/${subjName}_left_lfseg_corr_nogray_WarpedToSubjectSpace06.nii.gz -lstat >> $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_left_nogray_vols_06.txt
    $ashs_singularity /ashs-1.0.0/ext/Linux/bin/c3d ${subjName}_ashs_long_three_timepoints/final/${subjName}_ses-06_T2w_NlinMoCo_res-iso.3_N4corrected_norm_denoised_brain_preprocRigidToSSTWarped.nii.gz ${subjName}_ashs_long_three_timepoints/final/${subjName}_right_lfseg_corr_nogray_WarpedToSubjectSpace06.nii.gz -lstat >> $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_right_nogray_vols_06.txt

    $ashs_singularity /ashs-1.0.0/ext/Linux/bin/c3d ${subjName}_ashs_long_three_timepoints/final/${subjName}_ses-12_T2w_NlinMoCo_res-iso.3_N4corrected_norm_denoised_brain_preprocRigidToSSTWarped.nii.gz ${subjName}_ashs_long_three_timepoints/final/${subjName}_left_lfseg_corr_nogray_WarpedToSubjectSpace12.nii.gz -lstat >> $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_left_nogray_vols_12.txt
    $ashs_singularity /ashs-1.0.0/ext/Linux/bin/c3d ${subjName}_ashs_long_three_timepoints/final/${subjName}_ses-12_T2w_NlinMoCo_res-iso.3_N4corrected_norm_denoised_brain_preprocRigidToSSTWarped.nii.gz ${subjName}_ashs_long_three_timepoints/final/${subjName}_right_lfseg_corr_nogray_WarpedToSubjectSpace12.nii.gz -lstat >> $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_right_nogray_vols_12.txt



#organise the data
    for x in 01 06 12 ; do 
	echo -e '0\t0\t0\t0\t0\t0\t0\t0\t0\t0'>>$TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_right_nogray_vols_${x}.txt 
        #because the last line is deleted
        #re-arrange
	awk '{for (i=1; i<=NF; i++) a[i,NR]=$i; max=(max<NF?NF:max)} END {for (i=1; i<=max; i++) {for (j=1; j<+NR; j++) printf "%s%s", a[i,j], (j==NR?RS:FS) }}' $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_right_nogray_vols_${x}.txt >> $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_right_nogray_vols_complete_${x}.csv
	#cut lines
	cut -d ' ' -f 1-97 --complement $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_right_nogray_vols_complete_${x}.csv >> $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_right_nogray_vols_complete_cut_${x}.csv 
	cut -d ' ' -f 17-150 --complement $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_right_nogray_vols_complete_cut_${x}.csv >> $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_right_nogray_vols_cut_2_${x}.csv
	icv=`cat $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_icv.txt`	
	right_vols=`cat $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_right_nogray_vols_cut_2_${x}.csv`

	echo -e '0\t0\t0\t0\t0\t0\t0\t0\t0\t0'>>$TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_left_nogray_vols_${x}.txt 
         #re-arrange
	awk '{for (i=1; i<=NF; i++) a[i,NR]=$i; max=(max<NF?NF:max)} END {for (i=1; i<=max; i++) {for (j=1; j<+NR; j++) printf "%s%s", a[i,j], (j==NR?RS:FS) }}' $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_left_nogray_vols_${x}.txt >> $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_left_nogray_vols_complete_${x}.csv
	#cut lines
	cut -d ' ' -f 1-97 --complement $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_left_nogray_vols_complete_${x}.csv >> $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_left_nogray_vols_complete_cut_${x}.csv 
	cut -d ' ' -f 17-150 --complement $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_left_nogray_vols_complete_cut_${x}.csv >> $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_left_nogray_vols_cut_2_${x}.csv
	left_vols=`cat $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_left_nogray_vols_cut_2_${x}.csv`	
	echo -e "${subjName}_${x}"'\t'"${icv}"'\t'"${right_vols}"'\t'"${left_vols}">>$TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_${x}_ASHS_vols.csv
    done
    cat $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_01_ASHS_vols.csv>>$TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_ASHS_vols.csv
    cat $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_06_ASHS_vols.csv>>$TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_ASHS_vols.csv
    cat $TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_12_ASHS_vols.csv>>$TMPDIR/$subjName/${subjName}_ashs_long_three_timepoints/final/${subjName}_ASHS_vols.csv

#copy it out
    rsync -r -c -v $TMPDIR/${subjName}/${subjName}_ashs_long_three_timepoints /RDS/Q0535/optimex/data/derivatives/4_long_ashs/${subjName}/

fi

<<EOF

if [[ -e $TMPDIR/${subjName}/${subjName}lct_2_timepointsSingleSubjectTemplate/T_template0.nii.gz ]] ; then
##########2 TIMEPOINTS##############
    $ashs_singularity /ashs-1.0.0/bin/ashs_main.sh -I $subjName -a /ashs_atlas_upennpmc_20170810 -g ${subjName}lct_2_timepointsSingleSubjectTemplate/T_template0.nii.gz -f ${subjName}lct_2_timepointsSingleSubjectTemplate/T_template1.nii.gz -w ${subjName}_ashs_long_two_timepoints

#warp segmentations back to subject space. 
#TP1 
    $ants_singularity antsApplyTransforms -d 3 -i ${subjName}_ashs_long_two_timepoints/final/${subjName}_left_lfseg_corr_nogray.nii.gz -o ${subjName}_ashs_long_two_timepoints/final/${subjName}_left_lfseg_corr_nogray_WarpedToSubjectSpace01.nii.gz -t ${subjName}lct_2_timepoints/${subjName}_ses-01_T1w_N4corrected_norm_preproc_0/${subjName}_ses-01_T1w_N4corrected_norm_preprocTemplateToSubject1GenericAffine.mat -t ${subjName}lct_2_timepoints/${subjName}_ses-01_T1w_N4corrected_norm_preproc_0/${subjName}_ses-01_T1w_N4corrected_norm_preprocTemplateToSubject0Warp.nii.gz -r ${subjName}lct_2_timepointsSingleSubjectTemplate/T_template0.nii.gz

    $ants_singularity antsApplyTransforms -d 3 -i ${subjName}_ashs_long_two_timepoints/final/${subjName}_right_lfseg_corr_nogray.nii.gz -o ${subjName}_ashs_long_two_timepoints/final/${subjName}_right_lfseg_corr_nogray_WarpedToSubjectSpace01.nii.gz -t ${subjName}lct_2_timepoints/${subjName}_ses-01_T1w_N4corrected_norm_preproc_0/${subjName}_ses-01_T1w_N4corrected_norm_preprocTemplateToSubject1GenericAffine.mat -t ${subjName}lct_2_timepoints/${subjName}_ses-01_T1w_N4corrected_norm_preproc_0/${subjName}_ses-01_T1w_N4corrected_norm_preprocTemplateToSubject0Warp.nii.gz -r ${subjName}lct_2_timepointsSingleSubjectTemplate/T_template0.nii.gz

#TP06
    $ants_singularity antsApplyTransforms -d 3 -i ${subjName}_ashs_long_two_timepoints/final/${subjName}_left_lfseg_corr_nogray.nii.gz -o ${subjName}_ashs_long_two_timepoints/final/${subjName}_left_lfseg_corr_nogray_WarpedToSubjectSpace06.nii.gz -t ${subjName}lct_2_timepoints/${subjName}_ses-06_T1w_N4corrected_norm_preproc_1/${subjName}_ses-06_T1w_N4corrected_norm_preprocTemplateToSubject1GenericAffine.mat -t ${subjName}lct_2_timepoints/${subjName}_ses-06_T1w_N4corrected_norm_preproc_1/${subjName}_ses-06_T1w_N4corrected_norm_preprocTemplateToSubject0Warp.nii.gz -r ${subjName}lct_2_timepointsSingleSubjectTemplate/T_template0.nii.gz

    $ants_singularity antsApplyTransforms -d 3 -i ${subjName}_ashs_long_two_timepoints/final/${subjName}_right_lfseg_corr_nogray.nii.gz -o ${subjName}_ashs_long_two_timepoints/final/${subjName}_right_lfseg_corr_nogray_WarpedToSubjectSpace06.nii.gz -t ${subjName}lct_2_timepoints/${subjName}_ses-06_T1w_N4corrected_norm_preproc_1/${subjName}_ses-06_T1w_N4corrected_norm_preprocTemplateToSubject1GenericAffine.mat -t ${subjName}lct_2_timepoints/${subjName}_ses-06_T1w_N4corrected_norm_preproc_1/${subjName}_ses-06_T1w_N4corrected_norm_preprocTemplateToSubject0Warp.nii.gz -r ${subjName}lct_2_timepointsSingleSubjectTemplate/T_template0.nii.gz

#organise the data
    for x in 01 06 ; do 
	echo -e '0\t0\t0\t0\t0\t0\t0\t0\t0\t0'>>$TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_right_nogray_vols_${x}.txt 
        #because the last line is deleted
        #re-arrange
	awk '{for (i=1; i<=NF; i++) a[i,NR]=$i; max=(max<NF?NF:max)} END {for (i=1; i<=max; i++) {for (j=1; j<+NR; j++) printf "%s%s", a[i,j], (j==NR?RS:FS) }}' $TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_right_nogray_vols_${x}.txt >> $TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_right_nogray_vols_complete_${x}.csv
	#cut lines
	cut -d ' ' -f 1-97 --complement $TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_right_nogray_vols_complete_${x}.csv >> $TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_right_nogray_vols_complete_cut_${x}.csv 
	cut -d ' ' -f 17-150 --complement $TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_right_nogray_vols_complete_cut_${x}.csv >> $TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_right_nogray_vols_cut_2_${x}.csv
	icv=`cat $TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_icv.txt`	
	right_vols=`cat $TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_right_nogray_vols_cut_2_${x}.csv`

	echo -e '0\t0\t0\t0\t0\t0\t0\t0\t0\t0'>>$TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_left_nogray_vols_${x}.txt 
         #re-arrange
	awk '{for (i=1; i<=NF; i++) a[i,NR]=$i; max=(max<NF?NF:max)} END {for (i=1; i<=max; i++) {for (j=1; j<+NR; j++) printf "%s%s", a[i,j], (j==NR?RS:FS) }}' $TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_left_nogray_vols_${x}.txt >> $TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_left_nogray_vols_complete_${x}.csv
	#cut lines
	cut -d ' ' -f 1-97 --complement $TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_left_nogray_vols_complete_${x}.csv >> $TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_left_nogray_vols_complete_cut_${x}.csv 
	cut -d ' ' -f 17-150 --complement $TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_left_nogray_vols_complete_cut_${x}.csv >> $TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_left_nogray_vols_cut_2_${x}.csv
	left_vols=`cat $TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_left_nogray_vols_cut_2_${x}.csv`	
	echo -e "${subjName}_${x}"'\t'"${icv}"'\t'"${right_vols}"'\t'"${left_vols}">>$TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_${x}_ASHS_vols.csv
    done
    cat $TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_01_ASHS_vols.csv>>$TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_ASHS_vols.csv
    cat $TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_06_ASHS_vols.csv>>$TMPDIR/$subjName/${subjName}_ashs_long_two_timepoints/final/${subjName}_ASHS_vols.csv
fi

rsync -r -c -v $TMPDIR/${subjName}/${subjName}_ashs_long_two_timepoints /RDS/Q0535/optimex/data/derivatives/4_long_ashs/${subjName}/

EOF
