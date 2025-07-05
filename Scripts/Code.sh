# This is the beggining of the code for the proyect

mkdir Final_Proyect # This is the folder were we are going to do all the work

cd Final_Proyect # Move to the Folder created Final_Proyect/

# Create folders needed

mkdir ND1_Accipitriformes_genes ## Nomenclature: Gene(ND1,ODC,SWS1)_Taxon(Accipitriformes,Falconiformes)_genes
mkdir ND1_Falconiformes_genes

# This folders are for the ND1 gene of Accipitriformes and Falconiformes

mkdir ODC_Accipitriformes_gene
mkdir ODC_Falconiformes_genes

# This folders are for the ODC gene of Accipitriformes and Falconiformes

mkdir SWS1_Accipitriformes_genes
mkdir SWS1_Falconiformes_genes

# This folders are for the SWS1 gene of Accipitriformes and Falconiformes


# Copy the program Muscle from the Programs Folder

cp ../Programs/muscle3.8.31_i86win32.exe ./

# Copy the program dataset from the Programs Folder 

cp ../Programs/datasets ./

# First we are going to take the genes from the datasets (NCBI) using the following code

./datasets download gene symbol ND1 --ortholog Accipitriformes --filename ND1_Accipitriformes.zip # This is the code for the ND1 gene from the Accipitriformes taxon

./datasets download gene symbol ND1 --ortholog Falconiformes --filename ND1_Falconiformes.zip # This is the code for the ND1 gene from the Falconiformes taxon

./datasets download gene symbol ODC --ortholog Accipitriformes --filename ODC_Accipitriformes.zip # This is the code for the ODC gene from the Accipitriformes taxon

./datasets download gene symbol ODC --ortholog Falconiformes --filename ODC_Falconiformes.zip # This is the code for the ODC gene from the Falconiformes taxon

./datasets download gene symbol SWS1 --ortholog Accipitriformes --filename ODC_Accipitriformes.zip # This is the code for the SWS1 gene from the Accipitriformes taxon

./datasets download gene symbol SWS1 --ortholog Falconiformes --filename ODC_Falconiformes.zip # This is the code for the SWS1 gene from the Falconiformes taxon

# Forloop to move the file *.zip Example: ND1_Accipitriformes.zip a to their corresponding folders. Example: ND1_Accipitriformes_genes

# List of genes and taxons 
genes=("MD1" "ODC" "SM51")
taxones=("Accipitriformes" "Falconiformes")

# Iterate over each gene/taxon combination
for gene in "${genes[@]}"; do
    for taxon in "${taxones[@]}"; do
        zip_file="${gene}_${taxon}.zip"
        target_dir="${gene}_${taxon}_genes"
        
        # Check if the .zip file exists
        if [ -f "$zip_file" ]; then
            # Create the folder if it does not exist
            mkdir -p "$target_dir"
            # Move the file to the folder
            mv "$zip_file" "$target_dir/"

# Now we have to enter to the first folder: 
