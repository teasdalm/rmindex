channel_count <- function(x){

  base_counts <- as.data.frame(table(x))

  red_channel <- base_counts[base_counts$x == "A", "Freq"] + base_counts[base_counts$x == "C", "Freq"]

  green_channel <- base_counts[base_counts$x == "G", "Freq"] + base_counts[base_counts$x == "T", "Freq"]

  return(list(red=red_channel,
              green=green_channel))

}