library(readxl)
data <- data <- read_excel("unitedMorts.xlsx")

search <- c(
  "children", "minor", "child", "boy", "girl",
  "teen", "baby", "infant", "babies",
  "months",
  ",\\s*(?:[1-9]|1[0-7])\\b"
)


colnames(data)


pattern <- paste(search, collapse = "|")

filtered <- data[
  grepl(pattern, tolower(data[["name, gender, age"]])),
]


ok <- filtered[, c("Number of deaths", "name, gender, age", "latitude","longitude")]

ok$children_count <- as.numeric(
  sub(".*(?:incl|\\(|;)\\s*(\\d+)\\s*child.*", "\\1",
      tolower(ok[["name, gender, age"]]))
)




# mettre NA si pas de match
# ok$children_count[!grepl("incl\\s*\\d+\\s*children", tolower(ok[["name, gender, age"]]))] <- NA

ok$children_count[ok$`Number of deaths` == 1] <- 1

View(ok)


# Aller chercher aussi bébés et femmes enceintes

