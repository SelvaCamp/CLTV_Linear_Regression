# CLV_Customer_Lifetime_Value
##Predict the CLTV for a company through the relation of its customers. We have a dataset year1 with 15 variables, which will be used to build the model, and the dataset year2 to make the predictions for the interest variable, **future margin**.

###Correlation for the year1 plot 

![Rplot_Correlation](https://github.com/SelvaCamp/CLTV_Linear_Regression/assets/158846801/abaa33c9-1db3-47ae-8db0-875d414b0929)]

###The coefficient estimate for margin is 0.65, which means that the higher the margin in year 1 the higher we expect the future margin to be on year 2.
The multiple R-square is 0.32, so 30% of the variation in the future margin is explained by the margin in year 1.

###Visualization future margin and margin

![Rplot](https://github.com/SelvaCamp/CLTV_Linear_Regression/assets/158846801/0a4f46fa-d9f5-4f91-a5fe-385d1b88117d)]

###Regression model

####We build a regression model with the following variables margin, nItems, daysSinceLastOrder, returnRatio, shareOwnBrand, shareVoucher, shareSale, marginPerOrder to predict the future margin on the data of year2.

![Final Model](https://github.com/SelvaCamp/CLTV_Linear_Regression/assets/158846801/37b1932b-ab74-4393-b52b-ea05933b0de1)]


####The mean of the expected future margin on the year 2 is 33.
