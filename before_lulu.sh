#Make a match list (using BLASTn).Make blast database
makeblastdb -in centroids_test.txt -parse_seqids -dbtype nucl
#Blast the centoids against themselves
blastn -db centroids_test.txt -outfmt '6 qseqid sseqid pident' -out match_list.txt -qcov_hsp_perc 80 -perc_identity 84 -query centroids_test.txt
