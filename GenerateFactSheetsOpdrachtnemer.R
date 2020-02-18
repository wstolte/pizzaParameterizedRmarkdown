
library(readxl)
library(tidyverse)

factsheetData <- read_excel('FactsheetsDataBase.xlsx', 
                            sheet = 'database', 
                            skip = 3)

fileNames <- paste(
  unlist(factsheetData[2], use.names = F), 
  unlist(factsheetData[3], use.names = F)
)


# loop for printing of all factsheets.
# Now only factsheet #3 is printed to pdf
# for(ii in seq(1 : 3)) {    ### length(fileNames)
  
  ii = 1
  
  parameters <- setNames(
    as.list(
      factsheetData[ii,]
    ), 
    names(factsheetData)
  )
  

  rmarkdown::render("FactsheetOpdrachtnemerTemplate.Rmd",
                    output_file = paste0("Factsheet", fileNames[ii], "_",
                                         # format(Sys.time(),format = '%Y-%m-%d'),
                                         ".pdf"), 
                    params = parameters
                    
  )
  
# }

  
  
  
  
#  or.. as function

# renderMyDocument <- function(region, start) {
#   rmarkdown::render("MyDocument.Rmd", params = list(
#     region = region,
#     start = start
#   ))
# }
