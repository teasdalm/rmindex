#' Barcode Select
#'
#' R function to select random barcodes that don't overlap colour channels
#'
#'@param indexes indexes to select from, defaults [1-75]
#'@param number_to_select number of barcodes to select
#'@export
#'@examples
#'barcode_select(indexes = c(1:75), number_to_select = 6)


barcode_select <- function(indexes = c(1:75), number_to_select = 6){

  ## ----- Function to sample barcode
  sample_barcodes <- function(){
    barcodes <- sample(indexes, number_to_select)
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
