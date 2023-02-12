lss_county_xwalk <-
  tibble::tribble(
    ~lss_number, ~lss_name, ~countyfp, ~countyns, ~geoid, ~county_name, ~region,
    1L, "Allegany", 1L, 1713506L, 24001L, "Allegany County", "Western Maryland",
    2L, "Anne Arundel", 3L, 1710958L, 24003L, "Anne Arundel County", "Central Maryland",
    3L, "Baltimore County", 5L, 1695314L, 24005L, "Baltimore County", "Central Maryland",
    4L, "Calvert", 9L, 1676636L, 24009L, "Calvert County", "Southern Maryland",
    5L, "Caroline", 11L, 595737L, 24011L, "Caroline County", "Eastern Shore",
    6L, "Carroll", 13L, 1696228L, 24013L, "Carroll County", "Central Maryland",
    7L, "Cecil", 15L, 596115L, 24015L, "Cecil County", "Eastern Shore",
    8L, "Charles", 17L, 1676992L, 24017L, "Charles County", "Southern Maryland",
    9L, "Dorchester", 19L, 596495L, 24019L, "Dorchester County", "Eastern Shore",
    10L, "Frederick", 21L, 1711211L, 24021L, "Frederick County", "Capital Region",
    11L, "Garrett", 23L, 1711058L, 24023L, "Garrett County", "Western Maryland",
    12L, "Harford", 25L, 1698178L, 24025L, "Harford County", "Central Maryland",
    13L, "Howard", 27L, 1709077L, 24027L, "Howard County", "Central Maryland",
    14L, "Kent", 29L, 593907L, 24029L, "Kent County", "Eastern Shore",
    15L, "Montgomery", 31L, 1712500L, 24031L, "Montgomery County", "Capital Region",
    16L, "Prince George's", 33L, 1714670L, 24033L, "Prince George's County", "Capital Region",
    17L, "Queen Anne's", 35L, 596089L, 24035L, "Queen Anne's County", "Eastern Shore",
    18L, "St. Mary's", 37L, 1697853L, 24037L, "St. Mary's County", "Southern Maryland",
    19L, "Somerset", 39L, 596907L, 24039L, "Somerset County", "Eastern Shore",
    20L, "Talbot", 41L, 592947L, 24041L, "Talbot County", "Eastern Shore",
    21L, "Washington", 43L, 1714220L, 24043L, "Washington County", "Western Maryland",
    22L, "Wicomico", 45L, 1668606L, 24045L, "Wicomico County", "Eastern Shore",
    23L, "Worcester", 47L, 1668802L, 24047L, "Worcester County", "Eastern Shore",
    30L, "Baltimore City", 510L, 1702381L, 24510L, "Baltimore city", "Central Maryland",
    32L, "SEED School of Maryland", NA, NA, NA, NA, NA
  )

usethis::use_data(lss_county_xwalk, overwrite = TRUE)
