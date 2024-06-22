#LOAD THE DATASET
setwd("C:/Users/GARIMA BANSAL/Downloads")
data=read.csv("R.csv")
View(data)

#Model
model=glm(data$treatment~data$Age+data$Gender+data$family_history+data$work_interfere+data$benefits+data$care_options+data$leave+data$mental_health_consequence+data$coworkers+data$obs_consequence,family='binomial')
summary(model)


#predict treatment using model
glm.predict.treatment= predict(model,data,type='response')


#convert predicted values into 0 and 1
data$predict.treatment= ifelse(glm.predict.treatment>0.5,1,0)


#determine accuracy of model
accuracy=mean(data$predict.treatment==data$treatment)
accuracy
