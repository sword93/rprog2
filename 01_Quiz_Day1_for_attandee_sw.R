#### 1. 객체의 생성 ####
#### __ 1) 1차원 벡터 ####
# (1-1) 숫자 1, 2, 3, 4, 7, 8, 9, 10, 11이 들어있는 1차원 벡터를 생성하시오.
c(1, 2, 3, 4, 7, 8, 9, 10, 11)
c(1:4, 7:11)

# (2-1) 1, 2, 3, "a", "b", "c", "d", "e", "f", "g"가 들어있는 
#       1차원 벡터를 생성하고 vec에 저장하시오.
vec = c(1:3, "a", "b", "c", "d", "e", "f" ,"g")
vec = c(1:3, letters[1:7])

LETTERS[1:7]

# (2-2) 객체 vec의 속성을 확인하시오. - class()
class(vec)

# (2-3) 객체 vec의 숫자만 추출하여 vec_sub에 저장하시오. (벡터 연산 사용)
vec_sub = vec[1:3]
vec_sub = vec[c(1, 2, 3)]

# (2-4) xxxx
vec_sub = vec[grep(pattern = "[0-9]", x = vec)]

# (2-5) 객체 vec_sub의 속성을 확인하시오.
class(vec_sub)

# (2-6) 객체 vec_sub의 속성을 숫자형으로 변환하여 vec_sub 객체에 저장하시오.
vec_sub = as.numeric(vec_sub)

# (2-7) 객체 vec_sub의 모든 원소에 100을 더하시오.
vec_sub + 100

for(n in 1:3){
  vec_sub[n] = vec_sub[n] + 100
}

for(n in 1:length(vec_sub)){
  vec_sub[n] = vec_sub[n] + 100
}




for(n in 1:3){
  print(n)
}

#### __ 2) 데이터프레임 ####
# (1-1) "medical_sick_codes_5M" 파일을 read.csv() 함수로 읽어오고 df에 저장하시오.
df = read.csv("medical_sick_codes_5M.csv")

# (1-2) df객체의 변수별 속성을 확인하시오.
str(df)

class(df[, "INDI_DSCM_NO"])
class(df[, "SICK_SYM1"])
class(df[, "SICK_SYM2"])
class(df[, "MDCARE_STRT_DT"])
class(df[, "FORM_CD"])

class(df[, 1])
class(df[, 2])
class(df[, 3])
class(df[, 4])
class(df[, 5])

for(n in 1:ncol(df)){
  print(class(df[, n]))
}

for(n in 1:ncol(df)){
  result = paste0(colnames(df)[n], ": ", class(df[, n]))
  print(result)
}

for(n in 1:ncol(df)){
  result = paste0(n, ") ", colnames(df)[n], ": ", class(df[, n]))
  print(result)
}

# (1-3) (1-1) 절차를 반복하되, read.csv() 함수의 인자(argument)를 살펴보고
#       문자열을 문자열 속성 그대로 읽어오시오.
df = read.csv("medical_sick_codes_5M.csv", stringsAsFactors = FALSE)

# (1-4) df객체의 변수별 속성을 확인하시오.
str(df)

# (2-1) data.table 패키지의 fread() 함수를 사용하여 
#      "medical_sick_codes_5M" 파일을 읽어오고 df에 저장하시오.
library("data.table")
df = fread("medical_sick_codes_5M.csv")

# (2-2) df객체의 속성을 확인하시오
class(df)

# (2-3) df객체의 속성을 데이터 프레임으로 변환하시오.
df = as.data.frame(df)

# (2-4) df객체의 속성을 확인하시오
class(df)

# (3-1) data.table 패키지의 fread() 함수를 사용하여 
#      "medical_sick_codes_5M" 파일을 데이터프레임으로 읽어오고 df에 저장하시오.
?fread
df = fread("medical_sick_codes_5M.csv", data.table = FALSE)

# (3-2) df객체의 속성을 확인하시오.
class(df)

head(df)

df_sick = df[, grep(pattern = "SICK", x = colnames(df))]
df_sick = df[, 3:ncol(df)]
head(df_sick)

#### 2. 자료의 요약과 변환 ####
# (1-1) ggplot2 패키지의 diamonds 데이터를 불러오시오.
data("diamonds", package = "ggplot2")

# (1-2) price가 평균값을 초과하는 row만 추출하여 df_sub에 저장하시오.
df_sub = diamonds[diamonds$price > mean(diamonds$price), ]

# (1-3) df_sub객체의 cut 변수와 color 변수를 사용하여 표를 생성하고
#     이를 table_df_sub에 저장하시오.
table_df_sub = table(df_sub[, c("cut", "color")])
class(table_df_sub)

# (1-4) table_df_sub를 데이터프레임으로 변환하여 df_sub_table에 저장하시오.
df_sub_table = as.data.frame(table_df_sub)
class(df_sub_table)
head(df_sub_table)

# (1-5) df_sub_table객체의 Freq 변수의 값이 1000 이상인 것을 추출하여
#       df_sub_table에 저장하시오.
df_sub_table = df_sub_table[df_sub_table$Freq >= 1000, ]

# (1-6) df_sub_table의 row 개수를 출력하시오.
nrow(df_sub_table)
