read_index <- function(index_file){

  dat <- read.table(index_file, sep=",", stringsAsFactors = FALSE)

  dat$V3 <- sapply(dat$V2,
                   function(x){paste(unlist(strsplit(x, split="")),
                                     collapse = "_")})

  dat <- separate(dat,
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

  return(dat)
}