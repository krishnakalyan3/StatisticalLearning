require(ISLR)
require(MASS)
names(Smarket)
summary(Smarket)
?Smarket
pairs(Smarket,col=Smarket$Direction)
glm.fit=glm(Direction ~ Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
            data=Smarket,
            family=binomial)
summary(glm.fit)
glm.probs=predict(glm.fit,type="response")
glm.probs[1:5]
glm.pred=ifelse(glm.probs>.5,"Up","Down")
attach(Smarket)
table(glm.pred,Direction)
mean(glm.pred==Direction)
train = Year < 2005
glm.fit=glm(Direction ~ Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
            data=Smarket,subset=train,
            family=binomial)
glm.probs= predict(glm.fit,newdata=Smarket[!train,],type="response")
glm.pred=ifelse(glm.probs>.5,"Up","Down")
Direction.2005=Smarket$Direction[!train]
table(glm.pred,Direction.2005)
mean(glm.pred==Direction.2005)

# Fitting a smaller Model
glm.fit=glm(Direction ~ Lag1+Lag2,
            data=Smarket,subset=train,
            family=binomial)
glm.probs= predict(glm.fit,newdata=Smarket[!train,],type="response")
glm.pred=ifelse(glm.probs>.5,"Up","Down")
table(glm.pred,Direction.2005)
mean(glm.pred==Direction.2005)
summary(glm.fit)

# Linear Discriminant Analysis
lda.fit = lda(Direction ~ Lag1+Lag2,data=Smarket,subset = Year<2005)
lda.fit
plot(lda.fit)
Smarket.2005 =subset(Smarket,Year==2005)
lda.pred=predict(lda.fit,Smarket.2005)
lda.pred[1:5,]
class(lda.pred)
data.frame(lda.pred)[1:5,]
table(lda.pred$class,Smarket.2005$Direction)
mean(lda.pred$class==Smarket.2005$Direction)

# K nearset Neighbours
library(class)
?knn
Xlag = cbind(Lag1,Lag2)
train=Year<2005
Xlag[1:5,]
knn.pred = knn(Xlag[train,],Xlag[!train,],Direction[train],k=3)
table(knn.pred,Direction[!train])
mean(knn.pred==Direction[!train])

?lda
