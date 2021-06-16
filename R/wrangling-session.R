# load up the packages
source(here::here("R/package-loading.R"))

# Briefly glimpse content of dataset
glimpse(NHANES)

select(NHANES, Age)

# Select more columns
select(NHANES, Age, Weight, BMI)

# Exclude a column
select(NHANES, -HeadCirc)

#all columns starting with "BP"
select(NHANES, starts_with("BP"))

#All columns ending with "Day"
select(NHANES, ends_with("Day"))

#All columns that contain "age"
select(NHANES, contains("Age"))

?select_helpers

#Save the selected columns as a new data frame
nhanes_small <- select(NHANES, Age, Gender, Height, Weight, BMI, Diabetes, DiabetesAge,
                       PhysActiveDays, PhysActive, TotChol,
                       BPSysAve, BPDiaAve, SmokeNow, Poverty)

#View the new data frame
nhanes_small

## Renaming
# Rename all columns to snake case
nhanes_small <- rename_with(nhanes_small, snakecase::to_snake_case)

# Renaming specific columns
rename(nhanes_small, sex = gender)

nhanes_small

nhanes_small <- rename(nhanes_small, sex = gender)

nhanes_small

# The pipe operator
#without the pipe operator
colnames(nhanes_small)
#pipe operator: (ctrl. + shift + M)
nhanes_small %>% colnames()

# Using the pipe operator with more functions
nhanes_small %>%
    select(phys_active) %>%
    rename(physically_active = phys_active)

## Summary statistics by group
nhanes_small %>%
    summarise(max_bmi = max(bmi))

nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE))

nhanes_small %>%
    summarise(sum_na = sum(is.na(bmi)))

#calculating 2 summart statistics
nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE),
                            min_bmi = min(bmi, na.rm = TRUE))
