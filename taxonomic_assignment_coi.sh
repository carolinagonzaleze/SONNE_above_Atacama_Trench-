##Run using blast ver. 2.7.1 in a v4 DB format. This line might not work if used in the new BLAST (Ver. 3 and above) and/or new DB formats (V5 and above)
blastn -use_index false -db /storage/d2/caro/zip/base_datos/prub_biblio/nt -query coi_res.fasta -perc_identity 0 -outfmt "6 qseqid sseqid pident stitle" -max_target_seqs 1 -num_threads 37 > coi_final.txt
