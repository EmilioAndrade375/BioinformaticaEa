# Get all genes for a family
./datasets download gene symbol BRCA1 --ortholog Aotidae  --filename braca1_Aotidae.zip

# Get all genes for an order
./datasets download gene symbol BRCA1 --ortholog primates --filename braca1_primates.zip

# Get all genes for a class
./datasets download gene symbol BRCA1 --ortholog mammals --filename braca1_mammlas.zip


#Get all the species with a brca1 gene
./datasets summary gene symbol brca1 --ortholog primates --as-json-lines | ./dataformat tsv gene --fields tax-name,gene-id | sort

# Get genes from an list of gene ids
./datasets download gene gene-id --inputfile list.SA.monkeys.txt --filename SA.monkeys.zip


# Get all genes available for a particular species
./datasets summary gene taxon "Cebus imitator" --as-json-lines | ./dataformat tsv gene --fields tax-name,gene-id,symbol  
 

# Get mitocondial Genes
/u/home/d/dechavez/edirect/esearch -db nuccore -query "cytb [GENE] AND Xylocopa[ORGN]" | efetch -format fasta
