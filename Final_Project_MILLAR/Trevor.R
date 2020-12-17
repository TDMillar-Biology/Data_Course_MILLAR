## Trevor D. Millar
## 11.16.2020
## Phyloseq

install.packages("tidyverse")
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("phyloseq")
## Load up packages GGplot and Phyloseq
library(ggplot2)
library(phyloseq)

## We are going to load up a function written by dr. Zahn in order to fix out plot_bar below. 
plot_bar2 <- function (physeq, x = "Sample", y = "Abundance", fill = NULL, 
                       title = NULL, facet_grid = NULL) 
{
  mdf = psmelt(physeq)
  p = ggplot(mdf, aes_string(x = x, y = y, fill = fill))
  p = p + geom_bar(stat = "identity", position = "stack")
  p = p + theme(axis.text.x = element_text(angle = -90, hjust = 0))
  if (!is.null(facet_grid)) {
    p <- p + facet_grid(facet_grid)
  }
  if (!is.null(title)) {
    p <- p + ggtitle(title)
  }
  return(p)
}

## Import the data; save original OTU, Sample data, and Taxonomy tables

ps <- readRDS("./Output/full_cleaned_ps_object_w_tree.RDS")
OTU_Original <- ps@otu_table
sam_data_Original <- ps@sam_data
tax_table_Original <- ps@tax_table


## Let's look at the rank dames and sample variables
rank_names(ps)
sample_variables(ps)

## Structure is one of the important parts of the study. 
levels(as.factor(sam_data_Original$Structure))

## It looks like the data for structure wasn't read in as a factor, Lets fix that
sam_data_Original$Structure <- as.factor(sam_data_Original$Structure)
## Lets save structures as a list of unique structures for use later
Mangrove_Structures <- levels(sam_data_Original$Structure)       
Mangrove_Structures
## While we are at it, lets grab the two species names as a list in case we need them 
Mangrove_species_names <- levels(as.factor(sam_data_Original$Species))



## We are going to make sure that all of the OTU's in the table have at least been present in one sample
any(taxa_sums(ps) == 0)
## Getting a FALSE returned means all OTUs have been read at least once

## Lets take a look at how many reads per sample we have
readsumsdf = data.frame(nreads = sort(taxa_sums(ps), TRUE), sorted = 1:ntaxa(ps), type = "OTUs")
readsumsdf ## This Df has a sorted list of the most common reads
ggplot(readsumsdf, aes(x = sorted, y = nreads))+
  geom_bar(stat = "identity")
## This graph is just showing us the numbers of times each OTU was seen in the samples

## Lets transform the number of reads to a percentage 
transformedreads <- transform_sample_counts(ps, function(x) x / sum(x))


## Just double checking, if they are percentages they should all plot to 1 here. 
plot(sort(sample_sums(transformedreads), TRUE), type = "h", main = title, ylab = "reads", 
     ylim = c(0, 10))

## Grab the top 10 most popular OTUs
top40otus = names(sort(taxa_sums(transformedreads), TRUE)[1:40])
top40otus

any(is.na(taxtable$Family))
any(is.na(taxtable$Genus))
## Add a column to the tax table called family 10
taxtab40 <- cbind(tax_table(transformedreads), class40 = NA)

## top10otus being treated as tax_table, family 10 as a character string
taxtab40[top40otus, "class40"] <- as(tax_table(transformedreads)[top40otus, "Class"], "character")

tax_table(transformedreads) <- tax_table(taxtab40)
needtosee <-data.frame(tax_table(transformedreads))

p1 <- plot_bar(transformedreads,x = "Structure" , fill = "class40", title = "Attempt 1") +coord_flip()

p1

transformedreadsmerged <- merge_samples(transformedreads, "Structure")

sample <- data.frame(transformedreads@sam_data)
sample_data(transformedreadsmerged)$Structure <- levels(as.factor(sample_data(transformedreads)$Structure))

p2 <- plot_bar2(transformedreadsmerged, x = "Structure", fill = "family40", title = "Attempt 2") + 
  coord_flip() + 
  ylab("Percentage of Sequences")
p2 

ggsave("Figure_2.jpg",p2)


p3 <- plot_ordination(transformedreads, ordinate(transformedreads, "PCoA", "bray"), color = "Structure")+
  geom_point()+
  ggtitle("Figure 3")
p3

ggsave("Figure_3.jpg", p3)
