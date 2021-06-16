# Load the packages
source(here::here("R/package-loading.R"))

# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES

nhanes_small %>%
    select(tot_chol, bp_sys_ave, poverty)

nhanes_small %>%
    rename(diabetes_diagnosis_age = diabetes_age)

nhanes_small %>%
    select(bmi, contains("age"))

nhanes_small %>%
    select(phys_active_days, phys_active) %>%
    rename(days_phys_active = phys_active_days)

#Filtering
#Filter for all females

nhanes_small %>%
    filter(sex == "female")

nhanes_small %>%
    filter(sex != "female")

#Paticipants that has a BMI that equals to 25
nhanes_small %>%
    filter(bmi == 25)

nhanes_small %>%
    filter(bmi>= 25)

#BMI greater than 25 and teh sex is female
nhanes_small %>%
    filter(bmi > 25 & sex == "female")

#BMI is greater than 25 OR sex is female
nhanes_small %>%
    filter(bmi > 25 | sex == "female")

## Arranging  data
# Arranging by age
nhanes_small %>%
    arrange(age)

# Arranging the sex variable
nhanes_small %>%
    arrange(sex)

#Arranging by age in decending order
nhanes_small %>%
    arrange(desc(age))

#arranging ny sex then age in ascending order
nhanes_small %>%
    arrange(sex, age)

nhanes_small %>%
    arrange(desc(sex), age)

## Transform or add columns
nhanes_small %>%
    mutate(height = height / 100)

# Add a new column with logged height values
nhanes_small %>%
    mutate(logged_height = log(height))

#Transform height values to metres and add log column
nhanes_small %>%
    mutate(height = height / 100,
           logged_height = log(height))

nhanes_small %>%
    mutate(highly_active = if_else(phys_active_days >= 5, "Yes", "No"))

nhanes_update <- nhanes_small %>%
    mutate(height = height /100,
           logged_height = log(height),
           highly_active = if_else(phys_active_days >= 5, "Yes", "No"))
str(nhanes_update)


# 1.
nhanes_small %>%
    summarise(mean_weight = mean(weight, na.rm = TRUE),
              mean_age = mean(age, na.rm = TRUE))

# 2.
nhanes_small %>%
    summarise(max_height = max(height, na.rm = TRUE),
              min_height = min(height, na.rm = TRUE))

# 3.
nhanes_small %>%
    summarise(median_age = median(age, na.rm = TRUE),
                 median_phys_active_days = median(phys_active_days, na.rm = TRUE))
