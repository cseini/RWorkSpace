# 1-2+3-4+5.............-100=-50
for(i in 1:100){
  if(i==100)
    cat(i, "=",sum(seq(1,100,2))-sum(seq(2,100,2)))
  else if(i%%2==1) cat(i,"- ")
  else
    cat(i,"+ ")
}

for(i in 1:100){
  if(i==100)
    cat(i,"=",sum(seq(1,100,2))-sum(seq(2,100,2)))
  else
    switch (toString(i%%2),
            '0' = cat(i,"+ "),
            '1' = cat(i,"- ")
    )
}