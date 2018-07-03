rownames <- c("row1", "row2","row3","row4","row5")
colnames <- c("col1", "col2","col3","col4","col5")
M <- matrix(c(1:25), nrow = 5, ncol =5, byrow = TRUE, dimnames=list(rownames,colnames))
print(M)

N <- matrix(c(1:25), nrow = 5, ncol =5)
print(N)

x <-c(1,2)
cat(x)
x<-append(x,3)
cat(x)

##
n<-1
for(i in 1:8)
{
 n<-n*2
}
cat(n)

##
x=c()
x[1]=1
cat(x)
for(i in 2:5)
{
  x[i]=i
}
cat(x)

## left triangle
mat <- matrix(c(1,0,0,0,0), ncol=5)
mat1 <- rbind(mat, c(2,3,0,0,0,0))
mat2 <- rbind(mat1, c(4:6,0,0))
mat3 <- rbind(mat2, c(7:10,0))
mat4 <- rbind(mat3, c(11:15))
print(mat4)

left <- function(){
  left <- matrix(c(1,0,0,0,0), ncol=5)
  left1 <- matrix(c(2,3,0,0,0), ncol=5)
  left2 <- matrix(c(4:6,0,0), ncol=5)
  left3 <- matrix(c(7:10,0), ncol=5)
  left4 <- matrix(c(11:15), ncol=5)
  return(rbind(left,left1,left2,left3,left4))
}
left()


## zigzag
zigzag <- function(){
  zig <- matrix(c(1:5), ncol=5)
  zig1 <- matrix(c(10:6), ncol=5)
  zig2 <- matrix(c(11:15), ncol=5)
  zig3 <- matrix(c(20:16), ncol=5)
  zig4 <- matrix(c(21:25), ncol=5)
  return(rbind(zig,zig1,zig2,zig3,zig4))
}
zigzag()

##diamond
diamond <- function(){
  dia <- matrix(c(0,0,1,0,0), ncol=5)
  dia1 <- matrix(c(0,2:4,0), ncol=5)
  dia2 <- matrix(c(5:9), ncol=5)
  dia3 <- matrix(c(0,10:12,0), ncol=5)
  dia4 <- matrix(c(0,0,13,0,0), ncol=5)
  return(rbind(dia,dia1,dia2,dia3,dia4))
}
diamond()

num <- 2
switch(num,
 '1' = left(),
 '2' = zigzag(),
 '3' = diamond()
)
for(i in 1:5)
{
  cat(i)  
}

## ZIGZAG EASY
matrix(c(1:5,10:6,11:15,20:16,21:25), nrow=5, ncol=5,byrow=TRUE)

x <- matrix(nrow=5,ncol=5)
a <- a+1
for(i in 1:5)
{
  for(j in 1:5){
    x[i,j] <- a
  }
}
print(x)

