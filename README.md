# MiniHack ( ML ) 
3 hour ML Data Hack {classification problem} (EDA SCRIPT)</br></br>
<b>Aim</b>: The aim of this competition is to build a predictive model on training data, which could help Company A in predicting the surge_pricing_type pro-actively.</br></br>
<b>My Methodology </b>: Simple 4 step solution</br> 
1. Performing EDA</br>
2. Dealing With Missing Values and Selecting Features </br>
3. Developing Algorithm and making predictions </br>
4. Validating Predictions</br><hr>
### Step 1 : EDA 
Loading required libraries ..
```r
library(ggplot2)
```
Reading training data
```r
train<- read.csv("train.csv")
str(train) # 14 variables 1 ID and 1 outcome variable Surge_pricing_type .. 
```
Plotting Some Basic Graphs ...

```r
# Type of cab Vs Surge Pricing Type ... 
ggplot(data=train,aes(x= as.factor(train$Type_of_Cab)))+
  geom_bar(stat = "count",aes(fill = as.factor(Surge_Pricing_Type)))+
  labs(x= "Type of Cab",y="Count",fill = "Surge Price Type",title="Type of cab Vs Surge Price Type")
```  
![rplot03](https://cloud.githubusercontent.com/assets/7979139/23835276/a5c4d2e8-0721-11e7-85da-ec4fb4f269e8.png)

```r
# Printing Missing Values In Every Coloumn ...
z<- sum(is.na(train)) #97143 missing values ... 
for(k in c(1:14))
{
  z[k] = sum(is.na(train[,k]))
  print(paste(colnames(train)[k], ":", z[k]))
}
```
[1] "Trip_ID : 0"</br>
[1] "Trip_Distance : 0"</br>
[1] "Type_of_Cab : 0"</br>
[1] "Customer_Since_Months : 5920"</br>
[1] "Life_Style_Index : 20193"</br>
[1] "Confidence_Life_Style_Index : 0"</br>
[1] "Destination_Type : 0"</br>
[1] "Customer_Rating : 0"</br>
[1] "Cancellation_Last_1Month : 0"</br>
[1] "Var1 : 71030"</br>
[1] "Var2 : 0"</br>
[1] "Var3 : 0"</br>
[1] "Gender : 0"</br>
[1] "Surge_Pricing_Type : 0"</br>

```r
# Trip Distance ...
ggplot(data = train,aes(as.factor(train$Surge_Pricing_Type),train$Trip_Distance))+
  geom_boxplot(color = "black",fill = "orange",alpha= .6)+
  labs(x= "Surge Pricing Type",y="Trip Distance")+
  stat_summary(fun.y = mean,geom = "point")
```
![rplot02](https://cloud.githubusercontent.com/assets/7979139/23835278/aea9dc78-0721-11e7-857a-0a1a04cb4764.png)

```r
# Customer Rating Vs Type of Cab ... 
ggplot(data = train,aes(as.factor(train$Type_of_Cab),train$Customer_Rating))+
  geom_boxplot(color = "black",fill = "blue",alpha= .6)+
  labs(x= "Type of Cab",y="Customer rating")+
  stat_summary(fun.y = mean,geom = "point")+
  ggtitle("Avg Numer Of Customer Rating")
```
![rplot01](https://cloud.githubusercontent.com/assets/7979139/23835280/b33dfb16-0721-11e7-8e0a-5ab6b123359f.png)

```r
# Customer Analysis
ggplot(data=train,aes(as.factor(train$Customer_Since_Months)))+
  geom_bar(stat = "count",aes(fill = as.factor(train$Cancellation_Last_1Month)))+
  labs(x="Cutomer since Month",fill="cancelation last month")+
  facet_wrap(~train$Gender)+
  ggtitle("Customer Analysis")
  ```

![rplot](https://cloud.githubusercontent.com/assets/7979139/23835282/b9e7a9f8-0721-11e7-9651-d27f315b1417.png)


