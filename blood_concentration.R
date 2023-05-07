library(scales)
# Calibration_curve.R or Calibration_curve2.R を実行後に実行
source("Calibration_curve.R")

sample_count <- 6
elapsed_time <- c(0, 15, 30, 60, 90, 120)

# 薬物投与後の血液の吸光度
blood_absorbance <- scan(file = stdin(), n = sample_count)

df2 = data.frame(absorbance = blood_absorbance, elapsed_time = elapsed_time)
df2

concentration = array()
real_concentration = array()
# 吸光度から濃度に変換 y=mx+b
absorbance_to_concentration = function(blood_absorbance, slope, intercept)
    concentration <- (blood_absorbance - intercept)/slope


for (i in 1:sample_count) {
  concentration[i] <- absorbance_to_concentration(blood_absorbance[i], slope = m, intercept = b)
  
  # 単位変換μg/mlからmg/dL,希釈倍率50倍を戻す。
  real_concentration[i] <- concentration[i] / 10 * 50
}
cat(real_concentration, "\n")

df3 <- data.frame(concentration=real_concentration, elapsed_time = elapsed_time)
df3

# マイナスの血中濃度の切り捨て
df3$concentration[df3$concentration < 0] <- NaN
df3


# Create the plot
p2 <- ggplot(df3, aes(x = elapsed_time, y = concentration)) +
  geom_point() + 
  labs(x = "Elapsed Time(t)", y = "Concentration(mg/dl)") 

p2 + scale_y_log10(breaks=c(0.01, 0.1, 1, 10, 100))
  

p2 + geom_smooth(se = FALSE, color = "blue", breaks=c(0.01, 0.1, 1, 10, 100))
