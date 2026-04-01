library(readxl)
data <- data <- read_excel("unitedMorts.xlsx")

search <- c(
  "children", "minor", "child", "boy", "girl",
  "teen", "baby", "infant", "babies",
  "months",
  ",\\s*(?:[1-9]|1[0-7])\\b"
)


data[,"name, gender, age"]


pattern <- paste(search, collapse = "|")

filtered <- data[
  grepl(pattern, tolower(data[["name, gender, age"]])),
]

colnames(filtered)
View(filtered[, c("Number of deaths", "name, gender, age", "latitude","longitude")])

