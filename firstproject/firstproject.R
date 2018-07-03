?solve

#java int a = 3;
#System.out.print(a);
a <- 3
c <- a+b
c

x <- c(10, 5, 3, 6, 21)
c(10, 5, 3, 6, 22) ->  x

sum(x-mean(x)^2)/(length(x)-1)

## if - else
user <- sample(0:2,1,replace=TRUE)
com <- sample(0:2,1,replace=TRUE)
if(user-com==0) print("무승부") else
  if(user-com==-1 || user-com==2) print("승리") else
    print("패배")

## switch - case
user <- sample(0:2,1,replace=TRUE)
com <- sample(0:2,1,replace=TRUE)
cat('컴퓨터 :',com)
cat('유저 :',user)
res <- toString(user-com)
cat('결과 : ',res)
x <- switch (
  res,
  '-1' = "승리",
  '2' = "승리",
  '0' = "무승부",
  '1'= "패배",
  '-2'= "패배"
)
print(x)



# vector 사용법
print(c(1:10))
print(seq(from=1,to=10,by=2))
print(seq(from=1,length=10,by=2))
print(seq(1,10,2))
print(seq(1:5))
print(rep(1:5))
print(rep(1:5, each=2))
print(rep(1:5, times=2))
print(rep(1:5, each=2, times=3))
print(rep(1:5, times=3, each=2))
print(rep(1:5, times=3,each=2,len=5))
print(rep(1:5, each=2,times=3,len=5))

#기본타입 : character, wide character, integer,
            #floating point, double floating point, Boolean
#R-Objects : Vector, List, Matrix, Array, Factor, Data Frame 
#Vector의 6개 타입 : Logical(T,F), Numeric(실수), Integer(정수)
                    #Complex(허수), Character(문자), Raw(주소값)

num1 <- 5
num2 <- 5
opcode <- '%/%'
cat(num1, opcode, num2, '=',
    switch(opcode,
          '+' = num1+num2,
          '-' = num1-num2,
          '*' = num1*num2,
          '/' = num1/num2,
          '%%' = num1%%num2,
          '%/%' = num1%/%num2
          )
)
# 1~5까지 더하되 마지막엔 '='
v <- 1:5
for (i in v) 
  if(i<max(v)) cat(i,'+ ') else
    cat(i,'=',sum(v))

for (i in 1:5)
  if(i<5) cat(i,'+ ') else
    cat(i,'=',sum(1:5))






