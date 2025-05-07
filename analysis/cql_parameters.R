# CQL Parameters
# This defines values passed as CQL parameters to the CDS used to generate the
# recommendations for patients. These will affect how to interpret the logged
# data from the CDS for these patients.
# Time intervals and dates should follow conventions used by the 
# package 'lubridate'

library(lubridate)

cql_parameters <- list(
  AbnormalTestLookbackPeriod = years(8),
  AllowGradeDExclusion = true,
  AllowGradeDRecommendation = true,
  BiopsyLookbackPeriod = years(25),
  BiopsyReferralPeriod = years(1),
  BirthdayThreshold = ymd('1980-01-01'),
  CervicalCytologyLookbackDate = ymd('2017-04-04'),
  CervicalCytologyLookbackPeriod = years(10),
  CervicalPrecancerTreatmentLookback = years(7),
  CotestingCadence = years(5),
  CytologyTestingCadence = years(3),
  CytologyWindow = months(18),
  ExcludeSymptomatic = true,
  GradeDAdequatePriorScreeningLookback = years(10),
  HpvTestingGracePeriod = months(6),
  HrHPVLookbackDate = ymd('1900-01-01'),
  HrHPVLookbackPeriod = years(10),
  ManageTreatmentWithoutPreviousBiopsy = true,
  MedicationLookbackPeriod = months(6),
  MinimumScreeningAge = years(21),
  PrimaryHpvTestingCadence = years(5),
  RarelyScreenedGracePeriod = months(6),
  SymptomaticLookBack = days(1)
)