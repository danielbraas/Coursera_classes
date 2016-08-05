wd <- getwd()

files <- list.files(pattern='txt',recursive=T)   #look at all files in folder and subfolders
files <- files[!(grepl('Inertial', files))]      #eliminate raw data files
features <- read.table('features.txt')           #read in feature table
features <- gsub('\\()','',features[,2])         #strip away round brackets
test.files <- files[grep('test',files)]          #split files into test files (easier to separate than long list)
train.files <- files[grep('train', files)]       #split files into test files (easier to separate than long list)
test.X <- read.table(test.files[grep('X', test.files)])   #load testing data
train.X <- read.table(train.files[grep('X', train.files)]) #load training data
names(test.X) <- features                       #name features in test data
names(train.X) <- features                      #name features in training data
Subject <- read.table(test.files[grep('subject', test.files)], col.names='Subject')   #load in data for test-Subject and label as such
Activity <- read.table(test.files[grep('y',test.files)], col.names='Activity')        #load in data for test-Activity and label as such
data_all <- data.frame(test.X, Subject, Activity)    #make data frame with all variables and their respective names
Subject <- read.table(train.files[grep('subject', train.files)], col.names='Subject')   #load in data for train-Subject and label as such
Activity <- read.table(train.files[grep('y',train.files)], col.names='Activity')        #load in data for train-Acitivity and label as such
train.X <- data.frame(train.X, Subject, Activity)   #create training set with all variables
data_all <- rbind(data_all, train.X)                #combine training and test set to create one big data set

mean.columns <- grep('mean', names(data_all))       #get all columns with mean values
std.columns <- grep('std', names(data_all))         #get all columns with std values
columns <- sort(append(mean.columns, std.columns))  #combine mean and std columns and sort
data_all <- data.frame('Subject'=data_all$Subject, 'Activity'=data_all$Activity, data_all[,columns])   #Extract only Subject, Activity, mean values and std

activity_label <- read.table('activity_labels.txt')   #get information about activity labels
for (i in 1:6){                                       #replace number with descriptive activity
  data_all$Activity <- gsub(activity_label[i,1],activity_label[i,2], data_all$Activity)
}
data_all$Activity <- as.factor(data_all$Activity)        #convert character vector to factor
data_all$Subject <- as.factor(data_all$Subject)

data <- split(data_all, data_all[,c('Subject','Activity')])  #split data into Subject and Activity
data <- t(sapply(data, function(x) apply(x[,3:length(x)], 2, mean, na.rm=T)))  #calculate means for every variable by Subject and Activity ##rownames contain the information for Subject and Activity
Activity <- factor(gsub('[0-9]*\\.','',rownames(data)))    #parses out Activities
Subject <- factor(gsub('\\.(.)*','',rownames(data)))         #parses out Subject
tidy_df <- data.frame(Subject, Activity, data)               #creates tidy data frame
rownames(tidy_df) <- NULL                                    #eliminates rownames
write.table(tidy_df, 'Tidy data frame.txt', row.names=F)

