#### .=========.####
#### | [[ Day 4 ]] ####
#### .=========.####

#### 6. 데이터 모델링 ####
#### __ [01] 개요 ####

#### _____ ● 데이터의 종류와 활용 ####

#### _____ ● 데이터 분석 절차 ####

#### _____ ● 분석 종류별 특징 ####

#### _____ ● 지도학습과 비지도학습 ####

#### _____ ● Overfitting ####

#### _____ ● Feature Engineering ####

#### __ [02] 데이터 전처리 ####
#### _____ ● 전처리에 유용한 패키지 ####

#### _____ ● 예제 - psych ####
install.packages("psych")
library("psych")

data("iris")
describe(iris)

head(iris)
install.packages("doBy")
library("doBy")

iris_agg = summaryBy(data = iris, 
                     formula = Sepal.Length ~ Species, 
                     FUN = c(min, max, sd, var))


iris_agg

#### _____ ● 사용자 정의 함수 ####


#### _____ ● 예제 - 기본 ####

#### _____ ● 예제 01 ####
bbb = function() {
  print("Rloha")
}

bbb()
#### _____ ● 예제 02 ####
ccc = function(x) {
  print(x)
}
ccc()
ccc( x = 123 )
#### _____ ● 예제 03 ####
ddd = function(x) {
  x + 3
}
ddd(x =)
#### _____ ● 예제 04 ####
eee = function(x = 4) {
  x * 5
}
eee()
eee(5)
#### _____ ● 예제 05 ####
fff = function(aa, bb) {
  aa * bb
}
fff(aa = 1)
fff(aa = 1, cc = 1)
fff(aa = 1, bb = 2)
#### _____ ● 예제 06 ####
ggg = function(aa, bb) {
  print(aa)
  print(bb)
  print(aa*bb)
}
ggg(aa = 10, bb = 5)



########
text = readLines("https://www.naver.com", encoding = "UTF-8")
text[435]

#Q1 text  객체에서 ah_k가 드어있는 원소 추출 . grep()
grep()
?grep

grep()
?grep
grep(pattern="ah_k", x = text )
text2 = text[ grep(pattern="ah_k", x = text )]
text2


text = grep(pattern = "ah_k", x = text , value = TRUE)
#Q1 실시간 검색어만 남기는 작업. gsub()   
text = gsub(pattern = "<.*?>", replacement = "", x = text)
text
#Q1 중복제거
text[1:20]
unique(text)

readLines("https://www.naver.com", encoding = "UTF-8") %>%
  grep(pattern = "ah_k", value = TRUE) %>%
  gsub(pattern = "<.*?>", replacement = "") %>%
  unique -> result

readLines("https://www.naver.com", encoding = "UTF-8") %>%
  grep(pattern = "ah_k", value = TRUE) %>%
  gsub(pattern = "<.*?>", replacement = "") %>%
  .[1:20] -> result

result


readLines("http://zum.com", encoding = "UTF-8") %>%
  grep(pattern = "keyword d_keyword", value = TRUE) %>%
  gsub(pattern = "<.*?>", replacement = "") %>%
  unique -> result2

result2

library(data.table)


#Q1 text  객체에서 ah_k가 드어있는 원소 추출 . grep()

#Q1 text  객체에서 ah_k가 드어있는 원소 추출 . grep()


#### _____ ● 사용자 정의 함수 활용 ####

#### _____ ● 활용 실습 ####

#### _____ ● 정규 표현식 ####
# 실습 데이터 만들기 
text1 = "1234 asdfASDF  ㄱㄴㄷㄹㅏㅑㅓㅕ가나다라   .!@#"
text2 = "<a> <ab> <abc> <abcd>"
text3 = c("aaa", "bbb", "ccc", "abc")

# 활용 함수 

#### _____ ● 정규표현식 예제 ####

#### _____ ● 네이버 실시간 검색어 ####

#### _____ ● 정규표현식 예제 ####
# regexpr_example.txt
df_imgs = readLines("regexpr_example.txt", encoding = "UTF-8")
head(df_imgs)

df_imgs = grep(pattern="<image" , x = df_imgs, value = TRUE)

#### _____ ● 시간 데이터 생성 ####
# as.POSIXct() 함수 사용
as.POSIXct("2016-03-10")

as.POSIXct("2016-03-10 13:12")

as.POSIXct("2016-03-10 13:12:45")

as.POSIXct("2016-03-10", tz="UTC")

as.POSIXct("2016-03-10") + 1

as.POSIXct("2016-03-10") + 100

# 시스템 시간 호출 
Sys.Date()
Sys.time()

  time = Sys.time()
  1 + 1
  Sys.time() - time
# as.POSIXct() 함수 사용

# 시스템 시간 호출

# seq() 함수 활용 
seq(from = as.POSIXct("2016-03-10"), to = as.POSIXct("2018-05-12"), by="2 days")

seq(from = as.POSIXct("2016-03-10"), to = as.POSIXct("2018-05-12"), by="year")
seq(from = as.POSIXct("2016-03-10"), to = as.POSIXct("2018-05-12"), by="month")
seq(from = as.POSIXct("2016-03-10"), to = as.POSIXct("2018-05-12"), by="day")
seq(from = as.POSIXct("2016-03-10"), to = as.POSIXct("2018-05-12"), by="hour")
seq(from = as.POSIXct("2016-03-10"), to = as.POSIXct("2018-05-12"), by="min")
seq(from = as.POSIXct("2016-03-10"), to = as.POSIXct("2018-05-12"), by="sec")





# Q. 격일로 출력 하려면?

# 내장함수 활용 
time_1 = as.POSIXct("2016-03-10 13:12:45")
months(time_1, abbreviate = TRUE)
weekdays(time_1, abbreviate = TRUE)
quarters(time_1, abbreviate = TRUE)
as.Date(time_1)

# 패키지 활용 
time_1 = as.POSIXct("2016-03-10 13:12:45")
install.packages("lubridate")
library("lubridate")
year(time_1)
month(time_1)
day(time_1)
hour(time_1)
second(time_1)
year(time_1) = 2015
time_1

library("lubridate")
ymd(20190124)
ymd("20190124")
wday("2019-01-24", week_start = 1)
month("2019-01-24")

readLines("bike.csv", n=3)
library("data.table")
fread("bike.csv", nrow = 2)
fread("bike.csv", nrow = 2, skip = 2, header = FALSE)
# fread("bike.csv", nrow = 2, colClasses = 
################ ★★ ★★★★★★ 
strptime("#$#2018-_-10@@30", format = "#$#%Y-_-%m@@%d")
?strptime
as.Date(43403, origin="1900-01-01")
#### _____ ● 달력 만들기 ####
# 문제 1


# 문제 2


#### __ [03] 회귀 모델 ####
#### _____ ● 선형 회귀 ####

#### _____ ● 활용 예시 ####


#### _____ ● 관련 이론 ####
# 종속변수 관련

# 모형 수식

# 설명력

bike = read.csv("bike.csv", stringsAsFactors = FALSE)
head(bike)
bike = bike[, -c(1, 11:12)]

train = bike[1:4000, ]
test = bike[4001:nrow(bike), ]

model = lm(casual ~ ., data = train)
summary(model) # 0.4426 

model = lm(casual ~ . -season -holiday -weather, data = train)
summary(model) # 0.4427

library("car")
vif(model)

model = lm(casual ~ . -season -holiday -weather -temp, data = train)
summary(model)
vif(model)

model = lm(casual ~ . -temp -season -holiday -weather, data = train)
summary(model)
vif(model)

model_summary = summary(model)
model_summary$coefficients
model_summary$coefficients[, 1]

coef(model)

factor(c(1, 2, 3, 3, 4, 5), levels = 1:5, ordered = TRUE)

head(test)
result = predict(model, newdata = test)
head(result)

test[, "pred"] = result
head(test)


bike = read.csv("bike.csv", stringsAsFactors = FALSE)
#bike = bike[ , c(11,12)]
head(bike)

library("lubridate")
bike[ , "wday"] = lubridate::wday(x = bike$datetime, week_start= 1)
#bike[ , "wday"] = wday(x = bike$datetime, week_start= 1)
bike = bike[ , 1]
head(bike)

train = bike[1:4000]
test = bike[4001:nrow(bike), ]


#### _____ ● 예제 코드 ####
#Q.요일 변수를 새로 생성하여 앞의 회귀분석 과정을 수행하고
#   수정결정 계수의 차이를 소수점 셋째자리까지 기술하시오.
# (단, 요일 변수는 반드시 포하)



#### _____ ● 해석 및 평가 ####

#### _____ ● 예측 알고리즘 예제 ####


#### _____ ● 로지스틱 회귀 ####
###########################
# 1. RAW 데이터를 로딩한다으
## 빈칸이 결측치라고 알려준다.
df = read.csv("titanic_train.csv" , na.strings = "")
class(df)
head(df)

# 2. 필요컬럼만 필터링한다.
df = df[, c(2, 3, 5:8, 10, 12)]

# 3. 결측치를 제거하거나, 보정한다.
## 3.1 결측치를 평균값으로 한다.
df[is.na(df$Age), "Age"] = mean(df$Age, na.rm = TRUE)

## 3.2 embarked 가 na인것 제거한다.
df = df[!is.na(df$Embarked), ]

## 3.3 rowname 초기화 
rownames(data) = NULL
train = df[1:800, ]
test = df[801:nrow(df), ]

head(test)
# 4. Logistic Model 을 돌린다. (glm: generalized linear models)
# Fitting Generalized Linear Models
model = glm(Survived ~ . , 
            #family = binomial(link = "logit"), 
            family = "binomial",
            data = train)

summary(model)
### Embarked 가 유의미한 것으로 보이므로 factor 로 변환하여 컬럼을 추가한다.
train[, "Em_S"] = ifelse(train$Embarked == "S", 1, 0)
## embarkedQ 를 제거할경우 embarkedS 가 충분히 낮아질것일는 예상 체크
model2 = glm(Survived ~ . -Embarked, 
             #family = binomial(link = "logit"), 
             family = "binomial",
             data = train)

summary(model2)
model2 = glm(Survived ~ . -Embarked -Fare -Parch, 
             #family = binomial(link = "logit"), 
             family = "binomial",
             data = train)

summary(model2)

install.packages("pscl")
library("pscl")
pR2(model)

install.packages("car")
library("car")
vif(model)
?predict
model_pred   = predict(model, newdata = test[, 2:8], type = "response")
model_pred_2 = ifelse(test = model_pred > 0.5, yes = 1, no = 0)

mis_class_err = mean(model_pred_2 != test$Survived) / length(test$Survived)
mis_class_err = round(mis_class_err, 3)
1 - mis_class_err

test[,  "pred"] = model_pred_2
head(test)


library("caret")
confusionMatrix(table(test[, c("Survived", "pred")]))

### 0.7 일때 다르다. 
model_pred_3 = ifelse(test = model_pred > 0.7, yes = 1, no = 0)

## 책 Page 129 
install.packages("ROCR")
library("ROCR")
pr = prediction(model_pred, test$Survived)
prf = performance(pr, measure = "tpr", x.measure= "fpr")
ROCR::plot(prf)

## 1에 가까우면 좋다.


## S4
auc = performance(pr, measure = "auc")
class(auc)


## Compactly Display the Structure of an Arbitrary R Object
?str
str(auc)
auc@y.values[[1]]
auc@x.name

#### _____ ● 활용 예시 ####

#### _____ ● 관련 이론 ####
# 종속변수 관련

# 모형 수식

# 로짓 변환(logit transformation)

#### _____ ● 예제 코드 ####

#### _____ ● 해석 및 평가 ####

#### _____ ● 예제 코드 + 해석 및 평가 ####

#### _____ ● 로버스트 회귀 ####

#### _____ ● 관련 이론 ####

#### _____ ● 예제 코드 ####

#### __ [04] 분류 모델 ####
#### _____ ● 알고리즘별 결과 비교 ####

#### _____ ● K-means Clustering ####

#### _____ ● 특징 ####



#### _____ ● k-평균 군집 상세 ####

#### _____ ● 예제 코드 ####
library("ggplot2")
data("iris")

## Random을 돌리기 때문에 같은 결과를 가져오기 위해서 
set.seed(200)
head(iris[, 3:4])
cluster_K = kmeans(iris[, 3:4], center = 3, iter.max = 20)
cluster_K$centers
cluster_K$size

#### _____ ● 결과 및 해석 ####
table(iris$Species, cluster_K$cluster)
#### _____ ● 계층적 군집의 정의 ####

#### _____ ● 계층적 군집의 특징 ####

#### _____ ● 관련 이론 ####
# 최단 연결법

# 최장 연결법 

# 평균 연결법

# 연결 방법별 비교
?hclust
# iris 3:4 컬럼으로 Hierarchical Clustering 을 진행
clusters <- hclust(dist(iris[ ,3:4]))
plot(clusters)

## 군집을 4개로 잘라라 
clusterCut  = cutree(clusters, 4)
table(clusterCut)

iris[, "cut"] = clusterCut
head(iris)
### 
iris_agg1 = aggregate(Petal.Length ~ cut, data = iris, FUN = "mean")
iris_agg2 = aggregate(Petal.Width ~ cut, data = iris, FUN = "mean")
head(iris_agg1)
head(iris_agg2)



iris_agg = cbind(iris_agg1, iris_agg2)
iris_agg = iris_agg[, -3]
iris_agg
# dendrogram

#### _____ ● 예제 코드 #### 

#### _____ ● 결과 및 해석 ####
# 군집 1의 특성

# 군집 2의 특성

# 군집 3의 특성


#### _____ ● 의사결정나무의 정의 ####


#### _____ ● 의사결정나무의 특징 ####


#### _____ ● 예제 코드 ####
set.seed(56781)

train.indeces = sample(1:nrow(iris), 100)

iris.train = iris[train.indeces, ]
head(iris.train)
iris.test = iris[-train.indeces, ]

install.packages("C50")
library("C50")
model.C50 = C50::C5.0(Species ~ . , data = iris.train)
class(model.C50)
plot(model.C50)

model.C
#### _____ ● 결과 및 해석 ####


#### _____ ● 의사결정나무 예제 ####


#### 랜덤포레스트의 정의 ####


#### 랜덤포레스트의 특징 ####


#### 랜덤포레스트 결과 해석 ####
install.packages("randomForest")
library("randomForest")

data("Pima.tr", package = "MASS")
data("Pima.te", package = "MASS")

head(Pima.tr)

set.seed(10)
model = randomForest(type ~ ., data = Pima.tr,
                     mtry = 3, ntree = 500,
                     importance = TRUE)
model

pred = predict(model, Pima.te)
Pima.te[, "pred"] = pred
caret::confusionMatrix(table(Pima.te[, c("type", "pred")]))

importance(model)
varImpPlot(model)



## 시계열
install.packages("TTR")
library("TTR")
## 이동평균(MA)
## ts() ==> n 개수가 늘어날수록 문제가 될수가 있다.
#SMA(n = )
           



