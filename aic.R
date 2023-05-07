x <- 1:20
y <- x + rnorm(length(x), 0, 1)
plot(x, y)
res <- lm(y ~ x)
abline(res)
summary(res)

y[c(1, 5)] <- c(20, 18)
plot(x, y)
res_outlier <- lm(y ~ x)
abline(res_outlier)
summary(res_outlier)


res2 <- lm(dist ~ speed + I(speed^2), data = cars) 
summary(res2)
res3 <- poly(speed, 2, raw=TRUE)

plot(cars)
lines(cars$speed, fitted(res2))


res1 <- lm(dist ~ speed, data=cars)
res2 <- lm(dist ~ poly(speed, 2, raw=TRUE), data=cars)
res3 <- lm(dist ~ poly(speed, 3, raw=TRUE), data=cars)
res4 <- lm(dist ~ poly(speed, 4, raw=TRUE), data=cars)


summary(res1)$r.squared; summary(res1)$adj.r.squared
summary(res2)$r.squared; summary(res2)$adj.r.squared
summary(res3)$r.squared; summary(res3)$adj.r.squared
summary(res4)$r.squared; summary(res4)$adj.r.squared

AIC(res1, res2, res3, res4)

res02 <- lm(dist ~ poly(speed, 2, raw=TRUE) -1, data=cars)
summary(res02)

AIC(res02)

x <- seq(-5, 5, length=1000)
y <- seq(0.1, 8, length=1000)
z <- outer(x, y, function(x, y) x^2/(2*y^2)+log(y)+(1/y^2+1))

contour(x, y, z, levels=seq(0.01, 3, by=0.5))

x <- seq(0, 1, length=5)
y <- seq(1, 2, length=5)
z <- outer(x, y, function(x, y) x^2 + y^2)
x
y
z
