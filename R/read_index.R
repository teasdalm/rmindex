#' Read index
#'
#' R function read a barcode file into a data frame
#'
#'@param index_file sample index file in csv format
#'@keywords Sample Sheet
#'@import tidyr
#'@export
#'@examples
#'read_index("index_file.csv")

read_index <- function(index_file){

  dat <- read.table(index_file, sep=",", stringsAsFactors = FALSE)

  dat$V3 <- sapply(dat$V2,
                   function(x){paste(unlist(strsplit(x, split="")),
                                     collapse = "_")})

  dat <- tidyr::separate(dat,
                  V3,
                  c("base1",
                    "base2",
                    "base3",
                    "base4",
                    "base5",
                    "base6",
                    "base7"),
                  sep="_")

  names(dat) <- c("TCD_name",
                  "Seq",
                  "base1",
                  "base2",
                  "base3",
                  "base4",
                  "base5",
                  "base6",
                  "base7")


  for(i in seq(3,9)){
    dat[,i] <- factor(dat[,i], levels = c("A", "C", "G", "T"))
  }
  message("Read ", nrow(dat), " barcodes")
  return(dat)
}