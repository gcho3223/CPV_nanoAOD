# SSBNanoNtuple

This repository contains scripts and configurations for working with NanoAOD files in the CMS software framework. The following instructions describe how to set up the environment and install this package.

---

## **Installation Instructions**

### **1. Load CMS Environment**
Load the CMS default environment:
````bash
source /cvmfs/cms.cern.ch/cmsset_default.sh
````
### **2. Check CMSSW Compatibility**

Verify the compatibility of your gcc version with the desired CMSSW version:
````bash
scram list CMSSW_13_3_0
````
### **3. Set Architecture**

Set the appropriate architecture for your system:
	•	For KNU:

export SCRAM_ARCH=slc7_amd64_gcc12


	•	For lxplus:

export SCRAM_ARCH=el8_amd64_gcc12



4. Create and Initialize CMSSW Environment

Create a new CMSSW release area and navigate to the src directory:

cmsrel CMSSW_13_3_0
cd CMSSW_13_3_0/src/
cmsenv

5. Initialize Git for CMS

Initialize the CMS Git environment:

git cms-init

6. Add the Necessary CMS Package

Add the PhysicsTools/NanoAODTools package to your environment:

git cms-addpkg PhysicsTools/NanoAODTools

7. Clone the SSBNanoNtuple Repository

Clone this repository into the appropriate directory:

cd PhysicsTools/NanoAODTools
git clone https://github.com/physicist87/SSBNanoNtuple.git -b Production_v1

Summary

By following these steps, you will have the SSBNanoNtuple package installed and ready to use within the PhysicsTools/NanoAODTools directory in your CMSSW environment. Ensure that you are using the correct architecture (SCRAM_ARCH) based on your system.

If you encounter any issues during installation, please feel free to contact me. 

