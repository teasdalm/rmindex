#' Channel count
#'
#' R function to check barcode levels
#'
#'@param x Sample sheet df
#'@export
#'@examples
#'channel_count(x)

channel_count <- function(x){

  counts = table(x)
  red_channel <- counts["A"] + counts["C"]
  green_channel <- counts["G"] + counts["T"]

  return(list(red=red_channel,
              green=green_channel))

}