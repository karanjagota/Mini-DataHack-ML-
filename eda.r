# MAchine Learning Classification Problem EDA script ... 

library(ggplot2)

train<- read.csv("train.csv") # 131662 observations ... 

str(train) # 14 variables 1 ID and 1 outcome variable Surge_pricing_type .. 

#--- xxxxxxx-----------EDA -------------------------------


# Type of cab Vs Surge Pricing Type ... 
ggplot(data=train,aes(x= as.factor(train$Type_of_Cab)))+
  geom_bar(stat = "count",aes(fill = as.factor(Surge_Pricing_Type)))+
  labs(x= "Type of Cab",y="Count",fill = "Surge Price Type",title="Type of cab Vs Surge Price Type")

# Printing missing values in every coloumn ...
z<- sum(is.na(train)) #97143 missing values ... 
for(k in c(1:14))
{
  z[k] = sum(is.na(train[,k]))
  print(paste(colnames(train)[k], ":", z[k]))
}

# trip Distance ...
mean(train$Trip_Distance) # 44.20

ggplot(data = train,aes(as.factor(train$Surge_Pricing_Type),train$Trip_Distance))+
  geom_boxplot(color = "black",fill = "orange",alpha= .6)+
  labs(x= "Surge Pricing Type",y="Trip Distance")+
  stat_summary(fun.y = mean,geom = "point")

# Customer Rating Vs Type of Cab ... 

ggplot(data = train,aes(as.factor(train$Type_of_Cab),train$Customer_Rating))+
  geom_boxplot(color = "black",fill = "blue",alpha= .6)+
  labs(x= "Type of Cab",y="Customer rating")+
  stat_summary(fun.y = mean,geom = "point")+
  ggtitle("Avg Numer Of Customer Rating")

# Customer Analysis
table(train$Customer_Since_Months,train$Cancellation_Last_1Month)

ggplot(data=train,aes(as.factor(train$Customer_Since_Months)))+
  geom_bar(stat = "count",aes(fill = as.factor(train$Cancellation_Last_1Month)))+
  labs(x="Cutomer since Month",fill="cancelation last month")+
  facet_wrap(~train$Gender)+
  ggtitle("Customer Analysis")

  
  
