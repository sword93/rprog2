#### 1. ####
# (1-1) "life_expectancy.csv" 파일을 fread() 함수로 읽어와서
#       df 객체에 저장하시오. (단, 데이터프레임으로 읽어온다.)
df = fread("life_expectancy.csv", data.table = FALSE)
head(df, 2)

# (1-2) 두 번째, 세 번째, 네 번째 변수를 제외한 나머지를
#       df_sub 객체에 저장하시오.
# 방법 1)
df_sub = df[, c(1, 5:ncol(df))]
df_sub = df[, c(-2, -3, -4)]
df_sub = df[, -2:-4]
df_sub = df[, -(2:4)]
head(df_sub, 2)

# (1-3) Country Name 변수를 기준으로 melt() 함수를 사용하시오.
#       그 결과를 df_sub_melt 객체에 저장하시오
library("reshape2")
df_sub_melt = melt(data = df_sub, id.vars = "Country Name")
head(df_sub_melt)

# (1-4) df_sub_melt 객체의 변수명을 "name_en", "year", "pop"으로
#       차례대로 바꾸시오.
colnames(df_sub_melt) = c("name_en", "year", "pop")
head(df_sub_melt)

# (1-5) df_sub_melt 객체를 fwrite() 함수를 사용하여 저장하시오.
#       ※ 파일명은 "life_expectancy_melt.csv"로 한다.
fwrite(df_sub_melt, "life_expectancy_melt.csv")


# (2-1) "life_expectancy_melt.csv" 파일을 읽어와서 df 객체에 저장하시오.
df = fread("life_expectancy_melt.csv", data.table = FALSE)

# (2-2) df 객체의 year 변수의 숫자를 제외한 나머지를 제거하시오
head(df)
# 방법 1)
df[, "year"] = gsub(pattern = "[^0-9]", replacement = "", x = df$year)

# 방법 2)
df[, "year"] = substr(df$year, start = 2, stop = 5)

# (2-3) df 객체의 year 변수의 속성을 확인하시오
class(df$year)

# (2-4) df 객체의 year 변수의 속성을 숫자로 변환하시오.
df[, "year"] = as.numeric(df$year)
class(df$year)
head(df)

# (2-5) df 객체의 각 변수의 결측치 개수를 확인하시오.
# 논리값의 이해.
# is.na()
sum(is.na(df$name_en))
sum(is.na(df$year))
sum(is.na(df$pop))

for(n in 1:ncol(df)){
  print(sum(is.na(df[, n])))
}

summary(df)

apply(X = df, MARGIN = 2, FUN = function(x){sum(is.na(x))})
sapply(X = df, FUN = function(x){sum(is.na(x))})


# (2-6) pop 변수에 결측치가 있는 행을 제거하여 df_omit 객체에 저장하시오.
df_omit = df[is.na(df$pop) == FALSE, ]
df_omit = df[is.na(df$pop) != TRUE, ]
df_omit = df[is.na(df$pop) == 0, ]
df_omit = df[is.na(df$pop) != 1, ]

df_omit = na.omit(df)

!TRUE
!FALSE

# (2-7) df_omit 객체의 각 변수의 결측치 개수를 확인하시오.
summary(df_omit)
sapply(df_omit, FUN = function(x){sum(is.na(x))})

