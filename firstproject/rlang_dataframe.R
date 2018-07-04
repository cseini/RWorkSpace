grade <- function(name,kor,eng,math){
  x <- c(kor,eng,math)
  return(c(name,
           sum(x),
           round(mean(x),1),
           switch(
             toString(avg%/%10),
             '10' = 'A',
             '9' = 'A',
             '8' = 'B',
             '7' = 'C',
             '6' = 'D',
             '5' = 'E',
             'F')))
}
res<-grade('홍길동',98,90,80)
cat(' ****************************\n',
    '|  이름  | 총점 | 평균 | 등급 |',
    '\n ---------------------------\n',
    '|',res[1],'|',res[2],'|',res[3],'| ',res[4],' |',
    '\n ****************************')

park <- grade('박지성',70,70,70)
park[2]
park
class(park[1])
class(park[2])
class(park[3])
class(park[4])

##data frame 개선
grade <- function(name,kor,eng,math){
  x <- c(kor,eng,math)
  return(list(name=name,
              kor=kor,
              eng=eng,
              math=math,
             sum=sum(x),
             mean=round(mean(x),1),
             grade=switch(
               toString(round(mean(x),1)%/%10),
               '10' = 'A',
               '9' = 'A',
               '8' = 'B',
               '7' = 'C',
               '6' = 'D',
               '5' = 'E',
               'F')))
}

park <- grade('박지성',80,80,80)
kim <- grade('김지성',50,60,40)
choi <- grade('최용수',80,90,100)
lee <- grade('이천수',70,85,95)
an <- grade('안정환',100,95,90)
result <- rbind(park,kim,choi,lee,an)
result
std_data <- data.frame(
  name = c(park$name,kim$name,choi$name,lee$name,an$name),
  kor = c(park$kor,kim$kor,choi$kor,lee$kor,an$kor),
  eng = c(park$eng,kim$eng,choi$eng,lee$eng,an$eng),
  math = c(park$math,kim$math,choi$math,lee$math,an$math),
  sum = c(park$sum,kim$sum,choi$sum,lee$sum,an$sum),
  mean = c(park$mean,kim$mean,choi$mean,lee$mean,an$mean),
  grade = c(park$grade,kim$grade,choi$grade,lee$grade,an$grade),
  stringsAsFactors = FALSE
)
print(std_data)
data.frame(std_data$name,std_data$sum)

#pie
pie(std_data$mean,paste(std_data$name,std_data$mean),main="학생별평균")

# 바차트
barplot(std_data$mean,names.arg=std_data$name, main="학생별 평균", xlab="name", ylab="mean", col="red", border="blue")

##히스토그램
hist(c(std_data$mean), xlab = "점수", ylab ="가중치", col = "yellow",border = "blue", main="평균 히스토그램")

##라인차트
plot(std_data$mean,type = "o")
##분포도차트
input <- mtcars[,c('wt','mpg')]
print(input)
plot(x = input$wt,y = input$mpg,
     xlab = "Weight",
     ylab = "Milage",
     xlim = c(2.5,5),
     ylim = c(15,30),		 
     main = "Weight vs Milage"
)
## 주식차트
input <- mtcars[,c('mpg','cyl')]
print(head(input))
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon", main = "Mileage Data")






# Create the data frame.
emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  salary = c(623.3,515.2,611.0,729.0,843.25), 
  
  start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11",
                         "2015-03-27")),
  stringsAsFactors = FALSE
)
# Print the data frame.			
print(emp.data) 
