##########################Calculating R0 from Data###############################

# to roughly etimate R0 can calculate through the log of the cumulative incidence values

#1. plot cumulative cases graph

#2. plot the log of the cumulative graph to identify linear section
plot(log(cum.cases.italy$Cases) ~ cum.cases.italy$Date, type = 'l', col = 'steelblue4')

#3. R0 approximation
#section of cumulative graph that is linear
subset <- cum.cases.italy[c(31:62), ]
#fit a linear regression to calculate slope
fit_subset <- lm(I(log(subset$Cases)) ~ subset$Date) 
slope <- as.numeric(fit_subset$coefficients[2])
#Re=(1+ΛD)(1+ΛD′) #D: 5 #D': 5.2 preinfectious period
Re = (1 + slope * 5) * (1 + slope * 5.2)
#proportion susceptible: total population of italy minus people who have already had COVID by the time log grap;h is linear
s = (68000000-20)/68000000 
R0 = Re/s



