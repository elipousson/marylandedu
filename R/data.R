
#' Maryland Public School Attendance (SY 2003-2022)
#'
#' Attendance data from the Maryland State Department of Education (MSDE). The
#' original CSV data files downloaded from MSDE are available in the
#' `data-raw/extdata` folder on the GitHub repo for the package. Any percent
#' variables with a value of 95 percent should be interpreted as equivalent at
#' or above 95 percent. Any percent variables with a value of 5 percent should
#' be interpreted as equivalent to at or below 5 percent. Chronic absenteeism
#' data is not available prior to 2018 when the federal Every Student Succeeds
#' Act (passed in 2015) went into effect and Maryland began to include the
#' chronic absenteeism rate in the state's annual academic report cards.
#' Variable definitions are based on the [definitions from the MSDE
#' website](https://reportcard.msde.maryland.gov/Definitions/Index).
#'
#' @format A data frame with 33,376 rows and 18 variables:
#' \describe{
#'   \item{`year`}{School year or academic year, e.g. 2019 for 2019-2020
#'   school year}
#'   \item{`school_number`}{School number (0 indicates all schools)}
#'   \item{`school_name`}{School name}
#'   \item{`grade_range`}{Grade range used for attendance details.}
#'   \item{`attend_rate_pct`}{Attendance rate as defined as the average daily
#'   attendance rate of students in the school and grade band, including special
#'   education students}
#'   \item{`days_attended_count`}{Total number of students in attendance from the
#'   first day of school through April 13th}
#'   \item{`days_member_count`}{Total number of students registered to attend from
#'   the first day of school through April 13th}
#'   \item{`fewer_5_pct`}{Percent of students absentee rate is the percentage of
#'   students absent from school for five or fewer days between the first day of
#'   the school year and the last day of the school year}
#'   \item{`fewer_5_count`}{Count of students absentee rate is the percentage of
#'   students absent from school for five or fewer days between the first day of
#'   the school year and the last day of the school year}
#'   \item{`more_20_pct`}{Percent of students absentee rate is the percentage of
#'   students absent from school for twenty or more days between the first day
#'   of the school year and the last day of the school year}
#'   \item{`more_20_count`}{Number of students absentee rate is the percentage of
#'   students absent from school for twenty or more days between the first day
#'   of the school year and the last day of the school year}
#'   \item{`more_90_member_count`}{Number of students with an attendance rate of
#'   90 percent or more}
#'   \item{`chronic_absentee_count`}{Number of students expected to attend school
#'   for at least 10 days who were absent 10 percent or more of the school days
#'   while enrolled at that school}
#'   \item{`chronic_absentee_denom`}{Number of students who are expected to
#'   attend school for at least 10 days in the school year}
#'   \item{`chronic_absentee_pct`}{Chronic absenteeism rate as defined as the
#'   percent of students expected to attend school for at least 10 days who were
#'   absent 10 percent or more of the school days while enrolled at that school}
#'   \item{`date_created`}{Date record created.}
#'   \item{`lss_number`}{Local school system (LSS) number as integer. NA is used
#'   in place of a LSS number for statewide data. Older LEA numbers are combined
#'   with LSS numbers in this dataset.}
#'   \item{`lss_name`}{Local school system (LSS) names (typically same as county
#'   name). "State" is used in place of a LSS name for statewide data. Older LEA
#'   names are combined with LSS names in this dataset.}
#'  }
#' @source [MSDE Data Downloads](https://reportcard.msde.maryland.gov/Graphs/#/DataDownloads/datadownload)
"msde_attendance"

#' Maryland Public School Enrollment (SY 2003-2023)
#'
#' Enrollment data from the Maryland State Department of Education (MSDE). The
#' original CSV data files downloaded from MSDE are available in the
#' `data-raw/extdata` folder on the GitHub repo for the package. The number of enrolled students includes ungraded
#' special education and pre-kindergarten students. Grades coded as
#' "Prekindergarten Age 4" in the MSDE data have been re-coded as
#' "Prekindergarten" to facilitate comparison across years. LEA Names coded as
#' "Baltimore City - Edison" have been re-coded as "Baltimore City", "Seed
#' School LEA" as "SEED", and "All Public Schools" as "State". Variable
#' definitions are based on the [definitions from the MSDE
#' website](https://reportcard.msde.maryland.gov/Definitions/Index). Last
#' updated 2023-10-02.
#'
#' @format A data frame with 237,924 rows and 10 variables:
#' \describe{
#'  \item{`year`}{School or academic year for enrollment count, e.g.
#'    2019 data is from the start of the 2019-2020 school year.}
#'  \item{`school_number`}{School number as integer (0 indicates all
#'  schools)}
#'  \item{`school_name`}{School name}
#'  \item{`enrolled_count`}{Number of students registered to attend the
#'  school at the start of the year in the grade or grade range as integer.
#'  Typically enrollment count is as of September 30.}
#'  \item{`grade`}{Grades from Prekindergarden (PK) to Grade 12}
#'  \item{`grade_range`}{all elementary school Grades, all middle school
#'  grades, all high school grades, or all grades (total enrollment). May also
#'  be used as a label for grade.}
#'   \item{`race`}{Race/ethnicity. Enrollment by race/ethnicity is only
#'   available across all grades for years since 2020. "All" is used for data
#'   prior to 2020.}
#'   \item{`date_created`}{Date record created.}
#'   \item{`lss_number`}{Local school system (LSS) number as integer. NA is used
#'   in place of a LSS number for statewide data. Older LEA numbers are combined
#'   with LSS numbers in this dataset.}
#'   \item{`lss_name`}{Local school system (LSS) names (typically same as county
#'   name). "State" is used in place of a LSS name for statewide data. Older LEA
#'   names are combined with LSS names in this dataset.}
#'  }
#' @source [MSDE Data Downloads](https://reportcard.msde.maryland.gov/Graphs/#/DataDownloads/datadownload)
"msde_enrollment"

#' Maryland Student Mobility (SY 2003-2022)
#'
#' Student mobility data from the Maryland State Department of Education (MSDE).
#' The original CSV data files downloaded from MSDE are available in the
#' `data-raw/extdata` folder on the GitHub repo for the package. Mobility refers
#' to the movement of students from one school to another during the school
#' year. Three types of mobility are calculated using student entrants and
#' student withdrawals: Total student mobility, entry mobility, and exit
#' mobility. Student mobility is the percentage of students that either enter or
#' withdraw from a school during the school year. To calculate student mobility,
#' the number of entrants is added to the number of withdrawals and that sum is
#' divided by the average daily student enrollment.
#'
#' @format A data frame with 33,378 rows and 14 variables:
#' \describe{
#'  \item{`year`}{School or academic year for enrollment count, e.g.
#'    2019 data is from the start of the 2019-2020 school year.}
#'  \item{`school_number`}{School number as integer (0 indicates all
#'  schools)}
#'  \item{`school_name`}{School name}
#'   \item{`school_type`}{School type (e.g. Elementary, Middle, High)}
#'   \item{`mobile_pct`}{Student total mobility rate}
#'   \item{`entry_pct`}{Student entry mobility rate}
#'   \item{`exit_pct`}{Student exit mobility rate}
#'   \item{`mobile_count`}{Sudent entry and exit count}
#'   \item{`entry_count`}{Student entry count}
#'   \item{`exit_count`}{Student exit count}
#'   \item{`avg_enrolled_count`}{Average daily student enrollment.}
#'   \item{`date_created`}{Date record created.}
#'   \item{`lss_number`}{Local school system (LSS) number as integer. NA is used
#'   in place of a LSS number for statewide data. Older LEA numbers are combined
#'   with LSS numbers in this dataset.}
#'   \item{`lss_name`}{Local school system (LSS) names (typically same as county
#'   name). "State" is used in place of a LSS name for statewide data. Older LEA
#'   names are combined with LSS names in this dataset.}
#' }
#' @source [MSDE Data Downloads](https://reportcard.msde.maryland.gov/Graphs/#/DataDownloads/datadownload)
"msde_student_mobility"


#' Maryland Local School System-County Crosswalk
#'
#' A data frame that can be used as a crosswalk between Maryland Local School
#' System (LSS) names and numbers and county-level identifiers from the U.S.
#' Census Bureau.
#'
#' @format A data frame with 25 rows and 7 variables:
#' \describe{
#'   \item{`lss_number`}{Local school system (LSS) number as integer.}
#'   \item{`lss_name`}{Local school system (LSS) names.}
#'   \item{`countyfp`}{County FIPS code.}
#'   \item{`countyns`}{County GNIS code.}
#'   \item{`geoid`}{Unique county FIPS code (concatenation of state and county
#'   FIPS codes).}
#'   \item{`county_name`}{County name. Equivalent to `namelsad` column from
#'   `mapmaryland::md_counties` which is a concatenated variable length
#'   geographic area name and legal/statistical area description (LSAD)}
#'   \item{`region`}{Region of the state.}
#' }
"lss_county_xwalk"

#' Maryland NCES Directory (SY 2003-2023)
#'
#' Combined data from XLS and XLSX format NCES directory files downloaded from
#' the MSDE Data Downloads website. The school name field has been corrected for
#' consistency and accuracy across years and capitalization of the city and
#' address fields have been standardized (previously used all upper case for
#' both prior to 2010). A grade span value is filled in for older records where
#' grade span was stored in the school type column. Last updated 2023-11-28.
#'
#' @format A data frame with 30160 rows and 15 variables:
#' \describe{
#'   \item{`year`}{School year}
#'   \item{`school_number`}{School number}
#'   \item{`school_name`}{School name}
#'   \item{`school_type`}{School type}
#'   \item{`address`}{School address}
#'   \item{`city`}{City}
#'   \item{`state`}{State}
#'   \item{`zip`}{Zip code}
#'   \item{`phone`}{School phone number}
#'   \item{`nces_number`}{NCES Number}
#'   \item{`create_date`}{Record creation date}
#'   \item{`grade_span`}{Grade span (grade band)}
#'   \item{`school`}{School number (character)}
#'   \item{`lss_name`}{LSS name}
#'   \item{`lss_number`}{LSS number}
#'}
#' @source [MSDE Data Downloads](https://reportcard.msde.maryland.gov/Graphs/#/DataDownloads/datadownload)
"md_nces_directory"
