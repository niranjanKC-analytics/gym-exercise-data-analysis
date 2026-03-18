**Gym Exercise Data Analysis Using ANOVA and Regression in R**

**Executive Summary**

This project analyzes gym workout data to understand factors that influence exercise outcomes such as calories burned and workout session duration. Using statistical techniques including Analysis of Variance (ANOVA) and multiple linear regression in R, the analysis explores relationships between workout type, workout frequency, body composition variables, and performance metrics.

The goal of this project is to demonstrate how statistical modeling and exploratory data analysis can uncover meaningful insights from fitness and health data. These insights can help fitness professionals and training programs better understand the variables that contribute to workout effectiveness.

**Business Problem**

Fitness centers and health platforms collect large volumes of workout and physiological data from their users. However, this data is often underutilized and not fully analyzed to identify the factors that most strongly influence exercise performance and fitness outcomes.

Understanding how variables such as workout type, workout frequency, body composition, and heart rate metrics affect calorie expenditure and workout duration can help gyms, trainers, and fitness platforms design more effective training programs and personalized workout plans.

This project aims to identify key relationships within fitness data using statistical analysis techniques.

**Methodology**

The analysis was conducted using the following steps:

- Data cleaning and preprocessing in **R**
- Exploratory Data Analysis (EDA)
- Descriptive statistical analysis
- Analysis of Variance (**ANOVA**) to compare group differences
- Assumption checks for statistical testing
- **Kruskal-Wallis tests** where ANOVA assumptions were not satisfied
- Multiple **linear regression modeling**
- Model interpretation and prediction interval analysis

These methods allow us to evaluate both group differences and predictive relationships between workout variables and fitness outcomes.


**Skills**
**Programming**
- R
  
**Statistical Analysis**
- ANOVA
- Multiple Linear Regression
- Hypothesis Testing
- Nonparametric Testing (Kruskal-Wallis)

**Data Analysis**
- Exploratory Data Analysis (EDA)
- Descriptive Statistics
- Model Diagnostics

**Data Visualization**
- ggplot2
- Statistical visualization techniques

**Results & Practical Recommendations**

The statistical analysis revealed several important findings regarding workout behavior and exercise outcomes.

The results indicate that **workout type did not significantly affect calories burned**, suggesting that calorie expenditure may be more influenced by workout intensity and duration rather than the specific exercise category.

However, **workout frequency showed a statistically significant relationship with body fat percentage**, indicating that individuals who train more consistently tend to exhibit better body composition outcomes.

Regression modeling also demonstrated that **experience level and calories burned were strong predictors of workout session duration**, suggesting that more experienced gym members tend to sustain longer workout sessions and achieve greater energy expenditure.

These findings suggest that fitness programs should emphasize **training consistency and workout intensity** rather than focusing solely on specific workout types.


**Next Steps**

Future improvements to this project could include:

- Building an **interactive dashboard** for workout analytics
- Applying **machine learning models** to predict workout performance
- Expanding the dataset using **wearable fitness tracker data**
- Developing predictive models for **calorie expenditure and training outcomes**

These enhancements could help create more advanced analytics tools for fitness professionals and training platforms.

---

## Dataset

Gym Members Exercise Dataset

Source:  
https://www.kaggle.com/datasets/valakhorasani/gym-members-exercise-dataset
