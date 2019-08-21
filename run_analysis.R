# Load required libraries
library(dplyr)
# Set working space
script.dir <- dirname(sys.frame(1)$ofile)
setwd(script.dir)

#					Dataset DESCRIPTION
print("Openning Features file...")
features <- read.table("../features.txt", col.names=c("num","formula"))						# 561x1 will be used as X columns names
print("Openning Activities labels file...")
activity_labels <- read.table("../activity_labels.txt", col.names=c("num","formula"), colClasses = c("numeric","character"))
#   Removing underscores
activity_labels$formula <- lapply(activity_labels$formula, gsub, pattern="_", replacement="")
#   Convert to lower case
activity_labels$formula <- tolower(activity_labels$formula)

#					TRAIN   ( Already apply X )
print("Setting Trainning set features and labels, it may take a while...")
train_x <- read.table("../train/X_train.txt", check.names=FALSE, col.names=features$formula)	# 7352x561
train_y <- read.table("../train/y_train.txt",col.names=c("activity"), colClasses = c("character"))							# 7351x1

#					TEST
print("Setting Test set features and labels...")
test_x <- read.table("../test/X_test.txt", check.names=FALSE, col.names=features$formula)		# 2947x561
test_y <- read.table("../test/y_test.txt",col.names=c("activity"), colClasses = c("character"))								# 2946x1

#					1- DATASET MERGING
print("Merging Trainning and Test X...")
X <- rbind(train_x,test_x)																	# 10299x561
print("Merging Trainning and Test Y...")
Y <- rbind( train_y, test_y )																# 10297x1

# 					2- Get Columns related with mean std
print("Getting mean/std related columns...")
# 2.1- Get indexes of Mean related columns
mean_cols_indexes <- grep(pattern="-mean()",x= names(X))									# 46 entries
# 2.2- Get indexes of Std related columns
std_cols_indexes <- grep(pattern="-std()",x= names(X))										# 33 entries
# 2.3  Join both indexes
all_indexes <- c( mean_cols_indexes, std_cols_indexes )
# 2.4   Apply filter to the Dataset X
X <- X[, all_indexes]

#                   3- Make Y columns have descriptive names instead of numbers
# 3.1 Loop over all activites labels
for( i in activity_labels[,1] ){
    #cat(i); cat(" - "); print(activity_labels[i,2])
    # 3.2   Replace each labels to its respectively number in Y
    Y[Y == i] <- activity_labels[i,2]
}

#                   4- Labels X columns ( Already done when reading x train/test )

#                   5- Create a tidy and summarized version of the X dataset
# 5.1 Add activity column
X <- cbind(X,Y)
# 5.1 Tidy X columns names
# 5.1.1- Remove '-' and '()' characters
new_names <- lapply(names(X), gsub, pattern="-|\\(\\)|",replacement="")
# 5.1.2- Remove body repetion in some columns
new_names <- lapply(new_names, gsub, pattern="[Bb]ody[Bb]ody",replacement="body")
# 5.1.3- Lower case
new_names <- tolower( new_names )
# 5.1.4- Apply changes
names( X ) <- new_names

# 5.2 Get subjects indices
train_subjects <- read.table("../train/subject_train.txt",col.names=c("subject"), colClasses = c("numeric"))	# 7352x1
test_subjects <- read.table("../test/subject_test.txt",col.names=c("subject"), colClasses = c("numeric"))	# 2947x1
subjects <- rbind( train_subjects, test_subjects )

# 5.3 Add subjects column to X
X_df <- tbl_df(X)
X_df <- mutate(X_df,subject=subjects$subject)

# 5.4 Sort it by subjects indices ( Optional )
X_df <- arrange(X_df, subject)

# 5.5 Group data frame by subjects and activity
X_df <- group_by(X_df, subject, activity)
# 5.6 Apply mean to every collumn group ( the mean of subject column will be its own value: (2+2+2+2)/4 = 2 )
X_tidy <- summarise_all(X_df,mean)

# 5.7 Save dataframe
output_filename = "TidyDataset.txt"
cat("Saving final dataset as", output_filename, "\n" );
write.table(X_tidy, file=output_filename,row.name=FALSE)

print("Done!!!")