library(DAAG)


head(trees)
plot(trees)

# 相間行列の計算
cor(trees)

# GirthとHeightを説明変数、Volumeを被説明変数として回帰している。
res <- lm(Volume ~ Girth + Height, data = trees)
summary(res)

# volumeの対数を被説明変数、Girthの対数を説明変数としている。
res_VG <- lm(log(Volume) ~ log(Girth), data = trees)
summary(res_VG)

# 変数log(Height)を追加して回帰する。
res_VGH <- update(res_VG, ~ . + log(Height), data = trees)
summary(res_VGH)


# AICを用いて2つのモデルを比較
AIC(res_VG, res_VGH)


# res_VGに対してvifを考える。
vif(res_VGH)
# vif(res_VGH)の計算方法
res_check <- lm(log(Girth) ~ log(Height), data = trees)
summary(res_check)

# multiple R-squaredを取り出して、1から引きトレランスを求める。
tolerance = 1 - summary(res_check)$r.squared
vif = 1 / tolerance
cat(vif)

#Simulate multicollinearity

x1 <- rnorm(100, 100, 1)
x2 <- rnorm(100, 50, 1)
x3 <- x1 + x2 + rnorm(100, 0, 0.0001)

z <- 5*x1 + 10*x2 + 20*x3 + rnorm(100, 0, 0.1)
res_test <- lm(z ~ x1 + x2 + x3)
summary(res_test)
summary(res_test)

vif(res_test)
# vifが大きい値になっている。