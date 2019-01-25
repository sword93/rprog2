#### .=========.####
#### | [[ Day 3 ]] ####
#### .=========.####

#### 4. 통계 ####
#### __ [06] 분포 ####
#### _____ ● 확률 변수 ####

#### _____ ● 확률 분포 ####
# 이산 확률 분포

# 연속 확률 분포

#### _____ ● 확률 밀도 함수 ####

#### _____ ● 확률 밀도 함수 ####

#### _____ ● 누적 분포 함수 ####

#### _____ ● 누적 분포 함수 ####

#### _____ ● 분포의 종류 ####

#### _____ ● 정규 분포 ####

#### _____ ● 밀도 함수 ####
install.packages("ggplot2")
library("ggplot2")

norm_d = seq(-3,3,length.out = 200)
class(norm_d)
length(norm_d)
head(norm_d)

dnorm(x = 0)

ggplot() + 
  geom_line(aes(x = norm_d, 
                y = dnorm(norm_d)),
            size=2) +
  geom_line(aes(x = 0, 
                y = dnorm(x = 0)), 
            size=4,
            color="red")


ggplot() + 
  geom_line(aes(x = norm_d, 
                y = dnorm(norm_d)),
            size=2);



#### _____ ● 누적 분포 함수 ####
pnorm(q = 0)

ggplot() + 
  geom_line(aes(x = norm_d, 
                y = pnorm(norm_d)),
            size=2) +
  geom_line(aes(x = 0, 
                y = pnorm(q = 0)), 
            size=4,
            color="red")

#### _____ ● 분위수 함수 ####
qnorm(p = 0.5)

ggplot() + 
  geom_line(aes(x = norm_d, 
                y = dnorm(norm_d)),
            size=2) +
  geom_vline(xintercept = qnorm(p = 0.5), 
             size = 2,
             color="red")

#### _____ ● 난수 생성 ####
set.seed(123)
normal_d = rnorm(n = 1000)
head(normal_d)

ggplot() + 
?geom_point(...x) 



ggplot() + 
  geom_histogram(aes(x = normal_d),
                 bins = 100,
                 fill = "#FFFFFF",
                 color="#000000")


 


#### _____ ● 변동 계수 ####

#### _____ ● 관련 이론 ####

#### _____ ● 첨도 ####
#library("caret")
library("e1071")
kurtosis(rnorm(1000))
skewness(rnorm(1000))

for(n in 1:10) {
  nums = rnorm(10 * n)
  print(kurtosis(nums))
  print(skewness(nums))
  hist(nums)
  Sys.sleep(2)
}

?dbinom


#### _____ ● 관련 이론 ####

#### _____ ● 왜도 ####

#### _____ ● 관련 이론 ####

#### _____ ● 이항 분포 ####

#### _____ ● R 함수 ####
# 밀도 함수(Density Function)
dbinom(x = 1, size = 5, prob = 0.5)

ggplot() + 
  geom_col(aes(x = 1:20,
               y = dbinom(x = 1:20, size = 5, prob = 0.5)))

ggplot() + 
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size =  5, prob = 0.5)),
           color = "#AAAAAA", fill = "#225378", alpha = 0.6) +
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size = 10, prob = 0.5)),
           color = "#AAAAAA", fill = "#1695A3", alpha = 0.6) + 
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size = 15, prob = 0.5)),
           color = "#AAAAAA", fill = "#ACF0F2", alpha = 0.6) + 
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size = 20, prob = 0.5)),
           color = "#AAAAAA", fill = "#EB7F00", alpha = 0.6)

ggplot() + 
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size =  5, prob = 0.8)),
           color = "#AAAAAA", fill = "#225378", alpha = 0.6) +
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size = 10, prob = 0.8)),
           color = "#AAAAAA", fill = "#1695A3", alpha = 0.6) + 
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size = 15, prob = 0.8)),
           color = "#AAAAAA", fill = "#ACF0F2", alpha = 0.6) + 
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size = 20, prob = 0.8)),
           color = "#AAAAAA", fill = "#EB7F00", alpha = 0.6)

# 누적 분포 함수 (Cumulative Distribution Function)
pbinom(q = 1, size = 10, prob = 0.5)

ggplot() + 
  geom_line(aes(x = 1:20,
                y = pbinom(q = 1:20, size = 20, prob = 0.5)))

num_binom = data.frame(x = 1:20,
                       y_1 = pbinom(q = 1:20, size =  5, prob = 0.5),
                       y_2 = pbinom(q = 1:20, size = 10, prob = 0.5),
                       y_3 = pbinom(q = 1:20, size = 15, prob = 0.5),
                       y_4 = pbinom(q = 1:20, size = 20, prob = 0.5))

ggplot(data = num_binom, aes(x = x)) + 
  geom_col(aes(y = y_1),
           color = "#AAAAAA", fill = "#225378", alpha = 0.6) +
  geom_col(aes(y = y_2),
           color = "#AAAAAA", fill = "#1695A3", alpha = 0.6) +
  geom_col(aes(y = y_3),
           color = "#AAAAAA", fill = "#ACF0F2", alpha = 0.6) +
  geom_col(aes(y = y_4),
           color = "#AAAAAA", fill = "#EB7F00", alpha = 0.6)


# 분위수 함수 (Quantile Function)
qbinom(p = 0.5, size = 5, prob = 0.5)

ggplot() + 
  geom_line(aes(x = (0:10)/10,
                y = qbinom(p = (0:10)/10, size = 5, prob = 0.5)))

ggplot() + 
  geom_line(aes(x = (0:20)/20,
                y = qbinom(p = (0:20)/20, size =  5, prob = 0.5)),
            size = 1.3, color = "#225378") + 
  geom_line(aes(x = (0:20)/20,
                y = qbinom(p = (0:20)/20, size = 10, prob = 0.5)),
            size = 1.3, color = "#1695A3") + 
  geom_line(aes(x = (0:20)/20,
                y = qbinom(p = (0:20)/20, size = 15, prob = 0.5)),
            size = 1.3, color = "#ACF0F2") + 
  geom_line(aes(x = (0:20)/20,
                y = qbinom(p = (0:20)/20, size = 20, prob = 0.5)),
            size = 1.3, color = "#EB7F00")

# 난수 생성 (Random Number Generation)
num_binom = rbinom(n = 200, size = 10, prob = 0.5)

df = data.frame(obs = 1:200,
                num = rbinom(n = 200, size = 10, prob = 0.5))

ggplot(df, aes(x = as.factor(num))) + 
  geom_histogram(stat = "count")


#### _____ ● 기하 분포 ####
#### _____ ● R 함수 ####
geom_d = seq(0, 15, length.out = 200)

# 밀도 함수(Density Function)
dgeom(x = 1, prob = 0.5)

ggplot() + 
  geom_col(aes(x = 1:20,
               y = dgeom(x = 1:20, prob = 0.5)))

ggplot() + 
  geom_col(aes(x = 1:20, y = dgeom(x = 1:20, prob = 0.2)),
           color = "#AAAAAA", fill = "#225378", alpha = 0.6) +
  geom_col(aes(x = 1:20, y = dgeom(x = 1:20, prob = 0.4)),
           color = "#AAAAAA", fill = "#1695A3", alpha = 0.6) + 
  geom_col(aes(x = 1:20, y = dgeom(x = 1:20, prob = 0.6)),
           color = "#AAAAAA", fill = "#ACF0F2", alpha = 0.6) + 
  geom_col(aes(x = 1:20, y = dgeom(x = 1:20, prob = 0.8)),
           color = "#AAAAAA", fill = "#EB7F00", alpha = 0.6)


# 누적 분포 함수 (Cumulative Distribution Function)
pgeom(q = 1, prob = 0.5)

ggplot() + 
  geom_line(aes(x = 1:20,
                y = pgeom(q = 1:20, prob = 0.5)))

num_geom = data.frame(x = 1:20,
                      y_1 = pgeom(q = 1:20, prob = 0.2),
                      y_2 = pgeom(q = 1:20, prob = 0.4),
                      y_3 = pgeom(q = 1:20, prob = 0.6),
                      y_4 = pgeom(q = 1:20, prob = 0.8))

ggplot(data = num_geom, aes(x = x)) + 
  geom_col(aes(y = y_4),
           color = "#AAAAAA", fill = "#EB7F00", alpha = 0.6) +
  geom_col(aes(y = y_3),
           color = "#AAAAAA", fill = "#ACF0F2", alpha = 0.6) +
  geom_col(aes(y = y_2),
           color = "#AAAAAA", fill = "#1695A3", alpha = 0.6) +
  geom_col(aes(y = y_1),
           color = "#AAAAAA", fill = "#225378", alpha = 0.6)


# 분위수 함수 (Quantile Function)
qgeom(p = 0.5, prob = 0.5)

ggplot() + 
  geom_line(aes(x = (0:10)/10,
                y = qgeom(p = (0:10)/10, prob = 0.5)))

ggplot() + 
  geom_line(aes(x = (0:20)/20,
                y = qgeom(p = (0:20)/20, prob = 0.2)),
            size = 1.3, color = "#225378") + 
  geom_line(aes(x = (0:20)/20,
                y = qgeom(p = (0:20)/20,  prob = 0.4)),
            size = 1.3, color = "#1695A3") + 
  geom_line(aes(x = (0:20)/20,
                y = qgeom(p = (0:20)/20, prob = 0.6)),
            size = 1.3, color = "#ACF0F2") + 
  geom_line(aes(x = (0:20)/20,
                y = qgeom(p = (0:20)/20, prob = 0.8)),
            size = 1.3, color = "#EB7F00")

# 난수 생성 (Random Number Generation)
num_geom = rgeom(n = 200, prob = 0.5)

df = data.frame(obs = 1:200,
                num = rgeom(n = 200, prob = 0.5))

ggplot(df, aes(x = as.factor(num))) + 
  geom_histogram(stat = "count")


#### _____ ● 감마 분포 ####

#### _____ ● R 함수 ####
library("reshape2")

# 밀도 함수(Density Function)
dgamma(x = 1, shape = 10, rate = 5)
gamma_d = seq(0, 15, length.out = 200)

# 밀도 함수(Density Function)
dgamma(2, shape = 2, rate = 1)

ggplot() + 
  geom_line(aes(x = gamma_d,
                y = dgamma(gamma_d, shape = 10, rate = 5)),
            size = 2)

gamma_df = data.frame(num = gamma_d,
                      V1 = dgamma(gamma_d, shape = 10, rate = 1))
head(gamma_df)

for(n in 2:30){
  gamma_df[, paste0("V", n)] = dgamma(gamma_df$num, shape = 10, rate = n)
}
head(gamma_df)

gamma_df_melt = melt(gamma_df, id.vars = "num")
head(gamma_df_melt)

ggplot() + 
  geom_line(data = gamma_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")

##

gamma_df = data.frame(num = gamma_d,
                      V1 = dgamma(gamma_d, shape = 1, rate = 5))

for(n in 2:30){
  gamma_df[, paste0("V", n)] = dgamma(gamma_df$num, shape = n, rate = 5)
}

gamma_df_melt = melt(gamma_df, id.vars = "num")

ggplot() + 
  geom_line(data = gamma_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")


# 누적 분포 함수 (Cumulative Distribution Function)
pgamma(2, shape = 10, rate = 5)

ggplot() + 
  geom_line(aes(x = gamma_d,
                y = pgamma(gamma_d, shape = 2, rate = 1)),
            size = 2)

gamma_df = data.frame(num = gamma_d,
                      V1 = pgamma(gamma_d, shape = 10, rate = 1))
head(gamma_df)

for(n in 2:30){
  gamma_df[, paste0("V", n)] = pgamma(gamma_df$num, shape = 10, rate = n)
}
head(gamma_df)

gamma_df_melt = melt(gamma_df, id.vars = "num")
head(gamma_df_melt)

ggplot() + 
  geom_line(data = gamma_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) +
  theme(legend.position = "none")

# 분위수 함수 (Quantile Function)
qgamma(0.5, shape = 10, rate = 5)

gamma_num = seq(0, 1, length.out = 201)[-1]
head(gamma_num)

ggplot() + 
  geom_line(aes(x = gamma_num,
                y = qgamma(gamma_num, shape = 10, rate = 5)))

gamma_num_df = data.frame(num = gamma_num,
                          V1 = qgamma(gamma_num, shape = 10, rate = 1))
head(gamma_num_df)

for(n in 2:30){
  gamma_num_df[, paste0("V", n)] = qgamma(gamma_num, shape = 10, rate = n)
}
head(gamma_num_df)

gamma_num_df_melt = melt(gamma_num_df, id.vars = "num")
head(gamma_num_df_melt)

ggplot() + 
  geom_line(data = gamma_num_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")

##

gamma_num_df = data.frame(num = gamma_num,
                          V1 = qgamma(gamma_num, shape = 1, rate = 5))
head(gamma_num_df)

for(n in 2:30){
  gamma_num_df[, paste0("V", n)] = qgamma(gamma_num, shape = n, rate = 5)
}
head(gamma_num_df)

gamma_num_df_melt = melt(gamma_num_df, id.vars = "num")
head(gamma_num_df_melt)

ggplot() + 
  geom_line(data = gamma_num_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")

# 난수 생성 (Random Number Generation)
set.seed(345)
gamma_d_r = rgamma(200, shape = 10, rate = 5)
head(gamma_d_r)

ggplot() + 
  geom_histogram(aes(x = gamma_d_r),
                 bins = 50,
                 fill = "#FFFFFF",
                 color = "#000000")

gamma_d_r_15  = rgamma(200, shape = 15, rate = 5)
gamma_d_r_10 = rgamma(200, shape = 10, rate = 5)
gamma_d_r_5 = rgamma(200, shape = 5, rate = 5)

ggplot() + 
  geom_histogram(aes(x = gamma_d_r_15),
                 bins = 25,
                 fill = "#99CCFF",
                 color = "#000000") + 
  geom_histogram(aes(x = gamma_d_r_10),
                 bins = 25,
                 fill = "#44BB44",
                 color = "#000000",
                 alpha = 0.4) +
  geom_histogram(aes(x = gamma_d_r_5),
                 bins = 25,
                 fill = "#FFAACC",
                 color = "#000000",
                 alpha = 0.4) 

##

gamma_d_r_15  = rgamma(200, shape = 5, rate = 5)
gamma_d_r_10 = rgamma(200, shape = 5, rate = 10)
gamma_d_r_5 = rgamma(200, shape = 5, rate = 15)

ggplot() + 
  geom_histogram(aes(x = gamma_d_r_15),
                 bins = 25,
                 fill = "#99CCFF",
                 color = "#000000") + 
  geom_histogram(aes(x = gamma_d_r_10),
                 bins = 25,
                 fill = "#44BB44",
                 color = "#000000",
                 alpha = 0.4) +
  geom_histogram(aes(x = gamma_d_r_5),
                 bins = 25,
                 fill = "#FFAACC",
                 color = "#000000",
                 alpha = 0.4) 


#### _____ ● 카이제곱 분포 ####
#### _____ ● R 함수 ####
# 밀도 함수(Density Function)
dchisq(x = 1, df = 2)
chisq_d = seq(0, 50, length.out = 200)

# 밀도 함수(Density Function)
dchisq(2, df = 2)

ggplot() + 
  geom_line(aes(x = chisq_d,
                y = dchisq(chisq_d, df = 2)),
            size = 2)

chisq_df = data.frame(num = chisq_d,
                      V1 = dchisq(chisq_d, df = 1))
head(chisq_df)

for(n in 2:30){
  chisq_df[, paste0("V", n)] = dchisq(chisq_df$num, df = n)
}
head(chisq_df)

chisq_df_melt = melt(chisq_df, id.vars = "num")
head(chisq_df_melt)

ggplot() + 
  geom_line(data = chisq_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")

# 누적 분포 함수 (Cumulative Distribution Function)
pchisq(2, df = 2)

ggplot() + 
  geom_line(aes(x = chisq_d,
                y = pchisq(chisq_d, df = 2)),
            size = 2)

chisq_df = data.frame(num = chisq_d,
                      V1 = pchisq(chisq_d, df = 1))
head(chisq_df)

for(n in 2:30){
  chisq_df[, paste0("V", n)] = pchisq(chisq_df$num, df = n)
}
head(chisq_df)

chisq_df_melt = melt(chisq_df, id.vars = "num")
head(chisq_df_melt)

ggplot() + 
  geom_line(data = chisq_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")

# 분위수 함수 (Quantile Function)
qchisq(0.5, df = 2)

chisq_num = seq(0, 1, length.out = 201)[-1]
head(chisq_num)

ggplot() + 
  geom_line(aes(x = chisq_num,
                y = qchisq(chisq_num, df = 2)))

chisq_num_df = data.frame(num = chisq_num,
                          V1 = qchisq(chisq_num, df = 1))
head(chisq_num_df)

for(n in 2:30){
  chisq_num_df[, paste0("V", n)] = qchisq(chisq_num, df = n)
}
head(chisq_num_df)

chisq_num_df_melt = melt(chisq_num_df, id.vars = "num")
head(chisq_num_df_melt)

ggplot() + 
  geom_line(data = chisq_num_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")

# 난수 생성 (Random Number Generation)
set.seed(345)
chisq_d_r = rchisq(200, df = 2)
head(chisq_d_r)

ggplot() + 
  geom_histogram(aes(x = chisq_d_r),
                 bins = 50,
                 fill = "#FFFFFF",
                 color = "#000000")

chisq_d_r_15  = rchisq(200, df = 15)
chisq_d_r_10 = rchisq(200, df = 10)
chisq_d_r_5 = rchisq(200, df = 5)
head(chisq_d_r_5)

ggplot() + 
  geom_histogram(aes(x = chisq_d_r_15),
                 bins = 25,
                 fill = "#99CCFF",
                 color = "#000000") + 
  geom_histogram(aes(x = chisq_d_r_10),
                 bins = 25,
                 fill = "#44BB44",
                 color = "#000000",
                 alpha = 0.4) +
  geom_histogram(aes(x = chisq_d_r_5),
                 bins = 25,
                 fill = "#FFAACC",
                 color = "#000000",
                 alpha = 0.4)

#### _____ ● 스튜던트 t 분포 ####

#### _____ ● R 함수 ####
t_d = seq(-15, 15, length.out = 200)

# 밀도 함수(Density Function)
dt(2, df = 2)

ggplot() + 
  geom_line(aes(x = t_d,
                y = dt(t_d, df = 2)),
            size = 2)

t_df = data.frame(num = t_d,
                  V1 = dt(t_d, df = 1))
head(t_df)

for(n in 2:30){
  t_df[, paste0("V", n)] = dt(t_df$num, df = n)
}
head(t_df)

t_df_melt = melt(t_df, id.vars = "num")
head(t_df_melt)

ggplot() + 
  geom_line(data = t_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")

# 누적 분포 함수 (Cumulative Distribution Function)
pt(2, df = 2)

ggplot() + 
  geom_line(aes(x = t_d,
                y = pt(t_d, df = 2)),
            size = 2)

t_df = data.frame(num = t_d,
                  V1 = pt(t_d, df = 1))
head(t_df)

for(n in 2:30){
  t_df[, paste0("V", n)] = pt(t_df$num, df = n)
}
head(t_df)

t_df_melt = melt(t_df, id.vars = "num")
head(t_df_melt)

ggplot() + 
  geom_line(data = t_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")
  

# 분위수 함수 (Quantile Function)
qt(0.5, df = 2)

t_num = seq(0, 1, length.out = 201)[-1]
head(t_num)

ggplot() + 
  geom_line(aes(x = t_num,
                y = qt(t_num, df = 2)))

t_num_df = data.frame(num = t_num,
                      V1 = qt(t_num, df = 1))
head(t_num_df)

for(n in 2:30){
  t_num_df[, paste0("V", n)] = qt(t_num, df = n)
}
head(t_num_df)

t_num_df_melt = melt(t_num_df, id.vars = "num")
head(t_num_df_melt)

ggplot() + 
  geom_line(data = t_num_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")

# 난수 생성 (Random Number Generation)
set.seed(345)
t_d_r = rt(200, df = 2)
head(t_d_r)

ggplot() + 
  geom_histogram(aes(x = t_d_r),
                 bins = 50,
                 fill = "#FFFFFF",
                 color = "#000000")

t_d_r_2  = rt(200, df = 2 )
t_d_r_15 = rt(200, df = 15)
t_d_r_30 = rt(200, df = 30)
head(t_d_r_30)

ggplot() + 
  geom_histogram(aes(x = t_d_r_2),
                 bins = 25,
                 fill = "#99CCFF",
                 color = "#000000") + 
  geom_histogram(aes(x = t_d_r_15),
                 bins = 25,
                 fill = "#44BB44",
                 color = "#000000",
                 alpha = 0.4) +
  geom_histogram(aes(x = t_d_r_30),
                 bins = 25,
                 fill = "#FFAACC",
                 color = "#000000",
                 alpha = 0.4) 

#### __ [07] 이상치/결측치 ####
#### _____ ● 이상치 ####

#### _____ ● 이상치 처리 절차 ####

#### _____ ● 이상치 확인 - 택스트 ####
set.seed(1228)
df = data.frame(xx = 1:200,
                yy = rnorm(n = 200, mean = 5, sd = 3))
head(df)

# 하위 3개 값 추출
df[order(df$yy), "yy"][1:3]
head(df[order(df$yy), "yy"],3)

df[order(df$yy)[1:3], ]

# 상위 3개 값 추출
df[order(df$yy), "yy"][198:200]
df[order(df$yy), "yy"][200:198]

df[order(-df$yy), "yy"][1:3]
df[order(df$yy, decreasing = TRUE), "yy"][1:3]
head(df[order(-df$yy), "yy"], 3)
tail(df[order(df$yy), "yy"], 3)
rev(tail(df[order(df$yy), "yy"], 3))

# 하위 3개 값의 row 추출
df[df$yy %in% df[order(df$yy), "yy"][1:3], ]
df[order(df$yy)[1:3], ]

# 상위 3개 값의 row 추출
df[df$yy %in% df[order(-df$yy), "yy"][1:3], ]
df[order(-df$yy)[1:3], ]

# 하위 3개 값의 row 추출

# 분위수 활용
 
quantile(df$yy ,probs=0.95)

df[df$yy > quantile(df$yy ,probs=0.95), ]

#### _____ ● 이상치 확인 - 시각화 ####
boxplot(rbind(df, 
               data.frame(xx = c(30, 50, 84),
                          yy = c(35, 40, 39))))

#### _____ ● 결측치 ####

#### _____ ● 결측치 확인 ####
# 데이터 준비
data("Orange")
head(Orange)

set.seed(1228)
df = as.matrix(Orange)
# NA를 일부러 넣는다.
df[sample(1:(nrow(df) * ncol(df)), size = 10)] = NA
df = as.data.frame(df)
head(df, 3)


# 벡터 연산 
df[is.na(df$Tree),]
df[is.na(df$age),]

df[is.na(df$Tree)|is.na(df$age),]
df[is.na(df$Tree)&is.na(df$age),]



# Q. row 에 결측치가 2개 이상인  row를  df_na 라는 뽑아서 라는 객체에 저장하시오
#  사용자 함수 
na2_fun = function(x) {
  for(n in 1:ncol(x)) {
     x[ ,n]
  }
}

# ( 풀이 1)
for(n in 1:ncol(df)) {
  df[ , paste0("col_na_", n)] = ifelse( is.na(df[, n]), 1, 0)
}

# ( 풀이 1-1)  
df[, "na_cnt"]=apply(X=df[, 5:8], MARGIN = 1, FUN="sum")
df_na = df[df$na_cnt >= 2, ]
df_na


# ( 풀이 1-2)
df[, "na_cnt"] = rowSums(df[ , grep(pattern = "^col",colnames(df))])
df_na = df[df$na_cnt >= 2, ]
df_na
                       


#### 3
df[, "na_cnt"] = apply(X = df, MARGIN = 1, FUN = function(x) { sum(is.na(x))} )
df_na = df[df$na_cnt >= 2, ] 
df_na


df_na = df[ (is.na(df$Tree) +  is.na(df$age) + is.na(df$circumference))  >= 2  ,]
df_na

# 결측치 관련 새로운 변수
df[, "na_count"] = is.na(df$Tree) +  is.na(df$age) + is.na(df$circumference);
df_na2 = df[ df$na_count>= 2, ]
df_na2

# summary()
summary(df)

#### __ [08] 가설 검정 Ⅱ ####
#### _____ ● 비율 검정 ####

#### _____ ● 관련 수식 ####

#### _____ ● 비율 검정 ####
aa = c(15, 16)
bb = c(20, 26)
#-----   비율이 같은지 같지 않은지 알아보자 
prop.test(aa, bb)

result = prop.test(aa, bb)
class(result)
str(result) # structure
names(result)

result$p.value
result$statistic


prop.test(aa*10, bb*10)

#### 
# 귀무가설 : 다르다고 할수 있다.
# 귀무가설을 기각할수 없다. (P 값이 0.05 보다 큰 경우)


#### _____ ● 상관 계수의 정의 ####

#### _____ ● 상관 계수의 특징 ####

#### _____ ● 공분산의 정의 ####

#### _____ ● 개요 ####

#### _____ ● 관련 수식 ####

#### _____ ● 공분산 예제 ####

#### _____ ● 상관계수 검정 ####
# 데이터 준비
set.seed(53779)
aa = runif(100)
bb = runif(100)

# 두 집단의 상관계수 계산
## EXAM 
cor.test(aa, bb)
cor(aa,bb)

result = cor.test(aa, bb)
names(result)
result$estimate

#### _____ ● 상관 행렬 ####
# 데이터 준비
bike = read.csv("bike.csv", stringsAsFactors = FALSE)

head(bike)


# 상관 행렬의 생성
cor_matrix = cor(bike[ , 2:9])


install.packages("PerformanceAnalytics")
#PerformanceAnalytics::
#### _____ ● 상관 행렬의 시각화 ####
install.packages("corrplot")
library("corrplot")

corrplot(cor_matrix, method = "color", addCoef.col = TRUE,
         order = "hclust", hclust.method = "ward.D",
         outline = TRUE, tl.srt = 45)

#####  EXAM 
install.packages("GGally")
library("ggplot2")
library("GGally")


data("flea", package="GGally")
flea
ggpairs(flea, columns = 2:4)
ggpairs(flea, columns = 2:4, aes(color = species))

#### _____ ● 예제 ####


#### _____ ● 쉬어가기 ####

#### _____ ● 상관과 인과 ####

#### _____ ● 정규성 검정 ####

#### _____ ● Z-score #####

#### _____ ● 표준화 #####

#### _____ ● 각종 정규성 검정 ####
install.packages("nortest")
library("nortest")

z = rnorm(100)
z = z[rep]

ad.test(z) # Anderson-Darling normality test

cvm.test(z) # Crammer-von Mises normality test

lillie.test(z)

pearson.test(z)

sf.test(z)

shapiro.test(z)

shapiro.test(runif(100))

#### _____ ● Kolmogorov Smirnov 의 적합도 검정 ####

#### _____ ● Kolmogorov Smirnov 의 적합도 검정 ####
x = rnorm(50); y = rnorm(50); z = runif(50)

ks.test(x, y)
ks.test(x, z)
ks.test(y, z)


#### _____ ● 등분산 검정 ####

#### _____ ● F-검정 ####
a = c(61, 60, 56, 63, 56, 69, 59, 56, 40, 61)
b = c(70, 54, 40, 55, 51, 61, 57, 54, 21, 20)

var.test(a, b)

# Q1. a와 b를 시각화 하여 비교하시오.

# Q2. 귀무가설을 기술하시오.

#### _____ ● t-검정 ####
set.seed(123)
t.test(x = rnorm(300), mu = 0)
#### _____ ● 단일표본 t-검정 ####

#### _____ ● 단일표본 t-검정 ####

#### _____ ● 대응표본 t-검정 ####

set.seed(1234)
aa = rnorm(100, mean = 5, sd = 4)
bb = rnorm(100, mean = 8, sd = 4)
t.test(x = aa, y = bb, paired = TRUE)

t.test(x = aa, y = bb, paired = FALSE)

?cor.test
#### _____ ● 대응표본 t-검정 ####

#### _____ ● 독립표본 t-검정 ####

#### _____ ● 독립표본 t-검정 ####


#### _____ ● 분산 분석 ####

#### _____ ● F-분포 ####

#### _____ ● 분산분석의 종류 ####

#### _____ ● 일원 분산분석 ####

#### _____ ● 일원 분산분석 예제 ####
data("diamonds", package = "ggplot2")
head(diamonds, 2)

dd = aov(data = diamonds, price ~ cut)
summary(dd)

options(scipen = 3)

round(2.13e-3, 3)
round(2.13e-3, 7)

2.15e-6

## 사후  검정  ,  사후검정,  사후 검증 , 사후 검정 
install.packages("agricolae")
library("agricolae")

agricolae::
  
duncan.test(dd, "cut",console = TRUE)
# d < c < b < a
# Ideal < Good = Very Good < Fair < Premium


#### _____ ● 이원 분산분석 ####
dd = aov(data = diamonds, price ~ cut + clarity)
summary(dd)
#### _____ ● 이원 분산분석 예제 ####


#### 5. 탐색적 데이터 분석 ####
#### __ [01] 기본 데이터 분석 ####

#### _____ ● 데이터의 이해 ####
data("diamonds", package = "ggplot2")

#### _____ ● 요약 통계량 ####

#### _____ ● aggregate() 함수 예제 ####
aggregate(data = iris, Sepal.Length ~ Species, FUN = "mean")

aggregate(data = iris, Sepal.Length ~ Species, FUN = function(x){round(mean(x)^2, 2) } )

head(iris)

#### _____ ● 데이터의 분할 ####


#### _____ ● cut() 함수 예제 ####
df = data.frame(obs = 1:100,
                nums = runif(100))


class(df$bin)
class(df$obs)

df$bin[1]

head(df, 3)
?runif


df[, "bin"] = cut(df$nums, breaks = seq(0, 1, by = 0.05))
head(df, 3)

#### _____ ● cut() + left_join() ####
sapply(df, "class")

df$bin[1]
# 20 개 
df_class = data.frame(class=levels(df$bin),
                      class_num = 1:20)
head(df_class, 10)

library("dplyr")
df_join = left_join(x = df, y = df_class, by = c("bin" = "class"))

#### __ [02] 단변량 데이터 분석 ####
#### _____ ● 개요 ####

#### _____ ● 변수의 속성에 따른 접근 ####


#### __ [03] 다변량 데이터 분석 ####
#### _____ ● 개요 ####

#### _____ ● 다차원 정보의 표현 ####


#### __ [04] 실전 예제 ####
#### _____ ● 개요 ####

#### _____ ● 목표 ####
