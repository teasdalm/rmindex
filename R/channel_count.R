#' Channel count
#'
#' R function to check barcode levels
#'
#'@param x Sample sheet df
#'@export
#'@examples
#'channel_count(x)

channel_count <- function(x){

  red_channel <- 0
  green_channel < -0

  for(each in x){
    if(each == "A" | each == "C"){
      red_channel <- red_channel + 1
    } else if(each == "G" | each == "T"){
      green_channel <- green_channel + 1
    } else{
      stop("Error: Base not recognised")
    }
  }

  return(list(red=red_channel,
              green=green_channel))

}