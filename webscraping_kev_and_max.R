## Max Miller-Golub and Kev Okogu

library(tidyverse)
library(rvest)

url = "https://www.american.edu/cas/mathstat/faculty/"
html = read_html(url)
class(html)

## Get faculty names
faculty_names = html %>% html_elements(".profile-name span") %>% html_text2()

## Get entire groupings of html for NA values
email_and_numbers = html %>% html_elements(".flex-3")

## Get emails
emails = email_and_numbers %>% html_element(".profile-email span") %>% html_text()

## Get numbers
phone_numbers = email_and_numbers %>% html_element(".profile-phone span") %>% html_text2()

## Put it all together
math_faculty_csv <- tibble(names = faculty_names,
       emails = emails,
       phone_numbers = phone_numbers)

math_faculty_csv


write.table(math_faculty_csv, file = "faculty.csv")