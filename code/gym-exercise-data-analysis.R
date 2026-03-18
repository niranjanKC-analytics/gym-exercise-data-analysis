
# Team Project Deliverable 2 - Section 4: Comparing Multiple Means (ANOVA Tests)
# Author: Niranjan K C
# Date: Apr 18, 2025
# Description: This script performs two ANOVA tests with proper assumption checks, visualizations,
# and standardized result reporting using the gym dataset.

# ======================
# Load required packages
# ======================
library(tidyverse)   # For data manipulation and visualization
library(ggpubr)      # For easy ggplot2-based plots
library(rstatix)     # For assumption testing and ANOVA functions
library(readr)       # For reading CSV data

# ======================
# Load cleaned dataset
# ======================
setwd("/Users/niranjankc/Desktop/CIS328/Group Project/Project2")

data <- read_csv("gym_members_exercise_tracking_cleaned.csv")  # Load dataset
View(data)  # View dataset in table format

# ===============================
# ANOVA Test 1: Calories Burned by Workout Type
# ===============================

# Descriptive statistics
# Group by workout type and compute mean and standard deviation of calories burned
data %>%
  group_by(Workout_Type) %>%
  get_summary_stats(Calories_Burned, type = "mean_sd")

# Boxplot to visualize Calories_Burned by Workout_Type
ggboxplot(data, x = "Workout_Type", y = "Calories_Burned", fill = "skyblue")

# Check for outliers in each group
data %>%
  group_by(Workout_Type) %>%
  identify_outliers(Calories_Burned)

# Outliers were identified in each group (e.g., Strength, HIIT),
# but most were not marked as extreme. 
# So the outlier assumption is reasonably met.

# Normality check using Shapiro-Wilk test on ANOVA model residuals
model1 <- lm(Calories_Burned ~ Workout_Type, data = data)
shapiro_test(residuals(model1))  # Residuals not normally distributed (p < 0.001)
ggqqplot(residuals(model1))  # Visual check of normality assumption (points fairly along the line)

# The p-value from Shapiro-Wilk test is 0.0000243 (< 0.05),
# indicating the residuals are not normally distributed.
# However, the QQ plot shows data points are fairly aligned 
# with the reference line, so we can proceed with caution.

# Homogeneity of variance using Levene’s test
data %>% levene_test(Calories_Burned ~ Workout_Type)  # Assumption met (p = 0.789)

# Run one-way ANOVA
anova1 <- anova_test(data = data, dv = Calories_Burned, between = Workout_Type)
anova1  # Not significant (p = 0.416), so no post-hoc test needed

# Post-hoc test using Tukey's HSD (still run to show no significant pairwise difference)
pwc1 <- data %>% tukey_hsd(Calories_Burned ~ Workout_Type)
pwc1

# Standardized Reporting
# A one-way ANOVA was conducted to compare calories burned across different workout types.
# The results showed no statistically significant difference in calories burned among the workout types,
# F(3, 969) = 0.949, p = 0.416.
# Tukey’s post hoc test indicated that none of the group comparisons were statistically significant.

# ===============================
# ANOVA Test 2: Fat Percentage by Workout Frequency
# ===============================

# Descriptive statistics
data %>%
  group_by(Workout_Frequency..days.week.) %>%
  get_summary_stats(Fat_Percentage, type = "mean_sd")

# Boxplot visualization
ggboxplot(data, x = "Workout_Frequency..days.week.", y = "Fat_Percentage", fill = "orchid")

# Check for outliers
data %>%
  group_by(Workout_Frequency..days.week.) %>%
  identify_outliers(Fat_Percentage)

# Normality check using Shapiro-Wilk test on residuals of ANOVA model
model2 <- lm(Fat_Percentage ~ Workout_Frequency..days.week., data = data)
shapiro_test(residuals(model2))  # p < 0.001 (not normal)
ggqqplot(residuals(model2))  # Data roughly follows the line, assumption met visually

# Note: Shapiro-Wilk test showed p < 0.001, but QQ plot suggests normality assumption is approximately met.

# Convert predictor to factor for Levene's test
data$Workout_Freq_Factor <- as.factor(data$Workout_Frequency..days.week.)

# Homogeneity of variance check using Levene’s test
data %>% levene_test(Fat_Percentage ~ Workout_Freq_Factor)  # p = 7.27e-30 (assumption violated)

# The Levene’s test p-value is 7.27e-30 (< 0.05),
# indicating that the assumption of equal variances is not met.
# We can proceed with caution or consider data transformation if needed.

# Run ANOVA
anova2 <- anova_test(data = data, dv = Fat_Percentage, between = Workout_Frequency..days.week.)
anova2

# Post-hoc Tukey HSD test
pwc2 <- data %>% tukey_hsd(Fat_Percentage ~ Workout_Freq_Factor)
pwc2

# Standardized Reporting
# A one-way ANOVA was conducted to examine the effect of workout frequency on body fat percentage.
# The analysis showed a significant effect of workout frequency on fat percentage,
# F(3, 969) = 211.52, p < 0.001.
# Tukey’s HSD post hoc test revealed significant differences between the following groups:
#  - 2 vs. 4 days/week (p < 0.001)
#  - 2 vs. 5 days/week (p < 0.001)
#  - 3 vs. 4 days/week (p < 0.001)
#  - 3 vs. 5 days/week (p < 0.001)
#  - 4 vs. 5 days/week (p < 0.001)
# However, no significant difference was found between 2 and 3 days/week (p = 0.986).

# ======================
# End of Script
# ======================
