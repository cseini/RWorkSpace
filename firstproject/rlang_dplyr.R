## dplyr
# filter() 행추출
# select() 열추출
# arrange() 정렬
# mutate() 변수추가
# summarise() 통계치산출
# group_by() 집단별로 나누기
# left_join() 데이터합치기(열)
# bind_rows() 데이터합치기(행)
# View() 뷰어창에서 데이터 확인!! 주의..v 가 대문자
install.packages("dplyr")
library("dplyr")
library("ggplot2")
path <- getwd()
path
setwd("csv_exam") 
df_exam <- read.csv("csv_exam.csv")
## 문자가 들어있는 파일을 불러올때는 stringAsFactors = F
## 를 넣어줄것. 지정하지 않으면 문자요소는 factor 로
## 전환 됨. 숫자는 전환 되지 않음

is.data.frame(df_exam)
df_exam$avg <- apply(df_exam[,3:5],1,mean)
df_exam$grade <- ifelse(df_exam$avg>=90,'A',
                        ifelse(df_exam$avg>=80,'B',
                               ifelse(df_exam$avg>=70, 'C',
                                      ifelse(df_exam$avg>=60,'D',
                                             ifelse(df_exam$avg>=50,'E','F')))))
qplot(df_exam$grade)
barplot(df_exam$avg)
plot(df_exam$math,type='o')
hist(df_exam$avg, breaks=20)
table(df_exam$grade)

df_exam <- subset(df_exam, select=-grade_switch)
View(df_exam)



