# rmindex 

**_rmindex_** (**R** **M**eyer **index**) is an R package that assesses and selects multiplex indexes from the Meyer and Kircher _(2010)_ library protocol for use with illumina sequencing.

### Usage

* install rmindex

```{r}
install.packages("devtools")
install.packages("tidyr")
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

# All in one
plot_barcodes(read_index("barcodes.csv"))
```

* Select random none overlaping indexes

```{r}
# Select random barcodes defaults are shown
barcode_select(number_to_select = 6)

# example output 
# Selected indexes B023 B029 B033 B039 B040 B046
#   TCD_name     Seq base1 base2 base3 base4 base5 base6 base7
#23     B023 GATCTCG     G     A     T     C     T     C     G
#29     B029 CCGATTG     C     C     G     A     T     T     G
#33     B033 CATCCGG     C     A     T     C     C     G     G
#39     B039 CGAATGC     C     G     A     A     T     G     C
#40     B040 TTCGCAA     T     T     C     G     C     A     A
#46     B046 GTACCGG     G     T     A     C     C     G     G

# Select and plot
plot_barcodes(barcode_select(number_to_select = 6))
```

* with more complex indexes
```{R}
# Select random barcodes 
barcode_select(indexes = c(1,4,63:100), number_to_select = 6)

# example output 
# Selected indexes B023 B029 B033 B039 B040 B046
   #TCD_name     Seq base1 base2 base3 base4 base5 base6 base7
#1      B001 TCGCAGG     T     C     G     C     A     G     G
#82     B082 CAGCATC     C     A     G     C     A     T     C
#66     B066 AGAGCGC     A     G     A     G     C     G     C
#91     B091 CGTATAT     C     G     T     A     T     A     T
#92     B092 GCTAATC     G     C     T     A     A     T     C
#95     B095 CGAGATC     C     G     A     G     A     T     C
```


* MiSeq sample sheet test 

```{r}
sample_sheet_test("sample_sheet.csv")
```

### Data

* Data folder includes...
  * index.rda - 200 plus Meyer and Kircher (2010) indexes
  * example_barcodes.csv - example index csv file

* To load meyer index dataset
```{r}
library(rmindex)
head(meyer_index)
```
