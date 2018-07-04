
#install 은 패키지 설치 최초 1회.
install.packages("ggplot2")
#library(gplot2) 는 자바에서 import 개념
library(ggplot2)

df_jeju <- read.csv(file="c:\\Users\\1027\\RWorkspace\\1-2-1-2. 시간대별_관광객_지번(PNU)단위_유동인구_비율포함_201501.csv")

##sample
x<-c("2","2","3","1","4","4","4","4")
qplot(x)

#rm(x) remove x의 값 삭제.
rm(x)


# manufacturer
# model model name
# displ engine displacement, in litres
# year year of manufacture
# cyl number of cylinders
# trans type of transmission
# drv f = front-wheel drive, r = rear wheel drive, 4 = 4wd
# cty city miles per gallon
# hwy highway miles per gallon
# fl fuel type
# class "type" of car
##### mpg 데이터 파악하기
## 내가 모르는 빅데이터를 분석하는 방법
#data=mpg, x축에 변수 지정해 그래프 생성
qplot(data=mpg, x=hwy)
## x 축 cty
qplot(data=mpg, x=cty)

#mpg 데이터를 데이터 프레임으로 만든다
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
dim(mpg) ## 234행 11열 구조이다. 라고 보여주기 위함.
str(mpg)
summary(mpg)
#통합연비 변수 생성
mpg$total<-(mpg$cty+mpg$hwy)/2 
head(mpg)
#통합 연비 산출
mean(mpg$total)
#요약 통계량 산출
summary(mpg$total)
hist(mpg$total)
# report : total 연비의 평균과 중앙값이 약 20이다.
# total 연비가 20 ~ 25 사이에 해당하는
# 자동차 모뎅리 가장 많다
# 대부분 25 이하이고, 25를 넘기는 자동차는 많지 않다.

## 합격 판정 변수 만들기
## total 이 20 이상이면 pass, 미만이면 fail을
# 부여하는 test 라는 변수를 생성합니다.
mpg$test <- ifelse(mpg$total>=20,"pass","fail")
head(mpg,20)

## 합격 판정을 받은 자동차 수 살펴보자.
table(mpg$test)
qplot(mpg$test,main="연비확인",ylab="count",xlab="합격여부")

## 중첩조건문
# grade이 30 이상이면 A
# grade이 20~29 이면 B
# grade이 15~20 이면 C
# grade이 15미만 이면 D
mpg$grade <- ifelse(
  mpg$total >= 30 ,"A",
  ifelse (mpg$total >= 20,"B",
    ifelse (mpg$total >= 15,"c","d"))
)
head(mpg,20)
table(mpg$grade)
qplot(mpg$grade)

# 변수명 변경
mpg <- rename(mpg, company = manufacturer)
?rename()
