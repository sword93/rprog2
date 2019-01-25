# (1-1) ggplot2패키지의 diamonds데이터를 불러오시오.
# (1-2) diamonds 객체의 속성을 확인하시오.
# (1-3) diamonds 객체의 속성이 data.table인 경우
#       data.frame으로 변환하시오.
# (1-4) diamonds 객체의 cut 변수의 원소 구성비가 동일한지 검정하시오.

data("diamonds", package = "ggplot2")
head(diamonds, 2)
class(diamonds)

diamonds = as.data.frame(diamonds)
aa = as.numeric(table(diamonds$cut))
bb = rep(nrow(diamonds), 5)
prop.test(aa, bb)
