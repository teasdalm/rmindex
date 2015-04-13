#' Channel count
#'
#' R function to check barcode levels
#'
#'@param x Sample sheet df
#'@export
#'@examples
#'channel_count(x)

channel_count <- function(x){

  counts = table(x, exclude=NULL)

  if("A" %in% names(counts)){
    a_count <- counts["A"]
  } else{
    a_count <- 0
  }

  if("C" %in% names(counts)){
    c_count <- counts["C"]
  } else{
    c_count <- 0
  }

  if("G" %in% names(counts)){
    g_count <- counts["G"]
  } else{
    g_count <- 0
  }

  if("T" %in% names(counts)){
    t_count <- counts["T"]
  } else{
    t_count <- 0
  }

  red_channel <- a_count + c_count
  green_channel <- g_count + t_count

  return(list(red=red_channel,
              green=green_channel))

}