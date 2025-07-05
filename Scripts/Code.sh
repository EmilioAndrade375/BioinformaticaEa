# This is the beggining of the code for the proyect

# Made by: Emilio Andrade (emilio.andrade375@gmail.com)

# 05/07/202

mkdir Final_Proyect # This is the folder were we are going to do all the work

cd Final_Proyect # Move to the Folder created Final_Proyect/

# Create folders needed

mkdir ND1_Accipitriformes_genes ## Nomenclature: Gene(ND1,ODC,SWS1)_Taxon(Accipitriformes,Falconiformes)_genes
mkdir ND1_Falconiformes_genes

# This folders are for the ND1 gene of Accipitriformes and Falconiformes

mkdir ODC_Accipitriformes_genes
mkdir ODC_Falconiformes_genes

# This folders are for the ODC gene of Accipitriformes and Falconiformes

mkdir SWS1_Accipitriformes_genes
mkdir SWS1_Falconiformes_genes

# This folders are for the SWS1 gene of Accipitriformes and Falconiformes


# Copy the program Muscle from the Programs Folder

cp ../Programs/muscle3.8.31_i86linux64 ./ # IF YOU HAVE A DIFERENT OPERATION SYSTEM PLEASE USE THE ONE DEPENDING ON IT 

# Copy the program dataset from the Programs Folder 

cp ../Programs/datasets ./

# First we are going to take the genes from the datasets (NCBI) using the following code

./datasets download gene symbol ND1 --ortholog Accipitriformes --filename ND1_Accipitriformes.zip # This is the code for the ND1 gene from the Accipitriformes taxon

./datasets download gene symbol ND1 --ortholog Falconiformes --filename ND1_Falconiformes.zip # This is the code for the ND1 gene from the Falconiformes taxon

./datasets download gene symbol ODC --ortholog Accipitriformes --filename ODC_Accipitriformes.zip # This is the code for the ODC gene from the Accipitriformes taxon

./datasets download gene symbol ODC --ortholog Falconiformes --filename ODC_Falconiformes.zip # This is the code for the ODC gene from the Falconiformes taxon

./datasets download gene symbol SWS1 --ortholog Accipitriformes --filename SWS1_Accipitriformes.zip # This is the code for the SWS1 gene from the Accipitriformes taxon

./datasets download gene symbol SWS1 --ortholog Falconiformes --filename SWS1_Falconiformes.zip # This is the code for the SWS1 gene from the Falconiformes taxon


# Move all the *.zip files to the corresponding file

mv ND1_Falconiformes.zip ND1_Falconiformes_genes/

mv ND1_Accipitriformes.zip ND1_Accipitriformes_genes/

mv ODC_Accipitriformes.zip ODC_Accipitriformes_genes/

mv ODC_Falconiformes.zip ODC_Falconiformes_genes/

mv SWS1_Accipitriformes.zip SWS1_Accipitriformes_genes/

mv SWS1_Falconiformes.zip SWS1_Falconiformes_genes/


# Now we have to enter to the first folder: ND1_Accipitriformes_genes/ 

cd ND1_Accipitriformes_genes

# Unzip the file*.zip

unzip ND1_Accipitriformes.zip 

# A ncbi folder has been created now we want the rna.fna file 

mv ncbi_dataset/data/rna.fna ./ # Moving the rna.fna to the main folder (ND1_Accipitriformes_genes) makes it easier to work

# Change the name to an easier identification

mv rna.fna ND1_Accipitriformes.fna 

cd ../


# Now we have to enter to second folder: ND1_Falconiformes_genes/

cd ND1_Falconiformes_genes

# Unzip the file*.zip

unzip ND1_Falconiformes.zip

# A ncbi folder has been created now we want the rna.fna file

mv ncbi_dataset/data/rna.fna ./

# Change the name to an easier identification

mv rna.fna ND1_Falconiformes.fna

cd ../


# Now we have to enter to third folder: ODC_Falconiformes_genes/

cd ODC_Falconiformes_genes/

# Unzip the file*.zip

unzip ODC_Falconiformes.zip

# A ncbi folder has been created now we want the rna.fna file

mv ncbi_dataset/data/rna.fna ./

# Change the name to an easier identification

mv rna.fna ODC_Falconiformes.fna

cd ../


# Now we have to enter to forth folder: ODC_Accipitriformes_genes/

cd ODC_Accipitriformes_genes/

# Unzip the file*.zip

unzip ODC_Accipitriformes.zip

# A ncbi folder has been created now we want the rna.fna file

mv ncbi_dataset/data/rna.fna ./

# Change the name to an easier identification

mv rna.fna ODC_Accipitriforme.fna 

cd ../


# Now we have to enter to third fifth: SWS1_Falconiformes_genes/

cd SWS1_Falconiformes_genes/

# Unzip the file*.zip

unzip SWS1_Falconiformes.zip

# A ncbi folder has been created now we want the rna.fna file

mv ncbi_dataset/data/rna.fna ./

# Change the name to an easier identification

mv rna.fna SWS1_Falconiformes.fna

cd ../


# Now we have to enter to sixth folder: SWS1_Accipitriformes_genes/

cd SWS1_Accipitriformes_genes/

# Unzip the file*.zip

unzip SWS1_Accipitriformes.zip

# A ncbi folder has been created now we want the rna.fna file

mv ncbi_dataset/data/rna.fna ./

# Change the name to an easier identification

mv rna.fna SWS1_Accipitriforme.fna

cd ../


# MUSCLE code

# Go to the this folder: ND1_Accipitriformes_genes/

cd ND1_Accipitriformes_genes

mkdir MUSCLE # This is were we are going to work with the muscle alignment

cp ../muscle3.8.31_i86linux64 ./ 

mv muscle3.8.31_i86win32.exe ./ MUSCLE/

mv ND1_Accipitriformes.fna MUSCLE/ 

./muscle3.8.31_i86linux64 -in rna.fna -out muscle_*.fna -maxiters 1 -diags # This is the code we are going to use to do the muscle alignment, since the are a few species it is not going to take long

cd ../../


# Go to the this folder: ND1_Falconiformes_genes/

cd ND1_Falconiformes_genes

mkdir MUSCLE # This is were we are going to work with the muscle alignment

cp ../muscle3.8.31_i86linux64 ./

mv muscle3.8.31_i86win32.exe ./ MUSCLE/

mv ND1_Falconiformes.fna MUSCLE/

./muscle3.8.31_i86linux64 -in rna.fna -out muscle_*.fna -maxiters 1 -diags

cd ../../


# Go to the this folder: ODC_Accipitriformes_genes/

cd ODC_Accipitriformes_genes/

mkdir MUSCLE # This is were we are going to work with the muscle alignment

cp ../muscle3.8.31_i86linux64 ./

mv muscle3.8.31_i86win32.exe ./ MUSCLE/
                                                                                                                                                                                            mv ND1_Falconiformes.fna MUSCLE/
mv ODC_Accipitriformes.fna MUSCLE/

./muscle3.8.31_i86linux64 -in rna.fna -out muscle_*.fna -maxiters 1 -diags

cd ../../


# Go to the this folder: ODC_Falconiformes_genes/

cd ODC_Falconiformes_genes/

mkdir MUSCLE # This is were we are going to work with the muscle alignment

cp ../muscle3.8.31_i86linux64 ./

mv muscle3.8.31_i86win32.exe ./ MUSCLE/
                                                                                                                                                                                           >mv ODC_Accipitriformes.fna MUSCLE/
mv ODC_Falconiformes.fna MUSCLE/

./muscle3.8.31_i86linux64 -in rna.fna -out muscle_*.fna -maxiters 1 -diags

cd ../../


# Go to the this folder: SWS1_Accipitriformes_genes/

cd SWS1_Accipitriformes_genes/

mkdir MUSCLE # This is were we are going to work with the muscle alignment

cp ../muscle3.8.31_i86linux64 ./

mv muscle3.8.31_i86win32.exe ./ MUSCLE/
                                                                                                                                                                                           >mv ODC_Falconiformes.fna MUSCLE/
mv SWS1_Accipitriformes.rna ./ MUSCLE/

./muscle3.8.31_i86linux64 -in rna.fna -out muscle_*.fna -maxiters 1 -diags 

cd ../../


# Go to the this folder: SWS1_Falconiformes_genes/

cd SWS1_Falconiformes_genes/

mkdir MUSCLE # This is were we are going to work with the muscle alignment

cp ../muscle3.8.31_i86linux64 ./

mv muscle3.8.31_i86win32.exe ./ MUSCLE/

mv SWS1_Falconiformes.rna MUSCLE/                                                                                                                                                                                           >mv SWS1_Accipitriformes.rna ./ MUSCLE

./muscle3.8.31_i86linux64 -in rna.fna -out muscle_*.fna -maxiters 1 -diags

cd ../../


# Forloop to create a folder IQTREE in all the folder 

for folder in *_genes; do
    mkdir -p "${folder}/IQTREE"
done 


# IQTREE code

# Go to the folder: ND1_Accipitriformes_genes/

cd ND1_Accipitriformes_genes/ 

cd IQTREE/

cp ../MUSCLE/*.fna ./

source /u/local/Modules/default/init/modules.sh
module load iqtree/2.2.2.6 # To activate the iqtree code use this code

iqtree -s *.fna # Since the are few species it is not going to take long 

cd ../../


# Go to the folder: ND1_Falconiformes_genes/

cd ND1_Falconiformes_genes/

cd IQTREE/

cp ../MUSCLE/*.fna ./

source /u/local/Modules/default/init/modules.sh
module load iqtree/2.2.2.6 # To activate the iqtree code use this code

iqtree -s *.fna # Since the are few species it is not going to take long

cd ../../


# Go to the folder: ODC_Accipitriformes_genes/

cd ODC_Accipitriformes_genes/

cd IQTREE/

cp ../MUSCLE/*.fna ./

source /u/local/Modules/default/init/modules.sh
module load iqtree/2.2.2.6 # To activate the iqtree code use this code

iqtree -s *.fna # Since the are few species it is not going to take long

cd ../../


# Go to the folder: ODC_Falconiformes_genes/

cd ODC_Falconiformes_genes/

cd IQTREE/

cp ../MUSCLE/*.fna ./

source /u/local/Modules/default/init/modules.sh
module load iqtree/2.2.2.6 # To activate the iqtree code use this code

iqtree -s *.fna # Since the are few species it is not going to take long

cd ../../


# Go to the folder: SWS1_Accipitriformes_genes/

cd SWS1_Accipitriformes_genes/

cd IQTREE/

cp ../MUSCLE/*.fna ./

source /u/local/Modules/default/init/modules.sh
module load iqtree/2.2.2.6 # To activate the iqtree code use this code

iqtree -s *.fna # Since the are few species it is not going to take long

cd ../../


# Go to the folder: SWS1_Falconiformes_genes/

cd SWS1_Falconiformes_genes/

cd IQTREE/

cp ../MUSCLE/*.fna ./

source /u/local/Modules/default/init/modules.sh
module load iqtree/2.2.2.6 # To activate the iqtree code use this code

iqtree -s *.fna # Since the are few species it is not going to take long

cd ../../


# Forloop to create a folder IQTREE in all the folder

for folder in *_genes; do
    mkdir -p "${folder}/TREES"
done


# Go to the folder: ND1_Accipitriformes_genes/

cd ND1_Accipitriformes_genes/

cd TREES/

cp ../IQTREE/*.tree.file ./ # We do this to organice and take the final product (*.treefile).

cd ../../


# Go to the folder: ND1_Falconiformes_genes/

cd ND1_Falconiformes_genes/

cd TREES/

cp ../IQTREE/*.tree.file ./ # We do this to organice and take the final product (*.treefile).


# Go to the folder: ODC_Accipitriformes_genes/

cd ODC_Accipitriformes_genes/

cd TREES/

cp ../IQTREE/*.tree.file ./ # We do this to organice and take the final product (*.treefile).

cd ../../


# Go to the folder: ODC_Falconiformes_genes/

cd ODC_Falconiformes_genes/

cd TREES/

cp ../IQTREE/*.tree.file ./ # We do this to organice and take the final product (*.treefile).

cd ../../


# Go to the folder: SWS1_Accipitriformes_genes/

cd SWS1_Accipitriformes_genes/

cd TREES/

cp ../IQTREE/*.tree.file ./ # We do this to organice and take the final product (*.treefile).

cd ../../


# Go to the folder: SWS1_Falconiformes_genes/

cd SWS1_Falconiformes_genes/

cd TREES/

cp ../IQTREE/*.tree.file ./ # We do this to organice and take the final product (*.treefile).

cd ../../


# Final product 

mkdir Final_phylogenie

cp *_genes/TREES/*.treefile Final_phylogenie/

# We do this to have all the file *.treefile in one folder

cd Final_phylogenie

cat *.treefile > All.Accipitriformes.Falconiformes.treefile

# End of the code
