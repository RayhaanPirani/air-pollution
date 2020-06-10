pollutantmean <- function(directory, pollutant, id = 1:332) {
    pollutant_df <- NULL
    for(i in id) {
        file_path <- file.path(directory, paste0(sprintf("%03d", i), '.csv'))
        df <- read.csv(file_path)
        pollutant_df <- rbind(pollutant_df, df[pollutant])
    }
    colMeans(pollutant_df, na.rm = TRUE)[[pollutant]]
}