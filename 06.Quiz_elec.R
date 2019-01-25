df = fread("elec_load.csv", data.table = FALSE)
head(df)

#### Q1. ####
# (1-1) 전기소비가 가장 많은 날짜를 기술하시오
df[, "sum_day"] = apply(df[, 4:27], MARGIN = 1, FUN = "sum")
df[df$sum_day == max(df$sum_day), ]
# 2017월 1월 4일

# (1-2) 전기소비가 가장 많은 달은?
#  ※ 예시: 2019년 1월
df_agg = aggregate(data = df, sum_day ~ YEAR + MONTH, FUN = "sum")
df_agg[df_agg$sum_day == max(df_agg$sum_day), ]
# 2017년 1월  

# (1-3) 전기 소비가 가장 많은 시간대를 주중/주말로 나누어서 알아보시오.
#       (단, 평균값을 기준으로 계산한다.)
library("reshape2")
### -ncol 은 제외 .. 
df_melt = melt(data = df[, -ncol(df)], id.vars = c("YEAR", "MONTH", "DAY"))
df_melt[, "date"] = as.Date(paste(df_melt$YEAR,
                                  df_melt$MONTH,
                                  df_melt$DAY, sep = "-"))
head(df_melt)

library("lubridate")
df_melt[, "wday"] = lubridate::wday(df_melt$date, week_start = 1)
tail(df_melt)

df_melt_wday = df_melt[df_melt$wday <= 5, ]
df_melt_wend = df_melt[df_melt$wday >  5, ]

df_melt_wday_agg = aggregate(data = df_melt_wday, value ~ variable, FUN = "mean")
df_melt_wday_agg[which.max(df_melt_wday_agg$value), ]

df_melt_wend_agg = aggregate(data = df_melt_wend, value ~ variable, FUN = "mean")
df_melt_wend_agg[which.max(df_melt_wend_agg$value), ]


#### Q2. ####
# (2-1) 일 전기 소비의 차이가 가장 많이 나는 날은?
#  ※ 예시: 2019년 1월 1일
head(df_melt)

df_split = split(df_melt[, c("date", "variable", "value")], f = df_melt$date)
df_split[1:2]

load_diff = function(x){
  df_x = data.frame(date = x[1, "date"],
                    diff = max(x[, "value"]) - min(x[, "value"]))
  return(df_x)
}

df_split = lapply(df_split, FUN = "load_diff")

library("dplyr")
df_bind = bind_rows(df_split)
head(df_bind)

df_bind[which.max(df_bind$diff), ]
# 2016년 7월 23일

#### Q3. ####
# (3-1) 주중과 주말의 일별 전기소비량의 평균차이가 있는지 알아보시오.
head(df_melt_wday)
head(df_melt_wend)

df_wday = aggregate(data = df_melt_wday, value ~ date, FUN = "sum") 
df_wend = aggregate(data = df_melt_wend, value ~ date, FUN = "sum") 
t.test(df_wday$value, df_wend$value)

# (3-2) 요일별 전기소비량의 평균차이가 있는지 알아보시오.
df_date = aggregate(data = df_melt, value ~ date, FUN = "sum")
df_date[, "wday"] = lubridate::wday(df_date$date, week_start = 1)
head(df_date)

model = aov(data = df_date, value ~ wday)
summary(model)

# (3-3) (3-2)의 모델을 기반으로 사후검정을 실시하고 그 결과를 확인하시오.
library("agricolae")
duncan.test(model, trt = "wday", console = TRUE)


# 로지스틱 회귀 분석 :binomial 이항연산 0 / 1
# t.test 는 언제하는지 ? 
##서로 독립된 두 집단간의 평균 또는 비율이 서롤 차이가 있는지 확인
### 귀무가설 : 두 집단간의 평균은 차이가 없다. 
### ==> p 0.05 이하 ... 기각안됨. (차이없다.)

# aov 는 언제하는지 ?
## 분산분석은 서로 독립된 집단이 셋 이상인 경우,
## 집단간의 평균이 서로 차이가 있는지 확인 
### ==> p 0.05 이하 ... 기각안됨. (적어도 하나 이상의 집단은 차이없다.)

#####################################################################################
#####################################################################################
#####################################################################################
#####################################################################################





























#### Q1. ####
library("data.table")
df = read.csv("elec_load.csv", encoding = "UTF-8")
head(df)

# (1-1) 전기소비가 가장 많은 날짜를 기술하시오
df_sub_col = df[, 4:ncol(df)]
head(df_sub_col)

df[ , "day_sum"] = apply(X=df_sub_col, MARGIN=1,FUN="sum")
head(df)

df_umaxday = df[order(-df$day_sum), ]
df_umaxday[1, c("YEAR", "MONTH", "DAY")]
head(df_umaxday)

2017년 1월 4일

# (1-2) 전기소비가 가장 많은 달은?
#  ※ 예시: 2019년 1월
?aggregate

df_umax = aggregate(data= df, day_sum ~ YEAR + MONTH , FUN="sum")

df_umax = df_umax[order(-df_umax$day_sum), ]
head(df_umax, 10)

(답)2017, 1

# (1-3) 전기 소비가 가장 많은 시간대를 주중/주말로 나누어서 알아보시오.
#       (단, 평균값을 기준으로 계산한다.)

# ?weekdays
df_date = paste0(df$YEAR, sep="-", df$MONTH, sep="-", df$DAY )
df_date = as.Date(df_date)
df [ , "df_date"] = df_date

head(df, 10)
day_levels <- c("월요일", "화요일", "수요일", "목요일", "금요일", "토요일","일요일")
# as.numeric(weekdays((df_date))
weekdays(as.Date("2017-1-7"))
df_dayofweek = weekdays(df$df_date)

as.numeric(factor(df_dayofweek, levels=day_levels, ordered=TRUE))
df[ , "day_of_week"] = as.numeric(factor(df_dayofweek, levels=day_levels, ordered=TRUE))

df_weekday = df[df$day_of_week < 6, 4:(ncol(df)-4)]
head(df_weekday, 3)

df_weakday_max = apply(X=df_weekday , MARGIN=2, FUN="sum")
df_weakday_max = as.data.frame(df_weakday_max)
rownames(df_weakday_max)
colnames(df_weakday_max)


df_weekend = df[df$day_of_week > 5, 4:(ncol(df)-4)]
head(df_weekend, 3)
df_weekend_max = apply(X=df_weekend , MARGIN=2, FUN="sum")
max(df_weekend_max)


#### Q2. ####
# (2-1) 일 전기 소비의 차이가 가장 많이 나는 날은?
#  ※ 예시: 2019년 1월 1일

df[ , "day_diff"] = apply(X=df_sub_col, MARGIN=1, FUN="max")- apply(X=df_sub_col, MARGIN=1, FUN="min")
head(df, 10)

df = df[order(-df$day_diff), ]
head(df[, c(1:3, ncol(df))], 3)

(답)(2016. 7. 23)


#### Q3. ####
# (3-1) 주중과 주말의 일별 전기소비량의 평균차이가 있는지 알아보시오.
df_weekday[, "average"] = apply(X=df_weekday, MARGIN=1, FUN="mean") 

df_weekend[, "average"] = apply(X=df_weekend, MARGIN=1, FUN="mean") 


# (3-2) 요일별 전기소비량의 평균차이가 있는지 알아보시오.

# (3-3) (3-2)의 모델을 기반으로 사후검정을 실시하고 그 결과를 확인하시오.

Duncan.test





