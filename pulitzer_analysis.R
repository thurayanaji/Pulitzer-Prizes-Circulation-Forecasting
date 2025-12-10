library(tidyverse) 
#location of file   
setwd("C:/Users/PC/Downloads") 
# Load the dataset 
pulitzer <- read_csv("pulitzer.csv") 
view(pulitzer) 
# Recode change_0413 from strings to integer percentages 
pulitzer <- pulitzer %>% 
mutate( 
change_0413_num = change_0413 %>% 
str_replace("%", "") %>%   # remove % sign 
as.integer()                           # convert to integer 
) 
head(pulitzer)
pulitzer <- pulitzer %>%  
mutate( 
  avg_circ = (circ_2004 + circ_2013) / 2) 
pulitzer %>% 
  select(newspaper, circ_2004, circ_2013, avg_circ) %>% 
  head() 
# Summary statistics 
summary(pulitzer$avg_circ) 
# Histogram 
ggplot(pulitzer, aes(x= avg_circ,)) + 
geom_histogram(color= "black", fill= "lightblue") +  
labs(title = "Histogram of Average Circulation", 
x = "Average Circulation", 
y = "Count")
# Boxplot 
ggplot(pulitzer, aes(y = avg_circ)) + 
geom_boxplot(fill = "lightblue") + 
labs(title = "Boxplot of Average Circulation", 
y = "Average circulation") 
# Summary statistics 
summary(pulitzer$change_0413_num)
# Histogram 
Median      Mean      3rd Qu.      Max.  -32.50       -29.20       -20.00       
67.00  
ggplot(pulitzer, aes(x= change_0413_num,)) + 
geom_histogram(color= "black", fill= "lightblue") +  
labs(title = "Histogram of Change in Circulation (2004–2013)", 
x = "Change in circulation (%)", 
y = "Count")
# Boxplot 
ggplot(pulitzer, aes(y = change_0413_num)) + 
geom_boxplot(fill = "lightblue") + 
labs(title = "Boxplot of Change in Circulation (2004–2013)", 
y = "Percentage change (%)") 
# Try log transform for avg_circ 
ggplot(pulitzer, aes(x = log(avg_circ))) + 
geom_histogram(color = "black", fill = "lightblue") + 
labs(title = "Histogram of log(Average Circulation)", 
x = "log(Average circulation)")
# Linear model: log average circulation ~ prizes 
model1 <- lm(log(avg_circ) ~ prizes_9014, data = pulitzer) 
summary(model1) 
# Model 2: Predicting change in circulation 
model2 <- lm(change_0413_num ~ prizes_9014, data = pulitzer) 
summary(model2)
# Standard diagnostic plots for model1 
par(mfrow = c(2, 2)) 
plot(model1) 
# Reset plotting 
par(mfrow = c(1, 1))
# Standard diagnostic plots for model2 
par(mfrow = c(2, 2)) 
plot(model2) 
par(mfrow = c(1, 1))
new_prizes <- tibble( 
prizes_9014 = c(3, 25, 50) 
) 
# Predict log(avg_circ) 
pred_circ_log <- predict(model1, newdata = new_prizes) 
# Convert back to circulation scale 
pred_circ <- exp(pred_circ_log) 
pred_circ
# Three scenarios 
new_prizes <- tibble( 
prizes_9014 = c(3, 25, 50) 
) 
# Predict change in circulation 
pred_change <- predict(model2, newdata = new_prizes) 
pred_change 
pred_circ_ci <- predict(model1, 
newdata = new_prizes, 
interval = "confidence", 
level = 0.90) 
pred_circ_ci <- as_tibble(pred_circ_ci) 
pred_circ_ci <- pred_circ_ci %>% 
mutate( 
fit = exp(fit), 
lwr = exp(lwr), 
upr = exp(upr) 
) 
results_4_3 <- bind_cols(new_prizes, pred_circ_ci) 
results_4_3 
pred_change_pi <- predict(model2, 
newdata = new_prizes, 
interval = "prediction", 
level = 0.90) 
pred_change_pi <- as_tibble(pred_change_pi) 
results_4_4 <- bind_cols(new_prizes, pred_change_pi) 
results_4_4 
