#!/bin/bash

#$ -l highp,h_rt=64:00:00,h_data=30G,h_vmem=50G
#$ -pe shared 1
#$ -N DCHNCBIcalculator
#$ -cwd
#$ -m bea
#$ -o /u/scratch/d/dechavez/Bioinformatica-PUCE/HerrBio/DanielCh/log/GeneCalculaor.out
#$ -e /u/scratch/d/dechavez/Bioinformatica-PUCE/HerrBio/DanielCh/log/GeneCalculator.err
#$ -M dechavezv

source /u/local/Modules/default/init/modules.sh
module load iqtree/2.2.2.6


./muscle3.8.31_i86linux64 -in rna.fna -out muscle_rna.fna -maxiters 1 -diags
