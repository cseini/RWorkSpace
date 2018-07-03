## stmt 를 합치면 fuction이 된다.
## 4가지 반드시 있어야 fuction 이 된다... R syntax
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