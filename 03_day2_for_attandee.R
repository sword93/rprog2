#### .=========.####
#### | [[ Day 2 ]] ####
#### .=========.####

#### 2. 데이터의 취득과 전처리 ####
#### __ [05] 다양한 함수의 활용 ####
#### _____ ● Pivoting ####
#### _____ ● 데이터 준비 ####
install.packages("reshape2")
library("reshape2")
# sample(x=1:10, size=4)
# Random Seed 
set.seed(123)
df = data.frame(Obs = 1:4,
                A = sample(10:99, size = 4),
                B = sample(10:99, size = 4),
                C = sample(10:99, size = 4))
df


#### _____ ● Pivoting - melt() ####
df_melt = melt(data = df, id.vars = "Obs",
               variable.name = "Group", value.name = "Count")
head(df_melt)
#### _____ ● Pivoting - melt() ####
## ~ 모양인  formula 에서만 사용 
dcast(data = df_melt, formula = Obs ~ Group, value.var = "Count")

#acast(data = df_melt, formula = Obs ~ Group, value.var = "Count")

data(iris)
colnames(iris)
t(colnames(iris))
# 한번 더 전치를 해준다 ???
t(t(colnames(iris)))


library("data.table")

df = fread("life_expectancy.csv", data.table = FALSE)
head(df, 2)

colnames(df)

t(t(colnames(df)))


df[, "kr"] = ifelse(test = df$aa!= 1, yes="oh!", no="no!")

#### _____ ● Pivoting - cast() ####
#### _____ ● Pivoting - cast() ####

#### _____ ● Pivoting - t() ####

#### _____ ● 반복문 대체 ####

#### _____ ● 반복문 대체 - ifelse() ####
#### _____ ● 반복문 대체 - ifelse() ####
df = data.frame(aa = 1:2, 
                bb = c("a", "b"))
df

#### _____ ● ifelse() 예제 ####
df[, "new"] = ifelse(tst = df$aa!= 1, yes="oh!", no="no!")


df[, "kr"] = ifelse(tst = df$aa!= 1, yes="oh!", no="no!")

# ▶ rating_ramyun.csv 데이터를 불러와 df 객체로 저장
# ▶ ifelse() 함수를 활용하여 “kr”이라는 변수를 df 객체에 새로 생성
# ▶ “kr” 변수에는 Country 변수값이 남한(South Korea)인 경우 1을, 그 이외의 값일 경우 0이 기록되도록 하시오.
df = fread("life_expectancy.csv", data.table = FALSE)
class(df)
head(df, 2)
colnames(df)
t(t(colnames(df)))


df[, "kr"] = ifelse(test = df$Country == "South Korea", yes=1, no=0)
df_table = table(df[,c("Country", "kr")])
df_table = as.data.frame(df_table)
head(df_table)

df[df$`Country Name`="South Korea",]


data("iris")
head(iris)
df = head(iris[, 1:4])
df

#### _____ ● 반복문 대체 - apply() ####

apply(X = df, MARGIN=1, FUN="sum")
#### _____ ● 반복문 대체 - apply() ####
# 데이터 준비 

df_subject=fread("class_scores.csv", stringsAsFactors=FALSE)
head(df_subject)

score = head(df_subject[, 5:9])
score = head(df_subject[, 5:ncol(df_subject)])
score
#### _____ ● apply() 예제 ####
# ▶ apply() 함수를 활용하여 class_score.csv의 학생 시험성적 평균점수를 구하시오.
#df=fread("class_scores.csv", stringsAsFactors=FALSE)
df=read.csv("class_scores.csv", stringsAsFactors = FALSE)
head(df)

df_sub = df[, 5:ncol(df)]
head(df_sub)

#df_sub_id = df[, 1]

#df_apply_mean = apply(X = df_sub, MARGIN=1, FUN="mean")
df_apply_mean = apply(X = df_sub, MARGIN=2, FUN="mean")

head(df_apply_mean)

#df_apply_max  = apply(X = df_sub, MARGIN=1, FUN="max")
df_apply_max  = apply(X = df_sub, MARGIN=2, FUN="max")
head(df_apply_max)

#df_apply_min  = apply(X = df_sub, MARGIN=1, FUN="min")
df_apply_min  = apply(X = df_sub, MARGIN=2, FUN="min")
head(df_apply_min)

df_subject = data.frame(subject= colnames(df_sub),
                        mean = df_apply_mean,
                        max  = df_apply_max,
                        min  = df_apply_min)
head(df_subject)




# ▶ 과목별 평균점수, 최고점, 최저점을 구해서 df_subject 라는 데이터프레임 객체에 정리하시오.


#### _____ ● 반복문 대체 - sapply() ####
#sapply()
#sapply()
#### _____ ● 반복문 대체 - sapply() ####

#### _____ ● Join ####
# Left Join

# Inner Join

#### _____ ● 데이터 준비 ####
source("data_generator_join.R", encoding = "UTF-8")
head(df_room)
head(df_list)

#### _____ ● Join - 내장 함수 ####
# Left Join

# Inner Join


#### _____ ● Join - SQL 문법 ####
library("sqldf")

# Left Join
install.packages("sqldf")
library("sqldf")

sqldf("SELECT * FROM df_list LEFT JOIN df_room ON df_list.member = df_room.name")

# Inner Join


#### _____ ● Join - dplyr 패키지 ####
install.packages("dplyr")
library("dplyr")

left_join(x=df_list, y=df_room, 
          by= c("member"="name"))

inner_join(x=df_list, y=df_room, 
            by = c("member"="name"))

## help 에   도움됨
vignette("dplyr")

# Left Join

# Inner Join

#### _____ ● dplyr 패키지 ####
# filter() - 조건 기반 행추출
# summerize() - 각 변수의 요약정보 생산
# group_by() - 행 그룹화
# mutate() - 기존 변수를 기반으로 새로운 변수 생산
# arrange() - 하나 또는 그 이상의 변수 정렬
# join() - "키"변수를 기준으로 두 데이터 세트 병합


#### _____ ● magrittr 패키지 ####

#### _____ ● 파이프 연산자 실습 ####
install.packages("magrittr")
library("magrittr")
text = "asdf1234!@#$"

text %>% 
  gsub(pattern="[^0-9]", replacement = "") %>%
  as.numeric() %>%
  .[] + 3000 -> result

text %>% 
  gsub(pattern="[^0-9]", replacement = "") %>%
  as.numeric() %>%
  `+`(3000) -> result

result <- text %>% 
  gsub(pattern="[^0-9]", replacement = "") %>%
  as.numeric() %>%
  .[] + 3000 


text = gsub(pattern="[^0-9]", replacement = "", x = text)
text = as.numeric(text)
result = text + 3000


result = as.numeric(gsub(pattern = "[^0-9]", replacement = "", x = text)) + 3000
result


test = head(iris)
test

colnames(test)[1] = "col name"
test

test[, "col name"]
test$`col name`
colnames(test)[1] = "col_name"


#### 3. 통계 ####

mean(c(1:3, NA, 23))
## add na.rm  parameter 
mean( c(1:3, NA, 23), na.rm = TRUE)
mean( c(1:3, NA, 23), na.rm = T)

## 안먹힘 
mean(c(1:3, "사과", 23))
mean(c(1:3, "사과", 23), na.rm=TRUE)

#### __ [01] 들어가며 ####

#### _____ ● 개요 ####

#### _____ ● 표본 ####

#### _____ ● 사건 ####

#### _____ ● 확률 ####


#### __ [02] 통계량 ####
#### _____ ● 통계량의 정의 ####

#### _____ ● 평균 - mean() ####
# 산술 평균

# 기하 평균

# 결측치가 포함되어 있는 값의 평균 계산

# na.rm 파라미터 추가

# 글자가 포함되어 있는 값의 평균 계산

# na.rm 파라미터 추가

#### _____ ● 중앙값 - median() ####

#### _____ ● 최빈값 ####
mode = function(x){
  ux = unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

mode(c(1, 1, 1, 2, 3, 4, 4))


set.seed(123)
dd = sample(1:10, size=30, replace=TRUE)
dd_table = as.data.frame(table(dd))
dd_table = dd_table[dd_table$Freq != 5, ]


## 같은 결과를 내기 위해서 설정 




#### _____ ● 분산과 표준편차 - var(), sd() ####

#### _____ ● 통계량의 함정 ####
# https://github.com/stephlocke/datasauRus

library("ggplot2")
library("datasauRus")

#### __ [03] 가설검정 Ⅰ ####
#### _____ ● 용어 정리 ####
# ▶ 가설 검정: 모집단의 특성에 대한 특정 가설 설정 후 표본을 관찰하여 해당 가설의 채택 여부를 결정하는 방법
# ▶ 귀무가설(영가설, Null Hypothesis, 𝐻_0): 기존에 알려진 사실
# ▶ 대립가설(연구가설, Alternative Hypothesis, 𝐻_1): 연구를 통해 밝히고자 하는 가설
# ▶ 유의 수준(𝛼): 제 1종 오류를 범할 확률의 최대 허용치
# ▶ p-value: 귀무가설이 맞다는 전제 하에, 관측된 통계값 혹은 그 값보다 큰 값이 나올 확률


#### _____ ● 가설 검정 절차 ####

#### _____ ● 분할표와 오류 ####
#### _____ ● 분할표 해석 ####
# 정확도

# 정밀도

# 재현률

#### _____ ● 분할표 ####
set.seed(1234)
 
## replace TRUE : 복원추출 
Truth  = factor(sample(0:1, size=150, replace=TRUE), levels=1:0)
Result = factor(sample(0:1, size=150, replace=TRUE), levels=1:0)
table  = table(Result, Truth)
table

class(table)

sum(table)

install.packages("e1071", dep = TRUE) 

install.packages("lattice")
install.packages("ggplot2")


install.packages("caret")

library("caret")

lvs = c("normal", "abnormal")
truth = factor(rep(lvs, times = c(86, 258)),
               levels = rev(lvs))
pred = factor(c(rep(lvs, times = c(54, 32)),
                rep(lvs, times = c(27, 231))),
              levels = rev(lvs))
xtab = table(pred, truth)



## 외울것 !!!!!!!!!!!!!!!!!! 
install.packages(c("tidyverse", "caret", "splitstackshape"))

TRUE
FALSE
TRUE + TRUE
TRUE + FALSE
as.numeric(TRUE)
as.numeric(FALSE)

head(iris)
iris$Sepal.Length >= 4.5
sum(iris$Sepal.Length >= 4.5)
sum(iris$Sepal.Length >= 4.5) / nrow(iris)
sum(iris$Sepal.Length >= 4.5) / nrow(iris) * 100
round(sum(iris$Sepal.Length >= 4.5) / nrow(iris), 3)

data("diamonds", package="ggplot2")
head(diamonds)

unique(diamonds$color)

# Q1.  diamonds  객체의 color  변수값이  "J","H","F" 인 것을 추출하시오.
dia_sub = diamonds[diamonds$color == "J" | diamonds$color == "H" | diamonds$color == "F", ]

### %in%
dia_sub = diamonds[diamonds$color %in% c("J", "H", "F"), ]

dia_sub[ ,2]

head(dia_sub)
# Q2 J H F 만 있는지 확인  
unique(dia_sub$color)
table(dia_sub$color)

diamonds[1, "color"]
class(diamonds[3, "color"])

as.numeric(diamonds[1, "color"])
as.character(diamonds[1, "color"])

dia_fac_sub = diamonds[diamonds$color >= 4,]
head(dia_fac_sub)
table(dia_fac_sub$color)

dia_fac_sub = diamonds[as.numeric(diamonds$color) >= 4,]
head(dia_fac_sub)
table(dia_fac_sub$color)

dia_fac_sub = diamonds[diamonds$color >= "G",]
head(dia_fac_sub)
table(dia_fac_sub$color)

dia_fac_sub = diamonds[diamonds$color %in% c("G", "H", "I", "J"), ]
head(dia_fac_sub)
table(dia_fac_sub$color)



fac = factor(c(1,1,1,2,3,4,4), levels = 4:1)
class(fac)
as.numeric(fac)
as.numeric(as.character(fac))

fac = factor(c(1,1,1,2,3,4,4), levels = 1:4, ordered=TRUE)
as.numeric(fac)


fac = factor(c(1,1,1,2,3,4,4), levels = 1:4, ordered=TRUE)
as.numeric(fac)


fac = factor(c(23,45,67,67,67), levels = c(23,45,67))
fac
as.numeric(fac)

fac[6] = 23
fac[5] = 80
fac


fac = factor(c(23,45,67,67,67,80), levels = c(23,45,67))
fac
as.numeric(fac)


 

#### __ [04] 추론 통계 ####
#### _____ ● 개념 ####

#### _____ ● 용어 정리 ####
# ▶ 추정(estimation): 표본을 통해 모집단 특성을 추측하는 과정
# ▶ 가설검정(hypothesis): 모집단 실제값과 표본값을 이용하여 가설의 옳고 그름을 판정하는 과정
# ▶ 귀무가설(null hypothesis): 연구에서 검증하는 가설
# ▶ 대립가설(alternative hypothesis): 연구자가 연구를 통해 입증되기를 기대하는 가설(귀무가설과 반대)
# ▶ 모수적 방법(parametric method): 모집단의 특정 확률 분포를 가정하고, 해당 표본 분포의 평균과 분산을 추정
# ▶ 비모수적 방법(non-parametric method): 표본의 반복적인 복원 추출로 표본 분포를 생성하고 모집단의 분포를 추정


#### _____ ● 점 추정 ####

#### _____ ● 용어 정리 ####
# ▶ 점 추정치(point estimate): 하나의 수치에 의해 추정된 모집단의 특성
# ▶ 추정량(estimator): 모집단 특성을 추정하기 위하여 이용되는 통계량
# ▶ 추정치(estimate): 추정량을 통하여 계산된 구체적인 수치


#### _____ ● 예제 코드 ####

library("MASS")

mean(survey$Height, na.rm = TRUE)
gender.response = na.omit(survey$Sex)

sum(gender.response == "Female") / length(gender.response)




#### _____ ● 좋은 점 추정량의 조건
# 불편성 

# 효율성

# 일치성

# 충분성


#### _____ ● 구간 추정 #### 
#### _____ ● 용어 정리 - 국간 추정 ####
# ▶ 유의 수준(Significance level): 통계적 검정(檢定)에서 가설을 기각(棄却)할 때, 그 가설이 옳은데도 불구하고 틀린 것으로 치고 기각하는 확률의 허용 수준(1종 오류의 최대값)
# ▶ 신뢰 구간(confidence interval): 지정된 신뢰수준을 통해 계산된 구간


#### _____ ● 정규분포 신뢰구간 관련 코드 1 ####
library("ggplot2")

nums = seq(-4, 4, length = 100)

ggplot() + 
  geom_line(aes(x = nums, y = dnorm(nums)), size = 2) + 
  geom_vline(xintercept = c(mean(nums),
                            mean(nums) - 1.96,
                            mean(nums) + 1.96), 
             color = "#FF0000", linetype = 2) + 
  geom_vline(xintercept = c(mean(nums), mean(nums) - 2.33, mean(nums) + 2.33),
             color = "#009900", linetype = 2) + 
  geom_vline(xintercept = c(mean(nums), mean(nums) - 2.58, mean(nums) + 2.58),
             color = "#0000FF", linetype = 2)



ggplot() + 
  geom_line(aes(x = nums, y=dnorm(nums)), size = 2) +
  geom_vline(xintercept = c(mean(nums), mean(nums) - 1.96, mean(nums) + 1.96),
             color = "#FF0000", linetype = 2) + 
  geom_vline(xintercept = c(mean(nums), mean(nums) - 2.33, mean(nums) + 2.33),
             color = "#009900", linetype = 2) +
  geom_vline(xintercept = c(mean(nums), mean(nums) - 2.58, mean(nums) + 2.58),
             color = "#0000FF", linetype = 2)  

#### _____ ● 정규분포 신뢰구간 관련 코드 2 ####

qnorm(p = 0.5, mean = 0, sd = 1)
qnorm(p = 0.5, mean = 3, sd = 1)
qnorm(p = 0.95, mean = 0, sd = 1)
qnorm(p = 0.975, mean = 0, sd = 1)


#### _____ ● 모평균의 신뢰 구간 #### 
# (모표준편차를 모르는 경우)
set.seed(123)
x = sample(30:70, size = 15)

# 평균
mean(x)
# 분산
var(x)
# 표준편차
sd(x)
# t 테스트 
# mu :  모평균 
# conf.level : 신뢰구간 
t.test(x, alternative = "greater", 
       mu=63.0, conf.level=0.95)

t.test(x + 50, alternative = "greater", 
       mu=63.0, conf.level=0.95)

result_t = t.test(x, alternative = "less", mu=63.0, conf.level=0.95)

#### _____ ● 모비율의 신뢰 구간 ####
# (모표준편차를 모르는 경우)
#
# x  표본 
# n 모집단
# p  확률
prop.test(x = 130, n = 200, p = 0.50,
          alternative = c("two.sided"),
          conf.level = 0.95)
?prop.test

#### __ [05] 표본 ####
#### _____ ● 표본 추출의 정의 ####

#### _____ ● 표본 추출의 종류 ####


#### _____ ● 확률적 표본 추출의 정의 ####

#### _____ ● 단순 임의 추출의 정의 ####

#### _____ ● 단순 임의 추출의 특징 ####

#### _____ ● 단순 임의 추출 ####
# 복원 추출

# 비복원 추출

#### _____ ● 군집 표본추출의 정의 ####

#### _____ ● 군집 표본추출의 특징 ####

#### _____ ● 예시 ####
# 행정구역 기준 표본 추출

# 교육기관 기준 표본 추출


#### _____ ● 체계적 표본 추출의 정의 ####

#### _____ ● 체계적 표본 추출의 특징 ####

#### _____ ● 예시 ####
