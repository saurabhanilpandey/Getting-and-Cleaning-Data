# Getting-and-Cleaning-Data
The purpose of this project is to collect, work and clean a dataset. This project uses the data collected from the accelerometers from the Samsung Galaxy S smartphone.
## Getting Data and R script
* Download the folllowing zip file and and extract the data on your memory at any desired loaction, Lets say "~/Documents/GettingandCleaningData". [Link to the Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).   
You will have data stored in a file named "UCI HAR Dataset" stored on location you choose.
* Download the R script "run_analysis.R" inside this folder i.e., "GettingandCleaningData" or on location where "UCI HAR Dataset" is stored. You must no put run_analysis.R inside UCI HAR Dataset.   
## CleaningData   
* Open RStudio and set working directory to location where "UCI HAR Dataset" and "run_analysis.R" are stored. For example, setwd("~/Documents/GettingandCleaningData").
* Now, source the file "run_analysis.R".
> source("run_analysis.R")         
* Now, this R script will perform merge, analyse and clean data ready to use for any further data analysis.
