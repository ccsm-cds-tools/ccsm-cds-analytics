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
    mutate(as_Date = as.Date(MostRecentTreatmentDate, optional=TRUE),
           ymd = lubridate::ymd(MostRecentTreatmentDate),
           ymd_hms = lubridate::ymd_hms(MostRecentTreatmentDate, truncated = 3),
           date_ymdhms = date(ymd_hms),
           posixdate = as.POSIXct(MostRecentTreatmentDate, optional=TRUE),
           lubri_as_date = lubridate::as_date(MostRecentTreatmentDate),
           parse_date = lubridate::parse_date_time(MostRecentTreatmentDate, orders = c("Ymd", "Y0m0d","ymd HMS"))
    )
)  
td

x <- c("2023-05-24",
      'February 20th 1973',
       "february  14, 2004",
       "Sunday, May 1, 2000",
       "Sunday, May 1, 2000",
       "february  14, 04",
       'Feb 20th 73',
       "January 5 1999 at 7pm",
       "jan 3 2010",
       "Jan 1, 1999",
       "jan 3   10",
       "01 3 2010",
       "1 3 10",
       '1 13 89',
       "5/27/1979",
       "12/31/99",
       "DOB:12/11/00",
       "-----------",
       'Thu, 1 July 2004 22:30:00',
       'Thu, 1st of July 2004 at 22:30:00',
       'Thu, 1July 2004 at 22:30:00',
       'Thu, 1July2004 22:30:00',
       'Thu, 1July04 22:30:00',
       "21 Aug 2011, 11:15:34 pm",
       "-----------",
       "1979-05-27 05:00:59",
       "1979-05-27",
       "-----------",
       "3 jan 2000",
       "17 april 85",
       "27/5/1979",
       '20 01 89',
       '00/13/10',
       "-------",
       "14 12 00",
       "03:23:22 pm")
guess_formats(testdata$MostRecentTreatmentDate, c("Ymd","ymd","y0md","y0m0d"), print_matches = TRUE)
guess_formats(x, c("Ymd","ymd","y0md","y0m0d"), print_matches = TRUE)
