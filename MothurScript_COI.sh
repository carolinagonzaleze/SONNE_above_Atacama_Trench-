##make the contigs based in the Forward and reverse files for each sample. Keep inserts if Q>30, and if there is a disagreement between F&R, keep as ambiguous unless the difference between both Q > 10
make.contigs(file=stability.files, deltaq=10, insert=30, trimoverlap=F, processors=37)
summary.seqs(fasta=current)
##remove all contigs with any ambiguity, and those with more than 10 homopolymers
screen.seqs(fasta=current, group=current, maxambig=0, maxhomop=10, contigsreport=current, processors=37)
summary.seqs(fasta=current)
##remove all seqs with lenght < 250
screen.seqs(fasta=current, group=current, minlength=250, processors=37)
summary.seqs(fasta=current)
unique.seqs(fasta=current, processors=37)
summary.seqs(fasta=current, name=current)
get.current()
##removal of chimeras
chimera.vsearch(fasta=current, name=current, group=current, dereplicate=f, processors=37)
remove.seqs(fasta=current, accnos=current, group=current, name=current, dups=t, processors=37)
summary.seqs(fasta=current, name=current)
##removal of PCR errors using UNOISE
pre.cluster(fasta=current, name=current, group=current, diffs=1, method=unoise, processors=37)
##get uncompressed table from mothur
count.seqs(count=current, compress=f)
##Sequence clustering
cluster(fasta=stability.trim.contigs.good.good.unique.pick.precluster.unique.fasta, count=stability.trim.contigs.good.good.unique.pick.precluster.full.count_table, method=agc, cutoff=0.05, processors=10)
make.shared(list=stability.trim.contigs.good.good.unique.pick.precluster.unique.agc.list, count=stability.trim.contigs.good.good.unique.pick.precluster.full.count_table)
get.oturep(list=stability.trim.contigs.good.good.unique.pick.precluster.unique.agc.list, fasta=stability.trim.contigs.good.good.unique.pick.precluster.unique.fasta, name=stability.trim.contigs.good.good.pick.names, sorted=group, method=abundance)
summary.seqs(fasta=current)
##distance matrix
clearcut(fasta=caro.fasta, DNA=T, verbose=t, matrixout=carolina.dist, processors=30)
##phylogenetic diversity
phylo.diversity(tree=caro.tre, count=conteo.txt, collect=T, summary=T, iters=1000, processors=30)



