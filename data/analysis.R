# Load codon usage table

cu <- read.csv("data/codon-usage.csv")

# Define amino acids

source("analysis/aminoacids.R")

# number of codons

cu$n <- rowSums(cu[,2:65])

# Codon usage per 1000 for whole ORFome

cu.orfome <- colSums(cu[,2:65]) / sum(cu$n) * 1000

normalizeCU <- function(aa) {
  # Summarize split box codons

  split <- rowSums(cu[, aa])
  
  # Normalize split box codons

  percentage <- data.frame(row.names = cu[, 'ORF']) # Initialize empty data frame with ORFs as row names
  
  for(codon in aa) {
    percentage[, codon] <- cu[, codon] / split * 100
  }

  # Normalized splitbox usage per 1000 codons

  norm <- (1000 / cu[, 'n']) * split * 100 / sum(cu.orfome[aa])

  return(cbind(split, percentage, norm))
}