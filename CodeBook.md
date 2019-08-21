
## DATA DICTIONARY - Human Activity Recognition Using Smartphones Dataset Tidy
	
##	Dataset summary
 This dataset contains accelerometers and gyroscope sensors readings from a group of 30 volunteers with each of them performing 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone on their waist.
 Some of that data collected are:
 
 - Linear acceleration
 - Angular velocities
 - Gravity acceleration
 - Units derived from the 3-dimensional items above like their vector magnitude and their Fast Fourier Transform (FFT). 

## Tidying process overview
The original dataset is partitioned into training and test set but it was merged and sorted to build the final tidy table. Each column will have its values grouped by the subject and the acvity and each column's values will be replaced by the mean of all its values instead of contain data collected by the sensors.
To ease the searching in codebook I created two patterns ( The names below were taken from the original dataset and does't exists in the tidy one. Only chosen them to make the explanation as clean as possible ):

 - "**TF-**" this pattern means that the variable exists in the tidy dataset both in time ( when starting with 't' ) or in frequency domain ( when starting with 'f' ), e.g, tBodyAcc and fBodyAcc that respectively means the linear acceleration of the body in the time domain and in the frequency domain.
 - "**-XYZ**" this pattern means that this information exists in each of the 3-dimensional axis X, Y and Z, eg, tgravityaccmean-XYZ means that exists one column called tgravityaccmeanx, tgravityaccmeany and tgravityaccmeanz corresponding the mean of the gravitational acceleration for each axis.

## List of Measurements	

- **subject**  
The subject whose infos was gathred  
	1..30  

- **activity**
	The activity made by the subject in the current test

 1. walking 
 2. walkingupstairs
 3. walkingdownstairs
 4. sitting
 5. standing
 6. laying

- **TF-bodyaccmean-XYZ**  
	Mean linear acceleration  

- **TF-gravityaccmean-XYZ**  
	Mean of gravity acceleration  
	
- **TF-bodyaccjerkmean-XYZ**  
	Mean of jerk signals obtained by deriving the linear acceleration  
	
- **TF-bodygyromean-XYZ**  
	Mean of angular velocities  

- **TF-bodygyrojerkmean-XYZ**  
	Mean of jerk signals obtained by deriving the angular velocity  
	
- **TF-bodyaccmagmean**  
	Mean of linear acceleration magnitude computed using Euclidean norm  
	
- **TF-gravityaccmagmean**  
	Mean of all 3-dimensional gravity magnitude computed using Euclidean norm  

- **TF-bodyaccjerkmagmean**  
	Mean of the derivatives of linear acceleration magnitudes  

- **TF-bodygyromagmean**  
	Mean of magnitudes of angular velocities  
	
- **TF-bodygyrojerkmagmean**  
	Mean of the derivatives of angular velocities magnitude  
	
- **TF-bodyaccstd-XYZ**  
	Mean of linear acceleration's standard deviations  

- **TF-gravityaccstd-XYZ**  
	Mean of gravity acceleration's standard deviations  

- **TF-bodyaccjerkstd-XYZ**  
	Mean of linear acceleration's standard deviations derivatives  

- **TF-bodygyrostd-XYZ**  
	Mean of angular velocities standard deviations  

- **TF-bodygyrojerkstd-XYZ**  
	Mean of angular velocities standard deviation derivatives  
	
- **TF-bodyaccmagstd**  
	Mean of linear acceleration's standard deviation magnitudes  
	
- **TF-gravityaccmagstd**  
	Mean of gravity acceleration's standard deviation magnitudes  
	
- **TF-bodyaccjerkmagstd**  
	Mean of linear acceleration's standard deviation magnitude's derivatives  

- **TF-bodygyromagstd**  
	Mean of angular velocities standard deviation magnitudes  
	
- **TF-bodygyrojerkmagstd**  
	Mean of angular velocities standard deviation magnitude derivatives  

