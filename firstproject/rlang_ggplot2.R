# ggplot2 패키지에는 미국 동북중부 437개 지역의
# 인구통계 정보를 담은 midwest 라는 데이터가 들어있습니다.
# midwest 데이터를 사용해 데이터 분석 문제를 해결하시오
# 1. poptotal 변수를 total 로, popasian 변수를
# asian 으로 수정하세요
# 2. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구
# 백분율 파생변수를 만들고, 히스토그램을 만들어 도시들이
# 어떻게 분포하는지 살펴보시오.
# 아시아 인구 백분율 전체 평균을 구하고, 평균 초과하고
# 'large' , 그 외에는 'small' 을 부여하는 파생변수를 만드시오.
# 'large' 와 'small'에 해당하는 지역이 얼마나 되는지 
# 빈도표와 빈도 막대 그래프를 만들어 확인해 보세요.
library(ggplot2)
midwest <- as.data.frame(ggplot2::midwest)
head(midwest)
tail(midwest)
midwest$total <- midwest$poptotal
midwest$asian <- midwest$popasian
midwest$total_asia <- (midwest$asia/midwest$total)*100
hist(midwest$total_asia)
summary(midwest)
midwest$sep <- ifelse(midwest$total_asia<mean(midwest$total_asia), 'large', 'small')
table(midwest$sep)
hist(x=midwest$total_asia)
qplot(midwest$sep)
write.csv(midwest, file = "update_midwest.csv")
