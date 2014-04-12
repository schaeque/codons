# Load codon usage table

cu <- read.csv("data/codon-usage.csv")

# number of codons

cu$n <- rowSums(cu[,2:65])

# Summarize splitbox codons

cu$split.AAG.AAA <- cu$AAG + cu$AAA
cu$split.CAA.CAG <- cu$CAA + cu$CAG
cu$split.GAA.GAG <- cu$GAA + cu$GAG

cu$percentage.AAA <- cu$AAA / cu$split.AAG.AAA * 100
cu$percentage.CAA <- cu$CAA / cu$split.CAA.CAG * 100
cu$percentage.GAA <- cu$GAA / cu$split.GAA.GAG * 100

# Codon usage per 1000 for whole ORFome

cu.orfome <- colSums(cu[,2:65]) / sum(cu$n) * 1000

# Normalized splitbox usage

cu$norm.AAA <- (1000 / cu$n) * cu$split.AAG.AAA * 100 / (cu.orfome['AAG'] + cu.orfome['AAA'])
cu$norm.CAA <- (1000 / cu$n) * cu$split.CAA.CAG * 100 / (cu.orfome['CAA'] + cu.orfome['CAG'])
cu$norm.GAA <- (1000 / cu$n) * cu$split.GAA.GAG * 100 / (cu.orfome['GAA'] + cu.orfome['GAG'])