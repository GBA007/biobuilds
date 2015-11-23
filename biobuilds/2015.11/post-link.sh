#!/bin/bash

# Write a "pinned" file to the environment's "conda-meta" directory to prevent
# accidental package upgrades or downgrades. This "enforces" the notion that a
# BioBuilds release is a reference environment that shouldn't be altered; users
# who want a customized environment should use the other conda tools instead.
[ -d "${PREFIX}/conda-meta" ] || mkdir -p "${PREFIX}/conda-meta"

cat >"${PREFIX}/conda-meta/pinned" <<EOF
# In particular, don't want these four components to change versions, or
# applications in the environment could break in very strange and bad ways.
boost 1.54*
numpy 1.9*
python ==2.7.10
r ==3.2.2

# Set of tools included in this BioBuilds release for all platforms
bamtools ==2.4.0
bedtools ==2.25.0
bfast ==0.7.0a
biopython ==1.66
blast ==2.2.31
bowtie ==1.1.2
bowtie2 ==2.2.6
bwa ==0.7.12
clustalw ==2.1
cufflinks ==2.2.1
emboss ==6.5.7
fasta ==36.3.8b
fastqc ==0.11.4
gnuplot ==5.0.0
graphviz ==2.38.0
hmmer ==3.1b2
htseq ==0.6.1
htslib ==1.2.1
igv ==2.3.65
matplotlib ==1.5.0
mothur ==1.36.1
oases ==0.2.8
picard ==1.140
plink ==1.07
pysam ==0.8.3
r-annotationdbi ==1.32.0
r-biobase ==2.30.0
r-bioc-base ==3.2.012001
r-biocgenerics ==0.16.1
r-biocinstaller ==1.20.1
r-bitops ==1.0_6
r-blockmodeling ==0.1.8
r-boot ==1.3_17
r-catools ==1.17.1
r-class ==7.3_14
r-cluster ==2.0.3
r-codetools ==0.2_14
r-crayon ==1.3.1
r-dbi ==0.3.1
r-digest ==0.6.8
r-ebseq ==1.10.0
r-foreign ==0.8_66
r-gdata ==2.17.0
r-gplots ==2.17.0
r-gtools ==3.5.0
r-iranges ==2.4.3
r-kernsmooth ==2.23_15
r-lattice ==0.20_33
r-mass ==7.3_44
r-matrix ==1.2_2
r-memoise ==0.2.1
r-mgcv ==1.8_7
r-nlme ==3.1_122
r-nnet ==7.3_11
r-praise ==1.0.0
r-rpart ==4.1_10
r-rsqlite ==1.0.0
r-s4vectors ==0.8.3
rsem ==1.2.25
r-spatial ==7.3_11
r-survival ==2.38_3
r-testthat ==0.11.0
samtools ==1.2.0
shrimp ==2.2.3
soapaligner ==2.20
soapbuilder ==2.20
soapdenovo2 ==2.4.240
sqlite ==3.8.4.1
star ==2.4.2a
tabix ==1.2.1
tmap ==3.4.0
tophat ==2.1.0
trinity ==2.1.1
variant_tools ==2.6.3
velvet ==1.2.10
EOF

if [ `uname -s` == 'Linux' ]; then
    cat >>"${PREFIX}/conda-meta/pinned" <<EOF2
barracuda ==0.7.107b
soap3-dp ==r177
allpathslg ==52488
isaac ==15.04.01
EOF2
fi
