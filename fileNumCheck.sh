#! /bin/bash

### define path ###
path="/u/user/gcho/SE_UserHome/CPV_ntuple/NanoAOD"
### case of data or mc ###
if [ "$1" == "data" ]; then
    path="$path/UL2018_Data/2018/Data"
    file_name=fileNumCheck_data.txt
    > ${file_name}
    sample=("A" "B" "C" "D")
elif [ "$1" == "mc" ]; then
    path="$path/UL2018_MC/2018/MC"
    file_name=fileNumCheck_mc.txt
    > ${file_name}
else
    echo "Invalid argument: data or mc"
    exit 1
fi
### change directory ###
echo "Now counting files in $path ...."
cd $path
#echo "pwd: $(pwd)"
### loop over all samples and count the number of ntuple files and record them ###
for i in *;
    do
    if [ "$1" == "data" ]; then
        cd $path/$i
        for j in *;
            do
            echo $j >> /u/user/gcho/TopPhysics/CPV/NanoAOD/CMSSW_13_3_0/src/PhysicsTools/NanoAODTools/SSBNanoNtuple/${file_name}
            find $j -type f -name "*.root" | wc -l >> /u/user/gcho/TopPhysics/CPV/NanoAOD/CMSSW_13_3_0/src/PhysicsTools/NanoAODTools/SSBNanoNtuple/${file_name}
        done
        elif [ "$1" == "mc" ]; then
        echo $i >> /u/user/gcho/TopPhysics/CPV/NanoAOD/CMSSW_13_3_0/src/PhysicsTools/NanoAODTools/SSBNanoNtuple/${file_name}
        find $i -type f -name "*.root" | wc -l >> /u/user/gcho/TopPhysics/CPV/NanoAOD/CMSSW_13_3_0/src/PhysicsTools/NanoAODTools/SSBNanoNtuple/${file_name}
    fi
done