complete <- function(directory, id = 1:332) {
    complete_df <- NULL
    for(i in id) {
        file_path <- file.path(directory, paste0(sprintf("%03d", i), '.csv'))
        df <- read.csv(file_path)
        complete_cases = sum(complete.cases(df))
        complete_cases_df = data.frame(id = i, nobs = complete_cases)
        complete_df <- rbind(complete_df, complete_cases_df)
    }
    complete_df
}