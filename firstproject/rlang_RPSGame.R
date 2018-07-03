rps <- function(user){
  com <- sample(0:2,1,replace=TRUE)
  return(c(user, com,
    switch (toString(user-com),
            '-1' = "승리",
            '2' = "승리",
            '0' = "무승부",
            '1'= "패배",
            '-2'= "패배"))
    )
}
res <- rps(0)
cat("USER:",res[1]," COM:",res[2],"USER",res[3])

