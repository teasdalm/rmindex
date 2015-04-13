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

# example output 
#selected indexes B023 B029 B033 B039 B040 B046
#   TCD_name     Seq base1 base2 base3 base4 base5 base6 base7
#23     B023 GATCTCG     G     A     T     C     T     C     G
#29     B029 CCGATTG     C     C     G     A     T     T     G
#33     B033 CATCCGG     C     A     T     C     C     G     G
#39     B039 CGAATGC     C     G     A     A     T     G     C
#40     B040 TTCGCAA     T     T     C     G     C     A     A
#46     B046 GTACCGG     G     T     A     C     C     G     G

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
