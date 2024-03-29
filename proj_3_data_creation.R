library(dplyr)

# Read the CSV file
path_way <- '/Users/williamberritt/Downloads/ds_salaries.csv'
df1 <- read.csv(path_way)

# Create a new column 'cid' by concatenating several columns
df1$cid <- paste(df1$employee_residence, df1$remote_ratio, df1$company_location, df1$company_size, sep='_')

# Subset data to select specific columns
company_ids <- subset(df1, select=employee_residence:company_size)

# Remove duplicate rows from 'company_ids'
company_ids <- company_ids |> distinct()

# Create a new column 'cid' by concatenating several columns in 'company_ids'
company_ids$cid <- paste(company_ids$employee_residence, company_ids$remote_ratio, company_ids$company_location, company_ids$company_size, sep='_')

# Subset data to select specific columns
job_dets <- subset(df1, select=work_year:salary_in_usd)

# Assign the 'cid' column from 'df1' to 'job_dets'
job_dets$cid <- df1$cid

# Write 'job_dets' dataframe to a CSV file without row names
write.csv(job_dets, "clean_job_dets.csv", row.names=FALSE)

# Write 'company_ids' dataframe to a CSV file without row names
write.csv(company_ids, "clean_company_ids.csv", row.names=FALSE)
