# rmindex

R codex to look at multiplex indexes

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
# Example file in /data
barcode_df <- read_index("barcodes.csv")

# Plot barcodes
plot_barcodes(barcode_df)
```

* Select random none overlaping indexes

```{r}
# Select random barcodes defaults are shown
test_barcodes <- barcode_select(number_of_barcodes = 75, number_to_select = 6)
```

* MiSeq sample sheet test 

```{r}
sample_sheet_test("sample_sheet.csv")
```

### Data

* Data folder includes...
  * index.rda - 200 plus Meyer and Kircher (2010) indexes
  * example_barcodes - example index file

* To load meyer index dataset
```{r}
library(rmindex)
head(meyer_index)
```
