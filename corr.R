corr <- function(directory, threshold = 0) {
    complete_df <- complete("specdata")
    cases <- c(complete_df[complete_df[['nobs']] > threshold, ][id])$id
    #sulfate_df <- NULL
    #nitrate_df <- NULL
    corr_df <- NULL
    for(i in cases) {
        file_path <- file.path(directory, paste0(sprintf("%03d", i), '.csv'))
        df <- read.csv(file_path)
        df <- df[complete.cases(df), ]
        corr_df <- rbind(corr_df, cor(df['sulfate'], df['nitrate']))
        #sulfate_df <- rbind(sulfate_df, df['sulfate'])
        #nitrate_df <- rbind(nitrate_df, df['nitrate'])
    }
    result <- c(corr_df)
    if(is.null(result)) {
        return(numeric())
    }
    else {
        return(result)
    }
}