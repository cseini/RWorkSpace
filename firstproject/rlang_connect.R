sql <-
"select p.player_name NAME, p.height HEIGHT
  from player p
    join team t 
      on t.team_id like p.team_id 
where t.team_id like 'K02' 
AND HEIGHT >=185"
dbGetQuery(conn, sql)
