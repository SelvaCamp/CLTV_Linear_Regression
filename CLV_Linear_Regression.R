

#Importing libraries

library(tidyverse)
library(ggplot2)
library(rms)
library(MASS)

#Importing datasets

clvyear1=read.csv("clvData1.csv")

str(clvyear1, give.attr=FALSE)

#Let's visualize the correlation of the selected variables

library(corrr)

clvyear1%>%
  select(where(is.numeric))%>%
  correlate()%>%
  shave()%>%
  rplot(print_cor=TRUE)+
  theme(axis.text.x=element_text(angle=90, hjust=1))


#Let's visualize our predicted variable futureMargin and the variable margin

ggplot(clvyear1, aes(margin, futureMargin))+
  geom_point()+
  geom_smooth(method = "lm", se=FALSE)+
  xlab("Margin")+
  ylab("futureMargin or predicted")

#Let's build a simple liner regression

simplemodel=lm(futureMargin~margin, data=clvyear1)

summary(simplemodel)

#Let's build a multiple regression

multiplemodel=lm(futureMargin~margin+nOrders+nItems+daysSinceLastOrder+returnRatio+shareOwnBrand+shareVoucher+shareSale+gender+age+marginPerOrder+marginPerItem+itemsPerOrder, data = clvyear1)

summary(multiplemodel)


#Let's see the Variance Inflation Factor to avoid multicollinearity

vif(multiplemodel)



#Let's check overfitting

AIC(multiplemodel)

stepAIC(multiplemodel)

#Final multiple linear regression model

finalmultimodel=lm(futureMargin ~ margin + nItems + daysSinceLastOrder + returnRatio + 
                     shareOwnBrand + shareVoucher + shareSale + marginPerOrder, data = clvyear1)

summary(finalmultimodel)

#Let's test our final model to the new data

#Importing dataset

clvyear2=read.csv("clvData2.csv")

head(clvyear2)


predmargin=predict(finalmultimodel, newdata = clvyear2)

head(predmargin)

#Let's calculate the mean of the expected future margin for the year 2

mean(predmargin, na.rm = TRUE)

