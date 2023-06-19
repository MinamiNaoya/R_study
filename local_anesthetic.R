install.packages("mice")
library(mice) # 多重代入法に用いる

duration_time <- c(4, 7, 3, 2, 2, 4, 5, 2, NA, 2, 4, 6, 3, 7)
start_time <- c(3, 3, 3, 5, 1, 5, 1, 3, NA, 3, 5, 2, 3, 3)
df = data.frame(発現時間=start_time, 持続時間=duration_time)
df

df_miced <- mice(df, m=20 , method = "pmm", seed=14) # 再現性のために乱数シードを設定
paste("発現時間の補完値は、", df_miced$imp$発現時間[20]) # 20回目のイテレーションでの値を補完値として採用
paste("持続時間の補完値は、", df_miced$imp$持続時間[20])
