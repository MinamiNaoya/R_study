library(ggplot2)
sample_count <- 8
cat("Enter integer data, separated by spaces:\n")
# 吸光度の入力
new_absorbance <- scan(file = stdin(), n = sample_count)
new_absorbance
df <- data.frame(absorbance = new_absorbance, sulfa_concentration = c(0, 1, 2, 4, 6, 8, 12, 16))
df

# 最小二乗法で回帰直線y=mx+bのmとbを求める。

# Fit a linear regression model
model <- lm(absorbance ~ sulfa_concentration, data = df)

# Get the slope and intercept coefficients
m <- coef(model)[2]
b <- coef(model)[1]

# Print the coefficients
cat("傾き (m) =", m, "\n")
cat("切片 (b) =", b, "\n")

# Plot the scatter plot of the data 散布図
p <- ggplot(df, aes(x = sulfa_concentration, y = absorbance)) +
  geom_point() +
  xlab("Sulfa Concentration") +
  ylab("Absorbance")

# Add the regression line to the plot
p + geom_smooth(method = "lm", se = FALSE, color = "blue") +
  geom_text(x = 1.5, y = 0.8, label = paste0("y = ", round(m, 7), "x + ", round(b, 7)), color = "blue")

