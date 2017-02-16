# load required libraries
library(tidyr)
library(dplR)
library(dplyr)
library(readr)
library(devtools)

# load source data file
refine_original <- read_csv("/Users/donaldgennetten/Documents/Programing/Springboard/ refine_original.csv")

# define output file
refine_clean <- refine_original %>%
  
# standardize companies / fix misspellings
mutate(company = tolower(company)) %>%
mutate(company = sub('ph.*','philips',company)) %>%
mutate(company = sub('fil.*','philips',company)) %>%
mutate(company = sub('ak.*','akzo',company)) %>%
mutate(company = sub('van.*','van houten',company)) %>%
mutate(company = sub('uni.*','unilever',company)) %>%
  
# separate product_code and product_number then join product_categories
separate('Product code / number', into = c('product_code','product_number'), sep = "-") 
refine_clean$product_category <- refine_clean$product_code
refine_clean$product_category <- sub("[p]", "Smartphone", refine_clean$product_category) 
refine_clean$product_category <- sub("[v]", "TV", refine_clean$product_category) 
refine_clean$product_category <- sub("[x]", "Laptop", refine_clean$product_category) 
refine_clean$product_category <- sub("[q]", "Tablet", refine_clean$product_category) 

#create full_address for geocoding
refine_clean <- unite(refine_clean, full_address, address, city, country, sep = ", ", remove = FALSE)

#create binary variables
refine_clean <- mutate(refine_clean, company_philips = ifelse(company == 'philips',1,0)) 
refine_clean <- mutate(refine_clean, company_akzo = ifelse(company == 'akzo',1,0)) 
refine_clean <- mutate(refine_clean, company_van_houten = ifelse(company == 'van houten',1,0)) 
refine_clean <- mutate(refine_clean, company_unilever = ifelse(company == 'unilever',1,0)) 
refine_clean <- mutate(refine_clean, product_smartphone = ifelse(product_category == 'Smartphone',1,0)) 
refine_clean <- mutate(refine_clean, product_tv = ifelse(product_category == 'TV',1,0)) 
refine_clean <- mutate(refine_clean, product_laptop = ifelse(product_category == 'Laptop',1,0)) 
refine_clean <- mutate(refine_clean, product_tablet = ifelse(product_category == 'Tablet',1,0)) 