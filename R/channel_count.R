channel_count <- function(x){

  counts = table(x)
  red_channel <- counts["A"] + counts["C"]
  green_channel <- counts["G"] + counts["T"]

  return(list(red=red_channel,
              green=green_channel))

}