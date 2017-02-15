# load required libraries
library(tidyr)
library(dplR)
library(dplyr)
library(readr)
library(devtools)

# load source data file
refine_original <- read_csv("/Users/donaldgennetten/Documents/Programing/Springboard_DW_E1/ refine_original.csv")

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
separate_('Product code / number', into = c('product_code','product_number'), sep = "-") %>%
  
# create product category and apply category names
refine_clean$product_category <- refine_clean$product_code %>%
  recode(refine_clean$product_category, p = "Smartphone", v = "TV", x = "Laptop", q = "Tablet") %>%
  
#create full_address for geocoding
unite(full_address, address:country, sep = ',') %>%
  
#create binary variables
mutate(company_philips = ifelse(company == 'philips',1,0)) %>%
mutate(company_akzo = ifelse(company == 'akzo',1,0)) %>%
mutate(company_van_houten = ifelse(company == 'van houten',1,0)) %>%
mutate(company_unilever = ifelse(company == 'unilever',1,0)) %>%
mutate(product_smartphone = ifelse(product_category == 'Smartphone',1,0)) %>%
mutate(product_tv = ifelse(product_category == 'TV',1,0)) %>%
mutate(product_laptop = ifelse(product_category == 'Laptop',1,0)) %>%
mutate(product_tablet = ifelse(product_category == 'Tablet',1,0)) %>%
  
#remove redundant variables
select(-c(company, product_code, product_category))