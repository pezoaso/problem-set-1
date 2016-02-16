#! usr/bin/env bash

datasets='/vol3/home/pezoas/data-sets/misc' 

states=$datasets/states.tab.gz

# Q1 Which state has lowest murder rate
answer_1=$(zcat $states | grep -v '^#' | cut -f1,6 | sort -k2n | head -n1 | cut -f1 | sed 's/"//g')
echo "answer-1: $answer_1"

# Q2
sample='/vol3/home/pezoas/data-sets/fasta/sample.fa'
a_2=$(cat $sample | grep -c '^>') 
echo "answer-2: $a_2"

# Q3
cpg='/vol3/home/pezoas/data-sets/bed/cpg.bed.gz'
a_3=$(zcat $cpg |cut -f4 | sort -k4 | uniq | sort | wc -l)
echo "answer-3: $a_3"

# Q4
sp1='/vol3/home/pezoas/data-sets/fastq/SP1.fq'
a_4=$(cat $sp1 | grep -c '^@cluster')
echo "answer-4: $a_4"

# Q5
hamlet='/vol3/home/pezoas/data-sets/misc/hamlet.txt'
a_5=$(cat $hamlet | grep -i 'bloody' | wc -w)
echo "answer-5: $a_5"

# Q6 
a_6=$(cat $sample | grep -v '^>' | head -n1 | tr -d '/n' | wc -m)
echo "answer-6: $a_6"

# Q7
genes='/vol3/home/pezoas/data-sets/bed/genes.hg19.bed.gz'
a_7=$(zcat $genes | awk '{print $4, $3 - $2}' | sort -k2rn | head -n1 | awk '{print $1}')
echo "answer-7: $a_7"

# Q8
a_8=$(zcat $genes | awk '{print $1}' | uniq | wc -l)
echo "answer-8: $a_8"

# Q9
peaks='/vol3/home/pezoas/data-sets/bed/peaks.chr22.bed.gz'
a_9=$(zcat $peaks | awk '{print $4}' | grep 'CTCF' | grep -v 'CTCFL' | wc -l)
echo "answer-9: $a_9"

# Q10 
lamina='/vol3/home/pezoas/data-sets/bed/lamina.bed'
a_10=$(cat $lamina | awk '{print $1, $3 - $2}' | sort -k2rn | head -n1 | awk '{print $1}')
echo "answer-10: $a_10"

