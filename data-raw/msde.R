library(tidyverse)
library(getdata)

# school_names <- distinct(select(msde_enrollment, school_number, school_name, lss_name))# |>
# school_names |>
#   filter(
#     school_number %in% filter(count(school_names, school_number), n > 1)$school_number
#   ) |>
#   View()


fix_lss <- function(data) {
  mutate(
    data,
    lss_number = coalesce(lea_number, lss_number),
    lss_name = coalesce(lea_name, lss_name),
    lss_name = case_when(
      lss_name == "Baltimore City - Edison" ~ "Baltimore City",
      lss_name == "Seed School LEA" ~ "SEED School of Maryland",
      lss_name == "SEED" ~ "SEED School of Maryland",
      lss_name == "All Public Schools" ~ "State",
      TRUE ~ lss_name
    ),
    lss_number = case_when(
      lss_number == "A" ~ NA_integer_,
      TRUE ~ suppressWarnings(as.integer(lss_number))
    )
  ) |>
    relocate(
      all_of(c("lss_name", "lss_number")),
      .after = everything()
    ) |>
    select(-c(lea_number, lea_name))
}

fix_school_name <- function(data) {
  data |>
    getdata::replace_with_xwalk(
      .cols = "school_name",
      dict = tibble::tribble(
        ~revised, ~name,
        "Commodore John Rodgers Elementary/Middle", "Commodore John Rogers Elementary/Middle",
        "Commodore John Rodgers Elementary", "Commodore John Rogers Elementary",
        "Highlandtown Elementary #237", "Highlandtown Elementary #0237",
        "A. Mario Loiederman Middle", "A. Mario Loiderman Middle",
        "All SEED School of Maryland Schools", "All SEED Schools",
        "Ballenger Creek Middle", "Ballenger Creek Middle School",
        "Baltimore Civitas", "Baltimore CIVITAS",
        "Baltimore I.T. Academy", "Baltimore IT Academy",
        "Cambridge-South Dorchester High", "Cambridge-South Dorchester High School",
        "Carroll Creek Montessori Public Charter", "Carroll Creek Montessori Public Charter School",
        "Isaac J. Gourdine Middle", "Isaac J. Gourdine Middle School",
        "Dallas F. Nicholas, Sr. Elementary", "Dallas F. Nicholas Sr. Elementary",
        "Dallas F. Nicholas, Sr. Elementary", "Dallas F. Nicholas, Sr., Elementary",
        "Calverton Elementary/Middle", "Calverton",
        "Washington High", "Washington High School",
        "Martin Luther King Jr. Middle", "Martin Luther King Jr. Middle School",
        "Vienna Elementary", "Vienna Elementary School",
        "Hallie Wells Middle", "Hallie Wells Middle School",
        "Wilson Wims Elementary", "Wilson Wims Elementary School",
        "KIPP Harmony Academy", "Kipp Harmony",
        "KIPP Harmony Academy", "K.I.P.P. Harmony",
        "KIPP Harmony Academy", "KIPP Academy",
        "Bluford Drew Jemison STEM Academy West", "Bluford Drew Jemison Stem Academy West",
        "N.A.C.A. Freedom and Democracy Academy II", "Naca Freedom and Democracy Academy II",
        "Vanguard Collegiate Middle", "Vanguard Collegiate Middle School",
        "City Neighbors High", "City Neighbors High School",
        "The REACH! Partnership School", "The Reach! Partnership School",
        "The REACH! Partnership School", "Reach! Partnership School",
        "The REACH! Partnership School", "The Reach Partnership School",
        "The REACH! Partnership School", "Reach",
        "The REACH! Partnership School", "REACH",
        "James McHenry Elementary", "James Mchenry Elementary",
        "James McHenry Elementary", "James Mc Henry Elementary",
        "Dr. Nathan A. Pitts-Ashburton Elementary/Middle", "Dr. Nathan A. Pitts Ashburton Elementary/Middle",
        "Walter J. Mitchell Elementary", "Walter J. Mitchell Elementary School",
        "Mary H. Matula Elementary School", "Mary Matula Elementary School",
        "Warwick Elementary", "Warwick Elementary School",
        "Heather Ridge Middle", "Heather Ridge Middle School",
        "North Dorchester Middle", "North Dorchester Middle School",
        "Gladys Noon Spellman Elementary", "Gladys N. Spellman Elementary",
        "Monocacy Valley Montessori", "Monocacy Valley Montessori School",
        "Dr. Bernard Harris, Sr. Elementary", "Dr. Bernard Harris, Sr., Elementary",
        "Dr. Martin Luther King, Jr. Elementary/Middle", "Dr. Martin Luther King, Jr., Elementary/Middle",
        "City Neighbors Charter School", "City Neighborhood Charter School",
        "K.A.S.A. (Knowledge and Success Academy)", "Kasa (Knowledge And Success Academy)",
        "Hampden Elementary/Middle", "Hampden",
        "Francis Scott Key High", "Francis Scott Key Sr. High"
      )
    ) |>
    mutate(
      school_name = case_when(
        (year < 2005) & (school_name == "Highlandtown Elementary") & (school_number == 215) ~ "Highlandtown Elementary #215",
        (year < 2005) & (school_name == "Highlandtown Elementary") & (school_number == 237) ~ "Highlandtown Elementary #237",
        .default = school_name
      ),
      school_name = stringr::str_replace(school_name, " The Arts", " the Arts"),
      school_name = stringr::str_replace(school_name, " Dubois ", " DuBois "),
      school_name = stringr::str_replace(school_name, "Connexions ", "ConneXions "),
      school_name = stringr::str_replace(school_name, "/O'Donnel ", "/O'Donnell "),
      school_name = stringr::str_replace(school_name, "^Md ", "MD "),
      school_name = stringr::str_replace(school_name, "^Mcps ", "MCPS "),
      school_name = stringr::str_replace(school_name, " For ", " for "),
      school_name = stringr::str_replace(school_name, " And ", " and "),
      school_name = stringr::str_replace(school_name, " @ ", " at "),
      school_name = stringr::str_replace(school_name, " To ", " to "),
      school_name = stringr::str_replace(school_name, " Of ", " of "),
      school_name = stringr::str_replace(school_name, " (Jacs)", " (JACS)"),
      school_name = stringr::str_replace(school_name, " Mst ", " MST "),
      school_name = stringr::str_replace(school_name, " W.F. ", " W. F. "),
      school_name = stringr::str_replace(school_name, "Mccormick ", "McCormick "),
      school_name = stringr::str_replace(school_name, " Mcnair ", " McNair "),
      school_name = stringr::str_replace(school_name, " A. McNair", " E. McNair "),
      school_name = stringr::str_replace(school_name, " Mckinsey ", " McKinsey "),
      school_name = stringr::str_replace(school_name, " Mcauliffe ", " McAuliffe "),
      school_name = stringr::str_replace(school_name, " Mcdonough ", " McDonough "),
      school_name = stringr::str_replace(school_name, " Mcmechen", " McMechen")
    )
}

msde_enrollment <-
  tibble(path = list.files("data-raw/extdata", full.names = TRUE)) %>%
  filter(str_detect(path, "Enrollment_")) %>%
  mutate(
    data = map(
      path,
      ~ read_csv(.x, col_types = cols(.default = "c"))
    )
  ) %>%
  unnest(data) %>%
  janitor::clean_names("snake") %>%
  mutate(
    year = as.integer(coalesce(academic_year, year)),
    school_number = coalesce(school_number, school),
    grade = coalesce(grade, grade_title),
    date_created = as.Date(create_date, format = "%Y%m%d"),
    school_number = case_when(
      school_number == "A" ~ 0L,
      TRUE ~ suppressWarnings(as.integer(school_number))
    ),
    race = case_when(
      race == "Two or More Races" ~ "Two or more races",
      race == "Hispanic/Latino of Any Race" ~ "Hispanic/Latino of any race",
      !is.na(race) ~ race,
      TRUE ~ "All"
    ),
    grade_range = grade,
    grade_range = case_when(
      grade == "Total Enrollment" | is.na(grade) ~ "All Grades",
      grade == "Elementary" ~ "All Elementary Grades",
      grade == "Middle School" ~ "All Middle School Grades",
      grade == "High School" ~ "All High School Grades",
      grade == "All Prekindergarten" ~ "Prekindergarten",
      grade == "Prekindergarten Age 4" ~ "Prekindergarten",
      grade == "All Kindergarten" ~ "Kindergarten",
      TRUE ~ grade_range,
    ),
    grade = case_when(
      str_detect(grade, "Grade[:space:]") ~ str_remove(grade, "Grade[:space:]"),
      grade %in% c("Prekindergarten Age 4", "Prekindergarten", "All Prekindergarten") ~ "PK",
      grade %in% c("Kindergarten", "All Kindergarten") ~ "K",
      TRUE ~ "*"
    )
  ) %>%
  naniar::replace_with_na(list(grade = "*", enrolled_count = "*")) %>%
  mutate(
    enrolled_count = as.integer(enrolled_count)
  ) %>%
  fix_lss() |>
  select(year, school_number, school_name, enrolled_count, grade, grade_range, race, date_created, lss_number, lss_name) %>%
  arrange(lss_number, desc(year), school_number) |>
  distinct(.keep_all = TRUE)

msde_enrollment <- fix_school_name(msde_enrollment)

usethis::use_data(msde_enrollment, overwrite = TRUE)

# Student mobility data ----
msde_student_mobility <- list.files("data-raw/extdata", full.names = TRUE) %>%
  tibble(path = .) %>%
  filter(str_detect(path, "Student_Mobility_")) %>%
  mutate(data = map(
    path,
    ~ read_csv(.x, col_types = cols(.default = "c"))
  )) %>%
  unnest(data) %>%
  janitor::clean_names("snake") %>%
  mutate(
    school_number = case_match(
      school_number,
      "A" ~ 0L,
      .default = suppressWarnings(as.integer(school_number))
    ),
    year = as.integer(academic_year),
    mobility_pct = coalesce(mobility_pct, mobility_rate),
    mobility_count = coalesce(mobility_cnt, mobility_count),
    entrants_pct = coalesce(entrants_pct, entrants_rate),
    entrants_count = coalesce(entrants_cnt, entrants_count),
    withdrawals_pct = coalesce(withdrawals_pct, withdrawals_rate),
    withdrawals_count = coalesce(withdrawals_cnt, withdrawals_count),
    avg_daily_member_count = coalesce(avg_daily_member_cnt, avg_daily_member_count, average_daily_member_count)
  ) %>%
  relocate(year, .before = everything()) |>
  fix_lss() |>
  select(-c(
    path, academic_year,
    # create_date,
    mobility_rate, mobility_cnt,
    entrants_rate, entrants_cnt,
    withdrawals_rate, withdrawals_cnt,
    avg_daily_member_cnt, average_daily_member_count
  )) %>%
  mutate(
    across(
      c(ends_with("_count"), ends_with("_pct")),
      ~ case_when(
        .x == "<= 5.0" ~ as.character("5.0"),
        .x == ">= 95.0" ~ as.character("95.0"),
        TRUE ~ .x
      )
    )
  ) %>%
  naniar::replace_with_na_all(condition = ~ .x == "*") |>
  mutate(
    across(c(ends_with("_pct"), all_of("avg_daily_member_count")), as.numeric),
    across(all_of(c("mobility_count", "entrants_count", "withdrawals_count")), as.integer)
  ) |>
  rename(
    mobile_pct = mobility_pct,
    exit_pct = withdrawals_pct,
    entry_pct = entrants_pct,
    avg_enrolled_count = avg_daily_member_count,
    mobile_count = mobility_count,
    exit_count = withdrawals_count,
    entry_count = entrants_count
  ) |>
  arrange(lss_number, desc(year), school_number)

msde_student_mobility <- fix_school_name(msde_student_mobility) |>
  mutate(
    create_date = lubridate::as_date(create_date)
  ) |>
  rename(
    date_created = create_date
  ) |>
  relocate(
    date_created,
    .before = lss_number
  )

usethis::use_data(msde_student_mobility, overwrite = TRUE)

# Attendance data ----

msde_attendance <- list.files("data-raw/extdata", full.names = TRUE) %>%
  tibble(path = .) %>%
  filter(str_detect(path, "Attendance_")) %>%
  mutate(data = map(
    path,
    ~ read_csv(.x, col_types = cols(.default = "c"))
  )) %>%
  unnest(data) %>%
  janitor::clean_names("snake") %>%
  mutate(
    year = as.integer(academic_year),
    school_number = if_else(school_number == "A", 0L, as.integer(school_number))
  ) %>%
  relocate(
    year,
    .before = everything(),
  ) |>
  relocate(
    create_date,
    .after = everything()
  ) |>
  fix_lss() |>
  select(-c(path, academic_year)) %>%
  mutate(
    across(
      where(is.character),
      ~ case_when(
        .x == "<= 5.0" ~ as.character("5.0"),
        .x == ">= 95.0" ~ as.character("95.0"),
        TRUE ~ .x
      )
    )
  ) %>%
  rename_with(
    ~ stringr::str_replace(.x, "_cnt", "_count"),
    .cols = contains("_cnt")
  ) |>
  naniar::replace_with_na_all(condition = ~ .x == "*") %>%
  mutate(
    across(
      c(contains("_count"), contains("_pct"), contains("_denom")),
      as.numeric
    )
  ) |>
  arrange(lss_number, desc(year), school_number) |>
  mutate(
    create_date = lubridate::as_date(create_date),
    school_type = case_match(
      school_type,
      "All" ~ "All Grades",
      "All Students" ~ "All Grades",
      "Elementary" ~ "All Elementary Grades",
      "Middle" ~ "All Middle School Grades",
      "High" ~ "All High School Grades",
      .default = school_type
    )
  ) |>
  rename(
    date_created = create_date,
    grade_range = school_type
  )

msde_attendance <- fix_school_name(msde_attendance)

usethis::use_data(msde_attendance, overwrite = TRUE)
