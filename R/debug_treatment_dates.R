library(tidyverse)
library(lubridate)
library(jsonlite)
library(tidyjson)
library(rjson)
library(here)

testdata <- read_json(file.path(here('data','example','MostRecentDate.log')), format="jsonl") %>%
  spread_all()

td <- as_tibble(
  testdata %>%
    mutate(datesplit = stringr::str_split(MostRecentTreatmentDate, "T") %>% map_chr(., 1),
           as_Date = as.Date(MostRecentTreatmentDate, optional=TRUE),
           pd = readr::parse_date(MostRecentTreatmentDate),
           ymd = lubridate::ymd(MostRecentTreatmentDate),
           ymd_ds = lubridate::ymd(datesplit, quiet = TRUE),
           ymd_dds = stringr::str_split(MostRecentTreatmentDate, "T") %>% map_chr(., 1) %>% lubridate::ymd(quiet = TRUE),
           ymd_hms = lubridate::ymd_hms(MostRecentTreatmentDate, truncated = 3),
           date_ymdhms = date(ymd_hms),
           lubri_as_date = lubridate::as_date(MostRecentTreatmentDate),
           parse_date = lubridate::parse_date_time(MostRecentTreatmentDate, orders = c("Ymd", "Y0m0d","ymd HMS"))
    )
)
td

