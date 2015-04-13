# rmindex

R codex to look a multiplex indexes

### Usage

* install rmindex

```{r}
install.packages("devtools")
devtools::install_github("teasdalm/rmindex")
library(rmindex)
```

* Read barcodes and plot

```{r}
# Read barcodes
barcode_df <- read_index("barcodes.csv")

# Plot barcodes
plot_barcodes(barcode_df)
```

### Data

* Data folder includes...
  * index.Rdata - 200 plus Meyer and Kircher (2010) indexes
  * example_barcodes - example index file
