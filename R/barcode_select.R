#' Barcode Select
#'
#' R function to select random barcodes that don't overlap colour channels
#'
#'@param number_of_barcodes max number of barcodes to chose from
#'@param number_to_select number of barcodes to select
#'@export
#'@examples
#'barcode_select(number_of_barcodes = 75, number_to_select = 6)


barcode_select <- function(number_of_barcodes = 75, number_to_select = 6){
  if(number_of_barcodes <= 0 | number_of_barcodes > 228){
    stop("Barcode number incorrect")
  }
  ## ----- Function to sample barcode
  sample_barcodes <- function(){
    barcodes <- sample(number_of_barcodes, number_to_select)
    barcodes_sorted <- sort(barcodes)
    selected_barcodes <- meyer_index[barcodes_sorted,]
    return(selected_barcodes)
  }

  ## ----- Function to sample barcode
  no_channel <- function(x){
    if(x[1] == 0 | x[2] == 0){
      return(TRUE)
    } else{
      return(FALSE)
    }
  }

  # Select random indexes check for clashes if not return to user
  repeat{
    current_selection <- sample_barcodes()
    result <- apply(current_selection[,4:10], 2, channel_count)
    count_df <- data.frame(matrix(unlist(result), nrow=7, byrow=T))
    test_counts <- apply(count_df, 1, no_channel)
    if(!any(test_counts)){
      current_selection <- current_selection[,-1]
      message("selected indexes ",
              paste(current_selection$TCD_name, collapse=" "))
      return(current_selection)
      break
    }
  }
}
