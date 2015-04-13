#' Plot Barcodes
#'
#' R function to test a MiSeq sample sheet
#'
#'@param x Sample sheet df
#'@keywords Sample Sheet
#'@export
#'@examples
#'plot_barcodes(x)


plot_barcodes <-function(x){

  ## --- Make DF
  result <- apply(x[,3:9], 2, channel_count)
  count_df <- data.frame(matrix(unlist(result), nrow=7, byrow=T))
  names(count_df) <- c("Red", "Green")

  ## --- Test for missing channels
  no_channel <- function(x){
    if(is.na(x[1]) | is.na(x[2])){
      return(TRUE)
    } else{
      return(FALSE)
    }
  }

  test_counts <- apply(count_df, 1, no_channel)

  if(any(test_counts)){
    message("Barcode Error!:")
    bad_barcode <- which(test_counts == TRUE)
    for(each in bad_barcode){
      message("Barcode ", each,
              " has zero elements of one channel see table below")
    }
    return(count_df)
  }

  ## ------ Plot graph

  par(xpd=TRUE,mar=c(5,4,4,5))
  barplot(t(count_df),col=c("red","green"),xlab="Barcode position",ylab="Red and Green Counts")
  legend(par("usr")[2],par("usr")[4],c("Red","Green"),pch=15,col=c("red","green"))
  message("Barcode counts below.....")
  return(count_df)
}