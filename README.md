Pulitzer Prize Investment & Newspaper Circulation
Statistical Modelling Project in R
1. Project Overview

This project explores how investment in investigative journalism (measured by Pulitzer Prizes won) influences long-term newspaper circulation. Using historical circulation data, I built a linear regression model to forecast future circulation under three strategic scenarios.

Completed as part of my Postgraduate Certificate in Applied Data Science.

2. Objectives

Model the relationship between Pulitzer Prizes and newspaper circulation

Apply transformations to stabilise variance and meet model assumptions

Evaluate model fit and perform full diagnostics

Generate circulation predictions with 90% prediction intervals

Provide scenario-based recommendations for management

3. Data Summary

The dataset includes:

avg_circ — average circulation

prizes — Pulitzer Prizes won

log(avg_circ) used to stabilise variance

Three investment scenarios were analysed:

3 prizes (low investment)

25 prizes (current investment)

50 prizes (high investment)

4. Methods
Exploratory Analysis

Scatterplot of prizes vs log-circulation

Identified a positive but nonlinear relationship

Determined log-transformation improved linear fit

Model Building

Final model:

log(avg_circ) ~ prizes


Diagnostics checked:

Linearity

Homoscedasticity

Normality of residuals

Influence and leverage

Model Performance

Strong linear fit after log-transformation

Residual patterns acceptable

Model appropriate for prediction

5. Key Findings
Effect of Pulitzer Prizes

More Pulitzer Prizes are associated with higher circulation

The relationship is multiplicative (due to log transform)

Predictions (Back-Transformed)

90% prediction intervals:

3 prizes: ~236k to 309k

25 prizes: ~324k to 418k

50 prizes: ~426k to 642k

Interpretation

Low or medium investment scenarios remain below current circulation

High investment (50 prizes) is the only scenario where circulation could realistically grow rather than decline

Suggests that strong investigative journalism may maintain the newspaper’s reputation and readership

6. Tools & Packages

R, RStudio

tidyverse, ggplot2

broom, dplyr

7. Repository Structure
/scripts          R scripts for cleaning, modelling, and prediction
/report.pdf       Full written analysis
README.md         Project overview

8. How to Run This Project

Install required packages (tidyverse).

Open the modelling script.

Run data transformation, model fitting, and predictions.

View the report for full interpretation.
