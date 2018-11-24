# Base R cheat sheet
c(2,4,6)
seq(2,3,0.5)
rep(1:2,3)
rep(1:2,each=3)
rep(c(3,6,8),times=4)

x1=1:100
(x1=1:30) # assiging printing same time so using bracket
(x2=c(1,213,4,5))
class(x2)

(x3=c('a',"abc"))
class(x3)
(x3=letters[1:10])
class(x3)
LETTERS[1:26]


(x4=c(T,FALSE,TRUE,T,F))
class(x4)
x5=c(3L,5L)
class(x5)

x5a=c(3,5.5)
as.integer(x5a)    # making integer from decimal

x[1:100]
x




#access elements
x6=10:100
x6[10:20] # access from 10th to 20th
x6[3] # access 3rd element
x6[c(2,4)] # access 2nd and 4th element
x6[-c(2,4)]
x6[c(2.4,3.54)] # real no are truncated to real no
x6
x6[-(20:70)]
x6[x6>30 & x6<40]
length(x6)
x6[length(x6)]
x6[-(length(x6)-1)]  # removing second largest no

(x7= c(x5,x6))

x6
(x6 = sample(1:50))

sort(x6)
sort(x6[-c(1,2)])
sort(x6,decreasing=T) #sort decreasing order
rev(x6) # reversing the orginal sequence of x6


x6[2:10] <- 99 ; x6  # modify second element
x6[x6>30 & x6<42]=999
x6


x6
x7 = x6[1:4]; x7 # sendig first 4 value to another vector

1:5
(x = seq(1,5, length.out = 15)) # sequenceing 1 to 5 in a interval of 15
x = NULL
x
?distribution
?rnorm
(x=rnorm(1000000))
plot(density(x))
abline(v=c(-3,03)) 
mean(x)
(x1 =rnorm(1000000, mean=50,sd=5))
plot(density(x1))
abline(v=mean(x1), h=0.04)

hist(x1, breaks = 50)
hist(x1, freq=F) # making histogram
lines(density(x1), col=2)
summary(x1)
quantile(x1)
quantile(x1,seq(0,1,0.1))
stem(x1)


#matrix
100:111
length(100:111)
(matrix(1, ncol=3, nrow=3))
(m1 = matrix(100:111, nrow=4))
(m2 = matrix(100:111, ncol=3, byrow=T))


x1=101:124
length(x1)
m3=matrix(x1, ncol=6)
class(m3)
attributes(m3)
dim(m3)
m3



#access element in matrix
m1
m1[1,];m1[,-1]
m1[1,2:3]
m1[c(1,3),]
m1
m1[,1,drop= F]
m1[,-c(1,3)]
m1[m1>105 & m1<108]



#name of cols rows
m1
paste("C","D", sep="_")
(colnames(m1) = paste('c' ,1:3, sep=''))
(rownames(m1) = paste('R',1:4, sep=''))
attributes(m1)
m1
m1[,c('c1','c3')]
#vector to matrix
(m3 = 1:24)
dim(m3) = c(6,4)
m3


m2
m2[1:5]
m2[c(TRUE,F,T,F),c(F,T,T)]


M2
m2
m2[2,2]
m2[2,2]=500
m2
m2[m2>107]=9999
m2
rbind(m2, c(50,60,70))
m2
cbind(m2, c(55,66,55,77))
cbind(m2,m2)
newm1=cbind(m2,m2)
newm1



# row col summary
m1
colSums(m1)
rowSums(m1)
colMeans(m1)
rowMeans(m1)

m1
t(m1)   #transpose
m1
sweep(m1, MARGIN=1, STATS = c(2,3,4,5),FUN = '+') # row wise
m1
sweep(m1, MARGIN=2, STATS = c(2,3,4),FUN = '+') # col wise


#addmargins
?addmargin
addmargins(m1, margin=1,sum)
addmargins(m1, margin=1,sd)

addmargins(m1, c(1,2),sum)  #row col wise 


# all in all----
addmargins(m1, c(1,2),list(list(mean,sum,max), list(var, sd)))
(m1sum=addmargins(m1, c(1,2),list(list(mean,sum,max), list(var, sd))))
round(m1sum,0)


#array----

length(100:123)
4*3*2
#2 coys,3 products, 4 locations sold qty
(a1 = array(100:123, dim=c(4,3,2)))



#dataframe----
# create vectors to be combined into DF
(rollno= 1:30)
(sname= paste('student',1:30,sep=''))
(gender= sample(c('M','F'), size=30, replace=T, prob=c(.7,.3)))
table(gender)
prop.table(table(gender))
(marks1= floor(rnorm(30,mean=50,sd=10))) # if value 3.6 it will take 3, if 3.2 take 3

(marks2= ceiling(rnorm(30,40,5))) # ceiling it give 4 in place of 3.2 
x=c(3.222,4.255)
round(x,1) #show till 1 decimal no
(course= sample (c('BBA','MBA'),size=30,replace=T, prob=c(.5,.5)))
rollno;sname;gender
marks1; marks2;course

#create DF
df1= data.frame(rollno, sname, gender, marks1, marks2,course,stringsAsFactors = F)
str(df1) #structure of DF
head(df1) # top 6 rows
tail(df1)
class(df1)
summary(df1)
nrow(df1)
length(df1)
df1$course  #if want to print one column
df1$gender= factor(df1$gender)
df1$course= factor(df1$course)
df1$rollno=as.character(df1$rollno)
str(df1)
summary(df1)
boxplot(marks1 ~ gender, data=df1)
boxplot(marks1 ~ gender + course, data=df1)



df1
head(df1[,c(2,4)])
df1[1:10 ,] #select rows, all columns
df1[1:5,1:4]
df1[marks1>50 & gender=='F',c(1,2)]
df1[marks1>50 & gender=='F',c('rollno','marks1')]



aggregate(df1$marks1, by=list(df1$gender),FUN=sum) #sum of marks as per gender
aggregate(marks1 ~ gender, data=df1, FUN=max)
(df2=aggregate(cbind(marks1,marks2) ~ gender + course, data=df1, FUN=mean))
df2
df1




#factors
(grades = sample(c('a','b','c','d'),size=30,replace=T, prob=c(.3,.2,.4,.1)))
summary(grades)
table(grades)
(gradesfactor = factor(grades))
summary(gradesfactor)

(gradesFactororderedLevels = factor(grades,ordered= T, levels=c('d','c','b','a')))


pie(summary(gradesFactororderedLevels))
barplot(summary(gradesFactororderedLevels),col=1:4) # col giving color


class(grades)
class(gradesFactororderedLevels)



