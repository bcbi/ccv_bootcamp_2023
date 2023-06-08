main <- function() {
  # input file
  admissions_file <- "admissions.csv"
  
  # output file
  count_file_name <- "./admissions_count3.txt"
  output_count_file <- file(count_file_name, "w")
  
  # create a list to store admission location counts
  count <- list()
  
  # read admissions file line by line
  lines <- readLines(admissions_file)
  for (line_count in seq_along(lines)) {
    line <- lines[line_count]
    
    # skip first line (header)
    if (line_count == 1) {
      next
    }
    
    # split line into array
    line_part_array <- strsplit(line, ",")[[1]]
    
    # get admission location from line
    a_loc <- line_part_array[8]
    
    # handle missing admission locations
    if (is.na(a_loc) || a_loc == "") {
      a_loc <- " "
    }
    
    # tabulate admission locations
    if (!(a_loc %in% names(count))) {
      count[[a_loc]] <- 1
    } else {
      count[[a_loc]] <- count[[a_loc]] + 1
    }
  }
  
  # print out counts to console and output file
  for (a_loc in names(count)) {
    cat(a_loc, "|", count[[a_loc]], "\n")
    cat(a_loc, "|", count[[a_loc]], "\n", file = output_count_file, append = TRUE)
  }
  
  close(output_count_file)
}

# run main function
main()
