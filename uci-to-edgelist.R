#!/usr/bin/env Rscript

library(igraph)
library(data.table)

args <- commandArgs(trailingOnly=TRUE)

print(args)

dat <- fread(sprintf('%s/out.%s', args[1], args[1]),
             skip=2)
dat <- as.matrix(dat)

g <- graph_from_edgelist(dat, directed=FALSE)
dir.create('edgelist', showWarnings=FALSE)
write_graph(g,
            sprintf('edgelist/%s.csv', args[2]),
            format='edgelist')

