PR <- read.csv("C:/Users/lrojas6/prospects.csv")
View(PR)

#Factor string variables
PR$AGE = factor(PR$AGE)
PR$INCOME = factor(PR$INCOME)
PR$MARRIED = factor(PR$MARRIED)
PR$OWNHOME = factor(PR$OWNHOME)
PR$SEX = factor(PR$SEX)
PR$FICO..700 = factor(PR$FICO..700)
str(PR)

#Replace missing values with mode
PR$AGE = ifelse(is.na(PR$AGE), mean(PR$AGE),PR$AGE)
PR$INCOME = ifelse(is.na(PR$INCOME), mean(PR$INCOME),PR$INCOME)
PR$SEX = ifelse(is.na(PR$SEX), mode(PR$SEX),PR$SEX)
PR$MARRIED = ifelse(is.na(PR$MARRIED), mode(PR$MARRIED),PR$MARRIED)
PR$OWNHOME = ifelse(is.na(PR$OWNHOME), mode(PR$OWNHOME),PR$OWNHOME)
PR$FICO..700 = ifelse(is.na(PR$FICO..700), mode(PR$FICO..700),PR$FICO..700)
str(PR)

# Subset the prospects data
PR.1 = PR
PR.1$ID <- NULL
PR.2 = PR.1
PR.2$LOC <- NULL
View(PR.2)

# Perform K-Means with 4 clusters
set.seed(7)
km <- kmeans(PR.2, 4)
km

#Variances between clusters
km$betweenss
