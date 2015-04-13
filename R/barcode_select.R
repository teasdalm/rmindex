#' Barcode Select
#'
#' R function to select barcodes that don't overlap colour channels
#'
#'@param numberof_barcodes max number of barcodes to chose from
#'@param number_to_select number of barcodes to select
#'@export
#'@examples
#'barcode_select(numberof_barcodes = 75, number_to_select = 6)


barcode_select <- function(numberof_barcodes = 75, number_to_select = 6){

  sample_barcodes <- function(){
    barcodes <- sample(numberof_barcodes, number_to_select)
    barcodes_sorted <- sort(barcodes)
    selected_barcodes <- meyer_index[barcodes_sorted,]
    return(selected_barcodes)
  }

  no_channel <- function(x){
    if(is.na(x[1]) | is.na(x[2])){
      return(TRUE)
    } else{
      return(FALSE)
    }
  }

  current_selection <- sample_barcodes()
  result <- apply(current_selection[,4:10], 2, channel_count)
  count_df <- data.frame(matrix(unlist(result), nrow=7, byrow=T))
  test_counts <- apply(count_df, 1, no_channel)

  while(any(test_counts)){
    current_selection <- sample_barcodes()
    result <- apply(current_selection[,4:10], 2, channel_count)
    count_df <- data.frame(matrix(unlist(result), nrow=7, byrow=T))
    test_counts <- apply(count_df, 1, no_channel)
  }
  current_selection <- current_selection[,-1]
  message("selected indexes ", paste(current_selection$TCD_name, collapse=" "))
  return(current_selection)
}