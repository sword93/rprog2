#### .=========.####
#### | [[ Day 1 ]] ####
#### .=========.####

#### 1. 데이터 과학과 R ####
#### __ [01] 데이터 과학의 개요 ####
#### _____ ● 데이터 과학이란? ####

#### _____ ● 데이터 과학의 구체적 사례 ####
# 국가별 경제 수준과 의료 수준 동향

# 주택 가격 예측

# 두 수면제의 효과 비교

# 웹사이트 개선을 위한 A/B 테스트 

#### _____ ● 데이터 분석 프로세스 ####

#### _____ ● 데이터 과학자에게 필요한 역량 ####

#### __ [02] 데이터 분석 환경 구성 ####
#### _____ ● R과 RStudio 설치 ####

#### _____ ● R의 장점 ####

#### _____ ● R의 단점 ####

#### _____ ● RStudio란? ####

#### _____ ● 특징 ####

#### _____ ● RStudio 화면 구성 ####

#### _____ ● 테마 변경 ####

#### _____ ● 단축키 ####
# 실행: [Ctrl] + [Enter]
# 새 파일 열기: [Ctrl] + [o]
# 스크립트 저장: [Ctrl] + [s]
# 주석 처리: [Ctrl] + [Shift] + [c]
# 스크립트창 이동: [Ctrl] + [1]
# 콘솔창 이동: [Ctrl] + [2]
# 콘솔창 클리어: [Ctrl] + [l]
# 문서 개요 확인: [Ctrl] + [Shift] + [o]

#### _____ ● 자동완성 ####


#### _____ ● 섹션 분할 ####

#### _____ ● 데이터 확인 ####

#### _____ ● 명령어 입력 ####

#### _____ ● 명령어 실행 ####
1 + 1 # ctrl+enter

#### _____ ● 패키지(Package) ####
?head

# install.packages("beepr")
# library("beepr")
beep(2) # alarm 알람

### _____ ● 패키지 설치(인터넷 O) ####

#### _____ ● 패키지 설치(인터넷 X) ####

#### _____ ● 패키지 설치(인터넷 X) Plan B ####

#### _____ ● 패키지 불러오기 ####
# install.packages("data.table")
library("data.table")
  ## 함수를 정확히 사용하기 위해서 
  #   데이터가 클경우 100M 이상 
  #   웹페이지 코드를 가져오는 것도 있음 
data.table::as.data.table()

#### _____ ● 유용한 패키지 ####
# ▶ 데이터 조작 및 처리: dplyr, reshape2, data.table
# ▶ 그래프 등 시각화 관련: ggplot2, ggmap, ggvis, lattice, plotly
# ▶ 데이터 분석 등 기계학습 관련: CART, e1071, C50, DMwR
# ▶ 시계열 데이터 처리: lubridate, xtm
# ▶ 텍스트 처리: splitstackshape, KoNLP

#### _____ ● 재미난 패키지 ####

#  

#### _____ ● 작업폴더(working directory) ####
getwd()

# 
# setwd()

#### _____ ● 작업폴더 확인과 설정 ####


#### 2. 데이터의 취득과 전처리 ####
#### __ [01] 데이터 과학 학습용 데이터 ####
#### _____ ● R Datasets ####

#### _____ ● UCI 머신러닝 데이터 저장소 ####
# https://archive.ics.uci.edu/ml/index.php

#### _____ ● Kaggle ####
# https://www.kaggle.com/

#### __ [02] 파일 읽어들이기 #### 
#### _____ ● 데이터 가져오기 실습 - 특정 구분자 ####
# page 31
# stringsAsFactors : 문자열을 범주형으로 변환하는 기능을 끄겠다는 의미 
aws = read.delim("AWS_sample.txt", sep="#", stringsAsFactors = FALSE)
head(aws)

#### _____ ● 데이터 가져오기 실습 - csv ####
df = read.csv("life_expectancy.csv")
head(df)

df = read.csv("population_country.csv")
head(df)

df = read.csv("rating_chocobar.csv")
head(df)

df = read.csv("rating_ramyun.csv")
head(df)

df = read.csv("store_apple.csv")
head(df)


# 가능한 fread  함수를 사용한다.
# 파일이(문자)가 깨지는 현상이 있음.
library("data.table")
df = fread("population_country.csv")
head(df)




#### _____ ● 데이터 가져오기 실습 - xlsx ####
## 엑셀은 셀병합이 있는 경우 처리하기 어렵다.
library("readxl")
library()
df=read.excel("iris.xlsx")

#### _____ ● 데이터 가져오기 실습 - DB ####

#### _____ ● 다양한 데이터 불러오기 ####
# read.csv() 활용 

#### _____ ● 파일 저장하기 ####

# write.csv(df, "write_csv_basic.csv", row.names = FALSE)
# 
# library("readr")
# write_tsv(df, "write_tsv.csv")

#### __ [03] R의 데이터 구조 ####
#### _____ ● 원소 속성 ####


#### _____ ● 특수 유형 ####


#### _____ ● 객체 구조 ####
# 벡터 - c()
# c 함수는 소문자임 
c(1, 2, 3, 4)
c("1", "2", "3", "4")
c(1, 2, 3, "a")

aa=c("a", "b", "c")
aa
aa[2]
aa[c(1,3)]
aa[4] = 2
aa[5]
# 행렬 - matrix()


matrix(1:6)
matrix(1:6, nrow=3)
matrix(1:6, nrow=3, byrow = TRUE)

mat = matrix(1:6, nrow = 3)
mat
mat[,2]
mat[3,]
# 데이터 프레임 - data.frame()
data.frame(aa = c(1,2,3), 
           bb=c("a","b","c"))

# error 
data.frame(aa = c(1,2,3), 
           bb=c("a","b"))

df = data.frame(aa = c(1,2,3), 
               bb=c("a", "b", "c"))

head(df, 2)

# 리스트 - list()
listt = list(aa = 1:4,
             bb = data.frame(aaa = 1:2,
                             bbb = c("d", "e")),
             cc = list(dd = 4:9, ff=matrix(1:4, nrow=2)))

listt

# str은 설명을 해준다 ???
str(listt)

listt$cc$ff
# 대괄호 안에 수식(필터)를 얼마나 잘 넣는냐가 중요하다.
listt$cc$ff[1,]



#### __ [04] R의 연산 ####
#### _____ ● 할당 연산자 ####

#### _____ ● 산술 연산자 ####

#### _____ ● 논리 연산자 ####
"감자" == "고구마"

"감자" != "고구마"
#### _____ ● 산술 연산자 ####

#### _____ ● 논리 연산자 ####


#### _____ ● 산술 함수 ####






# 프롬프트(>)는 제외하고 입력합니다!
# 삼각함수
sin( pi/3 )
cos( pi/3 )
tan( pi/3 )

# 어림하기
abs(3)
abs(-3)

round(24.51)
round(24.49)
#  소수점 기준 자리수
round(24.51, -1) # 20
round(24.51, -2) # 0

floor(24.51)
ceiling(24.51)

# 펙토리얼


#### _____ ● 수열 생성 ####
# 특수기호(:)를 사용한 숫자 생성
1:5
1.5:5
1.5:6
1.5:1.5

# seq() 함수를 사용한 숫자 생성
# by default 1
seq(from=1, to=3)
seq(from=1, to=3, by=0.5)
seq(from=1, to=3, by=1.2)
#   length.out 자리수 8자리 숫자(.) 포함?
seq(from=1, to=3, length.out=8)
seq(to=4, from=1)

# rep() 함수를 사용한 숫자 생성
# replicate
rep(1:3, 5)
rep("안녕", 5)

rep(1:4, times = 4)
rep(1:4, each = 4)
rep(x = 1:4)

# 괄호를 열고  tab을 누룬다.
head(x = df, n = )
#### _____ ● 데이터 가져오기 - 특정 구분자 ####
aws = read.delim("AWS_sample.txt", sep, "#",   stringsAsFactors = FALSE)

#### _____ ● 상/하단 행 확인 ####
# head()
head(aws, 5)

# tail()
tail(aws, 4)
#### _____ ● 객체 구조 및 변수별 기술통계 확인 ####
# str()
# 개체의 구조를 보는 함수 
str(aws)
# summary()
summary(aws)
# nrow()
# number of row
nrow(aws)
# ncol()
ncol(aws)
# dim()
dim(aws)
# colnames()
# 컬럼 이름만 보고 싶을때 , 변경도 가능 
colnames(aws)

#### _____ ● 행과 열 ####

#### _____ ● `$`를 사용한 데이터 추출 ####
# 1000 개 까지만 출력된다.
aws$TM
aws$TM[937]
aws$Wind
aws$X.
aws$TA
aws$TA[937]

#### _____ ● 벡터연산을 사용한 데이터 추출 - 행 ####
# 단일 숫자
aws[2,]
aws[135, ]
# 연속
aws[3:5, ]
aws[3:10,]
aws[c(3:10),]
# 이산
aws[c(2,135,3:10),]

#### _____ ● 벡터연산을 사용한 데이터 추출 - 열 ####
# 단일 숫자
aws[ ,3]
# 연속
aws[ ,3:4]
# 이산
aws[, c(1,3)]
# 단일 문자

# 복수 문자


#### _____ ● 벡터연산을 사용한 데이터 추출 - 행열 ####
# 숫자
aws[1, 3]
# 복수
aws[2:5, c("TA", "Wind")]
aws[2:5, c("TA", "Wind")]
#결과값 같음 . 아래 3개
aws[1:4, 1:4]
aws[1:4, c(1,2,3,4)]
aws[1:4, -5]

#결과값 같음 . 아래 3개 (- 마이너스는 제외 )
aws[1:4, c(1,2,4)]
aws[1:4, c(-3, -5)]
aws[1:4, -c(3,5)]

# tab 을 잘 활용하라 
aws[, c("TM","TA")]

#### _____ ● 벡터연산을 사용한 데이터 치환 ####
# ※ 순서대로 입력하세요.
aws[1, ]

aws[1, ] = -1
head(aws)

aws["6", ] = -4
head(aws)

aws[c(1:2, 6), ]  = -6666
head(aws)

aws[1, 1:3] = -1
head(aws)


#### _____ ● 벡터연산을 사용한 데이터 삽입 ####

aws[, 6] = "new"
head(aws)


aws[, ncol(aws)+1] = "new!!!"
head(aws)

ncol(aws)

# Q. column 명을 바꿔봅시다.
# 1) 여섯번째  column 명을 "col_6" 으로 변경하시오
# 단 각 문항의 정답 코드는 한줄로 작성한다.
# 2) 여섯번째, 일곱번째  column명을 각각  "aa" 와"bb" 로 변경하시오

# 1)
# 결과는  배열이다.
colnames(aws)
# 6번째를  변경한다.
colnames(aws)[6]="col_6"
colnames(aws)


# 2)
colnames(aws)[6:7]=c("aa", "bb")
colnames(aws)

head(aws)

# ?????
colnames(aws[6]) = 
# ?????

# 3) 컬럼순서를 바꾼다.
aws2 = aws[, c(2,1,3:ncol(aws))]
head(aws2)

# column "last_one" not exist
aws[, "last_one"] = 12345
head(aws)
 
# if "last_one" exists ... overwirte !!!
aws[, "last_one"] = 67891
head(aws)



#### _____ ● bind 함수를 사용한 데이터 병합 ####
aaa = aws[10:13, 3:4]
bbb = aws[20:23, 3:4]

# cbind()
cbind(aaa, bbb)

# rbind()
# file 여러개를 합칠때!!
rbind(aaa, bbb)

# error !!! : column , 개수가 다를 경우 에러
cbind(aaa, bbb[-1, ])



#### _____ ● 함수 정리 ####
# ▶ 각종 함수를 활용하여 주어진 자료를 요약
# ▶ str(): 객체 구조 확인
# ▶ summary(): (2차원) 객체의 변수별 기술통계량 확인
# ▶ length(): 1차원 객체의 길이 계산
# ▶ unique(): 1차원 객체의 고유 원소 추출
# ▶ quantile(): 1차원 객체의 분위수 계산
# ▶ nrow(): 2차원 객체의 row 개수 계산
# ▶ ncol(): 2차원 객체의 column 개수 계산
# ▶ table(): 객체의 고유 원소 개수 계산
# ▶ aggregate(): 조건에 따른 요약 정보 계산
# ▶ apply(): (2차원) 객체의 row 또는 column 기준 일괄 계산

#### _____ ● table() 함수를 사용한 표 만들기 ####
# install.packages("ggplot2")
install.packages("ggplot2")

# ggplot2 패키지에서 diamonds 라는 data 를 가져와라
data("diamonds", package="ggplot2")
head(diamonds, 3)
head(diamonds)

# table 함수는 몇ㄱ새 있는지 세는것이다. 
table(diamonds$cut)


nrow(diamonds)

sum( table(diamonds$cut))
# prop.table
prop.table(table(diamonds$cut))
prop.table(table(diamonds$cut)) * 100
round(prop.table(table(diamonds$cut)) * 100, 3)



sum( table(diamonds$color))

table(diamonds$cut, diamonds$clarity)
table(diamonds[, c("cut", "clarity")])

aggregate(data=diamonds, price~cut, FUN="mean")


dia_table = table(diamonds[, c("cut", "clarity")])
dia_table
prop.table (dia_table)

# row 방향 더하면 1       : margin=1
prop.table (dia_table, margin=1)
#  column  방향 더하면 1 : margin=2
prop.table (dia_table, margin=2)

### _____ ● 함수의 활용 ####
data("airquality")

df = airquality

head(df, 2)


# unique()
unique(df$Month)
length(unique(df$Month))

# 많이 쓰임 , 서로 짝꿍임
# length  1차원 배열의 개수
# unique  유일 데이터의 개수 

# quantile() : 1분위수 2분위수 3분위수 4분위수 
quantile(df$Wind)

quantile(df$Wind, probs = 0.05)

quantile(df$Wind, probs = 0.95)

quantile(df$Wind, probs = c(0.01, 0.99))

df = read.csv("store_apple.csv", stringsAsFactors = FALSE)
head(df)
length(unique(df$prime_genre))


#### _____ ● 문자열 처리 ####
# 데이터 준비
sample = data.frame(aa = c("abc_sdfsdf", "abc_KKdfsfsfs", "ccd"),
                    bb = 1:3,
                    stringsAsFactors = FALSE)

sample

# 문자 개수 세기
nchar(sample[1,1])
# 특정 문자 위치 확인
which(sample[,1]=="ccd")
# true  어디 있는지 알려주는 함수
which(c(TRUE, FALSE, TRUE, FALSE))


# 대소문자 변환
toupper(sample[1,1])
tolower(sample[2,1])

#install.packages("splitstackshape")
install.packages("splitstackshape")
library("splitstackshape")

# 문자열 분리
# cSplit <- S 대문자 입니다.
strsplit(sample[,1], split="_")

cSplit(sample, splitCols="aa", sep="_")
cSplit(sample, splitCols="aa", sep="_", drop = FALSE )
?cSplit

y <- c("a_b_c", "a_b", "c_a_b")
cSplit(data.frame(y), "y", "_")


# 문자 결합
sample

paste0(sample[,1], sample[,2])

paste0(sample[,1], sample[,2], sep=" HAHAHA ")

# 특정 위치 문자 추출

substr(sample[,1,] , 1, 2)

substr(sample$aa , 1, 2)

#### _____ ● 정규표현식 ####
# 실습 데이터 만들기
text1 = "1234 asdfASDF  ㄱㄴㄷㄹㅏㅑㅓㅕ가나다라   .!@#"
text2 = "<a> <ab> <abc> <abcd>"
text3 = c("aaa", "bbb", "ccc", "abc")

# 활용 함수 
gsub(pattern="", replacement = "@", x = text1)
gsub(pattern="[0-9]", replacement = "@", x = text1)
gsub(pattern="[a-z]", replacement = "@", x = text1)

# ▶ gsub(): 패턴 치환
# ▶ grep(): 패턴 매칭
# ▶ grepl(): 패턴 매칭 결과를 논리값(TRUE/FALSE)으로 반환 

# 숫자 치환
gsub(pattern="[0-9]", replacement = "@", x = text1)
# 영문 치환
# __ 소문자 치환
gsub(pattern="[a-z]", replacement = "@", x = text1)
# __ 대문자 치환
gsub(pattern="[A-Z]", replacement = "@", x = text1)
# 한글 치환
# __ 자음 치환
gsub(pattern="[ㄱ-ㅎ]", replacement = "@", x = text1)
# __ 모음 치환
gsub(pattern="[ㅏ-ㅣ]", replacement = "@", x = text1)
# __ 완성형 치환
gsub(pattern="[가-힣]", replacement = "@", x = text1)

gsub(pattern="[A-Za-z]", replacement = "@", x = text1)
gsub(pattern="[A-z]", replacement = "@", x = text1)
# 띄어쓰기 치환
gsub(pattern=" ", replacement = "@", x = text1)
gsub(pattern="  ", replacement = "@", x = text1)
gsub(pattern="   ", replacement = "@", x = text1)
# 한칸 또는 두칸 또는 세칸 
gsub(pattern=" |  |   ", replacement = "@", x = text1)
gsub(pattern=" |  {2}|  {3}", replacement = "@", x = text1)


#gsub(pattern=" {,3}", replacement = "@", x = text1)
#한칸 띄어쓰기가 1개에서 3개까지 
gsub(pattern=" {1,3}", replacement = "@", x = text1)

#  한칸 이상 띄어쓰기를 하나로 빠꿈
gsub(pattern=" {2,}", replacement = " ", x = text1)

# 응용
# __ 숫자가 아닌 모든 문자 치환 ==> ^
gsub(pattern="[^0-9]", replacement = "@", x = text1)

# __ 영문자가 아닌 모든 문자 치환
gsub(pattern="[^A-z]", replacement = "@", x = text1)

# __ 한글이 아닌 모든 문자 치환
gsub(pattern="[^가-힣&^ㄱ-ㅎ&ㅏ-ㅣ]", replacement = "@", x = text1)

# __ 숫자와 영문 대문자가 아닌 모든 문자 치환
#gsub(pattern="[^0-9&^A-z]", replacement = "@", x = text1)
gsub(pattern="[^0-9A-z]", replacement = "@", x = text1)

# __ 숫자 2, 3만 치환
gsub(pattern="[2-3]", replacement = "@", x = text1)
gsub(pattern="[23]", replacement = "@", x = text1)
gsub(pattern="2|3", replacement = "@", x = text1)
# __ 숫자 2, 3, 4, 7, 8, 9 치환
gsub(pattern="2|3|4|7|8|9", replacement = "@", x = text1)

gsub(pattern="[2-47-9]", replacement = "@", x = text1)


# __ '.'의 치환
gsub(pattern=".", replacement = "@", x = text1)
gsub(pattern="\\.", replacement = "@", x = text1)

# 20 - 29 치환 
gsub(pattern="2[0-9]", replacement = "@", x = 1:50)
 
gsub(pattern="[[:punct:]]", replacement = "@", x = text1) 


grep(pattern="2[0-9]", x = 10:50) ### 위치를 찾는다
grep(pattern="2[0-9]", x = 10:50, value=TRUE) ### 값을 보여준다.


# __ 두 칸 띄어쓰기와 세 칸 띄어쓰기의 치환
 

# __ "asdf"와 "가나다라" 치환


# __ 1, 3 치환

# __ 1~3, 7~9 치환

# 특수문자내 문자 처리
# __ 모든 경우의 수 치환
text2
gsub(pattern="<.*?>", replacement = "@", x = text2)
gsub(pattern="<[a-z]*?>", replacement = "@", x = text2)
gsub(pattern="<[a-c]*?>", replacement = "@", x = text2)
gsub(pattern="\\([0-9]*?\\)", replacement = "@", x = "aaaa(123)(ab)")
gsub(pattern="<.{1}>", replacement = "@", x = text2)
gsub(pattern="<.{2,4}>", replacement = "@", x = text2)
# __ 내부 문자 1개 치환

# __ 내부 문자 2~4개 치환


# 텍스트 조건
# __ "a"를 포함하는 원소 추출
text3

grep(pattern="^a", x = text3)
text3[grep(pattern="^a", x = text3)]
text3[c(1, 4)]

grep(pattern="^a", x = text3, value=TRUE)


# __ "b"를 포함하는 원소 추출
grep(pattern="b", x = text3, value=TRUE)

# __ "b"로 시작하는 원소 추출
grep(pattern="^b", x = text3, value=TRUE)

# __ "a"로 끝나는 원소 추출
grep(pattern="a$", x = text3, value=TRUE)
# __ "a"또는 "b"를 포함하는 원소 추출
grep(pattern="a|b", x = text3, value=TRUE)

# grepl() 함수의 활용 ==>Logical ?
grepl(pattern="a|b", x = text3)
text3[!grepl(pattern="a|b", x = text3)]

# gregexpr() 함수의 이해
text = "aaaa(123)bbb"

result = regmatches(x = text, 
           m = gregexpr(pattern="\\(.*?\\)",
                        text = text))
unlist(result)
# result = regmatches(x = text, 
#                     m = gregexpr(pattern="\\(.*?\\)",
#                                  text = text))
# unlist(result)

text_extractor2 = function(txt) {
  result = regmatches(x = txt, 
                      m = gregexpr(pattern="\\(.*?\\)",
                                   text = txt))
  unlist(result)  
}

text_extractor2(text)

c("aaa", "bbb")

text_extractor(c("aaa", "bbb"),"\\(.*?\\)" )

text_extractor = function(vec, rege) {
  result = regmatches(x = vec, 
                      m = gregexpr(pattern = rege,
                      text = vec))
  result  
}





#### _____ ● 반복문 - for() ####
# for() 함수
for(number in 1:3) {
  print(number)
}

for(number in c(1,3,9)) {
  print(number)
}


for(num in 3:6) {
  print(num*num)
}
# 데이터 준비
df_1 = data.frame(aa = c("a", "b", "c", "d"),
                  bb = 1:4)
df_1

# 응용
for(num in 1:4) {
  df_1[num, "new_column"] = num * 2
}

for(num in 1:nrow(df_1)) {
  df_1[num, "new_column"] = num * 2
  print(df_1)
  Sys.sleep(2)
}

df_1
#### _____ ● 조건문 - if() ####
# if() 함수

n = 3
if (n==3) {
  print("n is 3.")
} else {
  print("n is not 3")
}

n = 5
if (n==3) {
  print("n is 3.")
} else {
  print("n is not 3")
}


# 데이터 준비
df_1 = data.frame(aa = c("a", "b", "c", "d"),
                  bb = 1:4)
df_1

# 응용

for(n in 1:4) {
  if ( n >= 3 ) {
    print(df_1[n, "bb"])
  } else {
    print("응?")
  }
}

#### _____ ● 조건 연산자 ####
# 데이터 준비
df_1 = data.frame(aa = c("a", "b", "c", "d"),
                  bb = 1:4)

df_1
# 실습
df_1[df_1$bb >= 3, ]

df_1[df_1$aa == "b", ]

df_1[df_1$aa != "b", ]

df_1[(df_1$bb>1) & (df_1$bb<4), ]

#### _____ ● 속성 확인 ####

#### _____ ● 속성 확인 예제 - 원소 ####
aa = 1234
bb = "test"
cc = TRUE
dd = NA

class(aa)
class(bb)
class(cc)
class(dd)

as.character(aa)
as.numeric(bb)


#### _____ ● 속성 확인 예제 - 객체 ####


#### _____ ● 속성 변환 ####

#### _____ ● 속성 변환 예제 - 원소 ####

#### _____ ● 속성 변환 예제 - 객체 ####

#### _____ ● 속성 변환 예제 - table ####
