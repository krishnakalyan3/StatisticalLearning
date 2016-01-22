## Chapter 2

x = c(2,7,5)
x
y = seq(4,length=3,by=3)
y
?seq
x + y
x/y
x^y
x[2]
x[2:3]
x[-2]
x[c(1,2)]
x = matrix(seq(1,12),4,3)
x 
x[3:4,2:3]
x[,1]
x[,1,drop=FALSE]
dim(x)
ls()
rm(y)
rm(list=ls())

# Graphics and Random Data
x = runif(50) 
y = rnorm(50)
plot(x,y)
plot(x,y,xlab="Random Uniform",ylab="Random Normal",pch="*",col="blue")
par(mfrow=c(1,2))
plot(x,y)
hist(y)

# Reading Data
# Auto = read.csv(file.choose())
Auto = read.csv("/Users/krishna/MOOC/ElemStat/Auto.csv")
summary(Auto)
dim(Auto)
class(Auto)
names(Auto)
plot(Auto$cylinders,Auto$mpg)
par(mfrow=c(1,1))
attach(Auto)
mpg
search()
Auto$cyl
cylinders = as.factor(cylinders)
plot(cylinders,mpg)
