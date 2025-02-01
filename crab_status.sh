#!/bin/bash

samples=(
    "WJetsToLNu_TuneCP5_amcatnloFXFX"
    "WJetsToLNu_TuneCP5_madgraphMLM"
    "DYJetsToLL_M-50_TuneCP5_amcatnloFXFX"
    "DYJetsToLL_M-50_TuneCP5_madgraphMLM"
    "DYJetsToLL_M-10to50_TuneCP5_amcatnloFXFX"
    "DYJetsToLL_M-10to50_TuneCP5_madgraphMLM"
    "TTTo2L2Nu_TuneCP5_powheg"
    "TTToHadronic_TuneCP5_powheg"
    "TTToSemiLeptonic_TuneCP5_powheg"
    "TTJets_TuneCP5_amcatnloFXFX"
    "TTJets_TuneCP5_madgraphMLM"
    "ST_tW_antitop_5f_NoFullyHadronicDecays_TuneCP5_powheg"
    "ST_tW_top_5f_NoFullyHadronicDecays_TuneCP5_powheg"
    "ST_s-channel_4f_leptonDecays_TuneCP5_amcatnlo"
    "ST_t-channel_top_4f_InclusiveDecays_TuneCP5_powheg-madspin"
    "ST_t-channel_antitop_4f_InclusiveDecays_TuneCP5_powheg-madspin"
    "WW_TuneCP5_pythia8"
    "WZ_TuneCP5_pythia8"
    "ZZ_TuneCP5_pythia8"
    "TTZToQQ_TuneCP5_amcatnlo"
    "TTZToQQ_TuneCP5_13TeV_amcatnlo"
    "TTZToLLNuNu_M-10_TuneCP5_amcatnlo"
    "TTWJetsToLNu_TuneCP5_amcatnloFXFX-madspin"
    "TTWJetsToQQ_TuneCP5_amcatnloFXFX-madspin"
    "QCD_Pt-1000_MuEnrichedPt5_TuneCP5_pythia8"
    "QCD_Pt-120To170_MuEnrichedPt5_TuneCP5_pythia8"
    "QCD_Pt-15To20_MuEnrichedPt5_TuneCP5_pythia8"
    "QCD_Pt-170To300_MuEnrichedPt5_TuneCP5_pythia8"
    "QCD_Pt-20To30_MuEnrichedPt5_TuneCP5_pythia8"
    "QCD_Pt-20_MuEnrichedPt15_TuneCP5_pythia8"
    "QCD_Pt-300To470_MuEnrichedPt5_TuneCP5_pythia8"
    "QCD_Pt-30To50_MuEnrichedPt5_TuneCP5_pythia8"
    "QCD_Pt-30_MuEnrichedPt4_TuneCP5_13TeV_pythia8"
    "QCD_Pt-470To600_MuEnrichedPt5_TuneCP5_pythia8"
    "QCD_Pt-50To80_MuEnrichedPt5_TuneCP5_pythia8"
    "QCD_Pt-600To800_MuEnrichedPt5_TuneCP5_pythia8"
    "QCD_Pt-800To1000_MuEnrichedPt5_TuneCP5_pythia8"
    "QCD_Pt-80To120_MuEnrichedPt5_TuneCP5_pythia8"
    "QCD_Pt-120to170_EMEnriched_TuneCP5_pythia8"
    "QCD_Pt-15to20_EMEnriched_TuneCP5_pythia8"
    "QCD_Pt-170to300_EMEnriched_TuneCP5_pythia8"
    "QCD_Pt-20to30_EMEnriched_TuneCP5_pythia8"
    "QCD_Pt-300toInf_EMEnriched_TuneCP5_pythia8"
    "QCD_Pt-30to50_EMEnriched_TuneCP5_pythia8"
    "QCD_Pt-50to80_EMEnriched_TuneCP5_pythia8"
    "QCD_Pt-80to120_EMEnriched_TuneCP5_pythia8"
    "QCD_Pt-30to40_DoubleEMEnriched_MGG-80toInf_TuneCP5_pythia8"
    "QCD_Pt-30toInf_DoubleEMEnriched_MGG-40to80_TuneCP5_pythia8"
    "QCD_Pt-40ToInf_DoubleEMEnriched_MGG-80ToInf_TuneCP5_pythia8"
    "QCD_Pt_1000to1400_TuneCP5_13TeV_pythia8"
    "QCD_Pt_120to170_TuneCP5_13TeV_pythia8"
    "QCD_Pt_1400to1800_TuneCP5_13TeV_pythia8"
    "QCD_Pt_15to30_TuneCP5_13TeV_pythia8"
    "QCD_Pt_170to300_TuneCP5_13TeV_pythia8"
    "QCD_Pt_1800to2400_TuneCP5_13TeV_pythia8"
    "QCD_Pt_2400to3200_TuneCP5_13TeV_pythia8"
    "QCD_Pt_300to470_TuneCP5_13TeV_pythia8"
    "QCD_Pt_30to50_TuneCP5_13TeV_pythia8"
    "QCD_Pt_3200toInf_TuneCP5_13TeV_pythia8"
    "QCD_Pt_470to600_TuneCP5_13TeV_pythia8"
    "QCD_Pt_50to80_TuneCP5_13TeV_pythia8"
    "QCD_Pt_600to800_TuneCP5_13TeV_pythia8"
    "QCD_Pt_800to1000_TuneCP5_13TeV_pythia8"
    "QCD_Pt_80to120_TuneCP5_13TeV_pythia8"
    "QCD_HT300to500_TuneCP5_PSWeights_madgraph"
    "QCD_HT200to300_TuneCP5_PSWeights_madgraph"
    "QCD_HT100to200_TuneCP5_PSWeights_madgraph"
    "QCD_HT500to700_TuneCP5_PSWeights_madgraph"
    "QCD_HT700to1000_TuneCP5_PSWeights_madgraph"
    "QCD_HT1000to1500_TuneCP5_PSWeights_madgraph"
    "QCD_HT1500to2000_TuneCP5_PSWeights_madgraph"
    "QCD_HT2000toInf_TuneCP5_PSWeights_madgraph"
    ############# Data #############
    #"SingleMuon_Run2018A"
    #"SingleMuon_Run2018B"
    #"SingleMuon_Run2018C"
    #"SingleMuon_Run2018D"
    #"DoubleMuon_Run2018A"
    #"DoubleMuon_Run2018B"
    #"DoubleMuon_Run2018C"
    #"DoubleMuon_Run2018D"
    #"EGamma_Run2018A"
    #"EGamma_Run2018B"
    #"EGamma_Run2018C"
    #"EGamma_Run2018D"
)
###########################################################
### < script usage >                                    ###
### ./crab_status.sh [option] [sample_type] [log_type]  ###
### - option:                                           ###
###   status: for common jobs submission                ###
###   resubmit: for resubmitted jobs submission         ###
### - sample_type:                                      ###
###   data or mc                                        ###
### - log_type:                                         ###
###   full: record full status                          ###
###   simple: record simple status                      ###
###########################################################
### define sample type ###
##########################
if [ "$2" == "mc" ]; then
    sample_type="MC"
elif [ "$2" == "data" ]; then
    sample_type="Data"
else
    echo "Please specify sample type: mc or data"
    exit 1
fi
#######################
### create log file ###
#######################
log_path="./Crab_Summary/2018"
mkdir -p ${log_path}/${sample_type}
if [ "$1" == "resubmit" ]; then
    log_file="${log_path}/${sample_type}/UL2018_${sample_type}_resubmit"
elif [ "$1" == "status" ]; then
    log_file="${log_path}/${sample_type}/UL2018_${sample_type}_status"
else
    echo "Please specify option: resubmit or status"
    exit 1
fi
> ${log_file}_${3}_log.txt
echo "log file: ${log_file}_${3}_log.txt"
##############################
### progress bar variables ###
##############################
total_sample=0
completed=0
for sample in "${samples[@]}"; do
    total_sample=$((total_sample + 1))
done
#######################
### failed job list ###
#######################
failed_job=()
################################
# check status for each sample #
################################
echo "Now Starting..... Progress will appear after the first sample check is completed"
for sample in "${samples[@]}";
    do
    # define crab directory #
    crab_dir="./Crab_jobs/2018/${sample_type}/${sample}/crab_${sample}"
    if [ -d "$crab_dir" ]; then
        echo "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[ ${sample} ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]" >> ${log_file}_${3}_log.txt
        if [ "$3" == "full" ]; then
            crab status -d "$crab_dir" 2>/dev/null >> ${log_file}_${3}_log.txt
        elif [ "$3" == "simple" ]; then
            crab status -d "$crab_dir" 2>/dev/null | grep -E "Status on the CRAB server|Status on the scheduler|Jobs status" >> ${log_file}_${3}_log.txt
        fi
        # Jobs status가 failed인지 확인
        if crab status -d "$crab_dir" 2>/dev/null | grep -q "Jobs status.*failed"; then
            failed_job+=("$sample")
        fi
    fi
    ((completed++))
    progress=$(( (completed * 100) / total_sample )) 
    echo -ne "Checking status for sample(${completed}/${total_sample}, ${progress}%): ${sample} finished\r"
done
###################################
### summary for failed job list ###
###################################
echo "------------------------------------ Summary for failed job list -----------------------------------------------" >> ${log_file}_${3}_log.txt
for failed in "${failed_job[@]}"; do
    echo ${failed} >> ${log_file}_${3}_log.txt
done
echo "Done!! Check the log file for more details."