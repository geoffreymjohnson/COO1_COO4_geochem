#windstress
cols <- c("yearday", "ws", "cum.ws")
colTypes <- c("numeric","numeric","numeric")
years_ws <- seq(1985,2015)
ws_years <- list()
path_dir <- ("upwelling/")
ws_list <- list.files(path_dir)
for (i in 1:31) { 
  ws_years[[i]] <- read.table(paste(path_dir, ws_list[i], sep="", collapse = ""), header = FALSE,  quote = "\"'",
                              dec = ".", numerals = c("no.loss"), col.names = cols, 
                              na.strings = "NaN", colClasses = colTypes,
                              skip = 0, 
                              strip.white = FALSE, blank.lines.skip = TRUE,
                              comment.char = "#",
                              allowEscapes = FALSE, flush = FALSE,
                              skipNul = FALSE)
  
}

ws_years

season_length <- list()
for (i in 1:31) { 
  season_length[[i]] <- length(ws_years[[i]][,3][!is.na(ws_years[[i]][,3])])
  
}

plot(years_ws, season_length)


season_sum <- list()
for (i in 1:31) { 
  season_sum[[i]] <- min(ws_years[[i]][,3], na.rm = TRUE)
  
}
plot(years_ws, season_sum, ylim = c(-1, -5))
lines(years_ws, season_sum, ylim = c(-1, -5))


