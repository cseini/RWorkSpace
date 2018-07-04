
# soccer 30 바차트
win_count<-function(){
df_win_count <- dbGetQuery(conn, "SELECT ROWNUM NO, B.*
                           FROM
                           (SELECT 
                           A.WINNER,
                           COUNT(A.WINNER) WIN
                           FROM
                           (SELECT 
                           CASE 
                           WHEN SC.HOME_SCORE > SC.AWAY_SCORE THEN HT.TEAM_NAME
                           WHEN SC.AWAY_SCORE > SC.HOME_SCORE THEN AT.TEAM_NAME
                           ELSE '무승부' 
                           END WINNER
                           FROM SCHEDULE SC
                           JOIN TEAM HT
                           ON HT.TEAM_ID LIKE SC.HOMETEAM_ID
                           JOIN TEAM AT
                           ON AT.TEAM_ID LIKE SC.AWAYTEAM_ID
                           WHERE SC.SCHE_DATE LIKE '2012%') A
                           WHERE A.WINNER NOT LIKE '무승부'
                           GROUP BY A.WINNER
                           ORDER BY WIN DESC) B")

return(barplot(df_win_count[,3], main="teams win_count", names.arg=df_win_count[,2] , xlab="tema_name", ylab="win_count", ylim=c(0,15)))
}

#soccer 29 좌석수 파이차트
seat_count <- function(){
df_seat_count <- dbGetQuery(conn, "SELECT ROWNUM NO, A.*
  FROM (SELECT STADIUM_NAME, SEAT_COUNT
                            FROM STADIUM
                            ORDER BY SEAT_COUNT DESC) A
                            ")
  return(pie(df_seat_count[,3], paste(substr(df_seat_count[,2],1,2),df_seat_count[,3])))
}

#soccer 28 점수차 히스토그램
score_diff <- function(){
df_score_diff <- dbGetQuery(conn, "SELECT A.*
                            FROM(SELECT
                            K.SCHE_DATE,
                            HT.TEAM_NAME || ' VS ' || AT.TEAM_NAME,
                            CASE
                            WHEN K.HOME_SCORE >= 
                            K.AWAY_SCORE THEN (K.HOME_SCORE - K.AWAY_SCORE)
                            ELSE K.AWAY_SCORE - K.HOME_SCORE
                            END scorea
                            FROM
                            SCHEDULE K
                            JOIN TEAM HT
                            ON K.HOMETEAM_ID LIKE HT.TEAM_ID
                            JOIN TEAM AT
                            ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
                            WHERE
                            K.SCHE_DATE LIKE '2012%'
                            AND K.GUBUN LIKE 'Y'
                            ORDER BY scorea DESC) A
                            WHERE ROWNUM < 11")
  return(hist(c(df_score_diff$SCOREA),breaks=20,main="팀별 점수차",xlab = "점수차",ylab="경기수", col = "yellow",border = "blue"))
}

# soccer 27 팀별 골키퍼의 평균키로 라인차트(인덱스값을 팀이름으로 치환가능한지 찾아볼것)
gk_height <- function(){
df_gk_height <- dbGetQuery(conn, "select
                           rownum No,
                           b.*
                           from (select
                           (select t2.team_name
                           from team t2
                           where t2.team_id like t.team_id) name,
                           avg(p.height) avg_height
                           from player p
                           join team t
                           on t.team_id like p.team_id
                           where p.position like 'GK'
                           group by t.team_id
                           order by avg_height desc) B

                           ")
  plot(df_gk_height$AVG_HEIGHT,type = "o",main="팀별 골키퍼 평균키", ylab ="평균키", axes=FALSE, ylim=c(170,190), xlab="팀명")
  axis(1, at=1:11,lab=df_gk_height$NAME)
  return(axis(2))
}


# 20 산포도 월별 경기수
count_sche <- function(){
df_count_sche <- dbGetQuery(conn, "SELECT SUBSTR(sche_date,1,6) sche_date,
                            COUNT(gubun) count
                            FROM schedule 
                            WHERE gubun LIKE 'Y'
                            GROUP BY SUBSTR(sche_date,1,6)
                            ORDER BY SUBSTR(sche_date,1,6)
                            ")
  return(plot(x = substr(df_count_sche$SCHE_DATE,5,6),y = df_count_sche$COUNT,
         xlab = "경기월",
         ylab = "경기수",
         ylim=c(0,50),
         main="2012년 월별 경기수",
         type="o"
    ))
}


# SQL30 바차트 : 구단승리순으로 순위매기기
query = "SELECT A.WINNER,
COUNT(A.WINNER) WIN_COUNT
FROM(SELECT
K.SCHE_DATE 경기날짜,
CASE
WHEN K.HOME_SCORE > K.AWAY_SCORE THEN HT.TEAM_NAME
WHEN K.AWAY_SCORE > K.HOME_SCORE THEN AT.TEAM_NAME
ELSE '무승부'
END WINNER
FROM SCHEDULE K
JOIN TEAM HT
ON K.HOMETEAM_ID LIKE HT.TEAM_ID
JOIN TEAM AT
ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
WHERE
K.GUBUN LIKE 'Y'
AND K.SCHE_DATE LIKE '2012%'
)A
WHERE A.WINNER NOT LIKE '무승부'
GROUP BY A.WINNER
ORDER BY WIN_COUNT DESC"
rs <- dbGetQuery(conn, query)
barplot(rs[,2],names.arg=rs[,1], main = "승리수")

     