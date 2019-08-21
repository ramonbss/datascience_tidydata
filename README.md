

# Getting and cleaning data course's project

The goal of the project in this repository is to process the [Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip) and transform it into a tidy format.

### For it, 3 things had to be achieved:
 - Each variable forms a column
 - Each observation forms a row
 - Each type of observational unit forms a table  
  
 ### How to use it  
 - cd "UCI_HAR_Dataset_FOLDER_PATH" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Go to UCI HAR Dataset directory location
 - git clone https://github.com/ramonbss/datascience_tidydata  &nbsp;&nbsp;&nbsp;# Clone this repository 
 - cd datascience_tidydata &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Enter repository's folder
 - source("run_analysis.R") &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Run the script

  Just run the script "run_analysis.R", eg source("run_analysis.R"), and it will load the original dataset and tidy it generating an output file called "TidyDataset.txt".

 ###	Dataset summary
 This dataset contains accelerometers and gyroscope sensors readings from a group of 30 volunteers with each of them performing 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone on their waist.
 Some of that data collected are:
 
 - Linear acceleration
 - Angular velocities
 - Gravity acceleration
 - Units derived from the 3-dimensional items above like their vector magnitude and their Fast Fourier Transform (FFT). 

### Tidying process overview
The original dataset is partitioned into training and test set but it was merged and sorted to build the final tidy table. Each column will have its values grouped by the subject and the acvity and each column's values will be replaced by the mean of all its values instead of contain data collected by the sensors.
To ease the searching in codebook I created two patterns ( The names below were taken from the original dataset and does't exists in the tidy one. Only chosen them to make the explanation as clean as possible ):

 - "**TF-**" this pattern means that the variable exists in the tidy dataset both in time ( when starting with 't' ) or in frequency domain ( when starting with 'f' ), e.g, tBodyAcc and fBodyAcc that respectively means the linear acceleration of the body in the time domain and in the frequency domain.
 - "**-XYZ**" this pattern means that this information exists in each of the 3-dimensional axis X, Y and Z, eg, tgravityaccmean-XYZ means that exists one column called tgravityaccmeanx, tgravityaccmeany and tgravityaccmeanz corresponding the mean of the gravitational acceleration for each axis.

