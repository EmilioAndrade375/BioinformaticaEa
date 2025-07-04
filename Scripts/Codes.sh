
## Codes for the proyect 

# In order to download a from the NCBI database use the following code:

# Species: Staphylococcus epidermidis , gene: Methicillin/oxacillin resistance (MRSA). [mecA]
./datasets download gene symbol mecA --taxon "Staphylococcus epidermidis" --filename mecA_Sepidermidis.zip

# Species: Staphylococcus haemolyticus , gene: Methicillin/oxacillin resistance (MRSA). [mecA]
./datasets download gene symbol mecA --taxon "Staphylococcus haemolyticus" --filename mecA_Shaemolyticus.zip

# Species: Staphylococcus lugdunensi , gene: Methicillin/oxacillin resistance (MRSA). [mecA]
./datasets download gene symbol mecA --taxon "Staphylococcus lugdunensis" --filename mecA_Slugdunensis.zip

# Species: Staphylococcus hominis , gene: Methicillin/oxacillin resistance (MRSA). [mecA]
./datasets download gene symbol mecA --taxon "Staphylococcus hominis" --filename mecA_Shominis.zip

# # Species: Staphylococcus pseudintermedius , gene: Methicillin/oxacillin resistance (MRSA). [mecA]
./datasets download gene symbol mecA --taxon "Staphylococcus pseudintermedius" --filena
me mecA_Spseudintermedius.zip

# note: This species and gene are special because they are esential for the study of  antibiotic resistance, that is why I did it one by one 

## Code for downloading the gene rboP (RNA polymerase) for 20 species of Staphylococcus 

#!/bin/bash

# 20 species list of Staphylococcu
species_list=(
    "Staphylococcus aureus"                  # TaxID: 1280
    "Staphylococcus epidermidis"             # TaxID: 1282 
    "Staphylococcus haemolyticus"            # TaxID: 1283 
    "Staphylococcus lugdunensis"             # TaxID: 28035 
    "Staphylococcus pseudintermedius"        # TaxID: 1286 
    "Staphylococcus saprophyticus"           # TaxID: 1285 
    "Staphylococcus hominis"                 # TaxID: 1290 
    "Staphylococcus capitis"                 # TaxID: 29388 
    "Staphylococcus warneri"                 # TaxID: 1292 
    "Staphylococcus cohnii"                  # TaxID: 1288 
    "Staphylococcus xylosus"                 # TaxID: 1289 
    "Staphylococcus sciuri"                  # TaxID: 1296 
    "Staphylococcus simulans"                # TaxID: 1287 
    "Staphylococcus felis"                   # TaxID: 46127 
    "Staphylococcus equorum"                 # TaxID: 246432 
    "Staphylococcus pettenkoferi"            # TaxID: 170573 
    "Staphylococcus argenteus"               # TaxID: 1578719 
    "Staphylococcus schleiferi"              # TaxID: 1295 
    "Staphylococcus borealis"                # TaxID: 939584
    "Staphylococcus condimenti"              # TaxID: 164798 
)

# Output
output_dir="staphylococcus_phylogeny"
mkdir -p "$output_dir"

# Phylogeny-conserved gene (rpoB: RNA polymerase beta)
target_gene="rpoB"

for species in "${species_list[@]}"; do
    # Format file name (replace spaces and special characters)
    filename="${species// /_}_${target_gene}.zip"
    filename="${filename//subsp./subsp}"  # Clean "subsp."

    echo "🔍 Procesando: $species ($target_gene)..."
    
    # Verify if the gene exists in the NCBI database
    if ./datasets summary gene symbol "$target_gene" --taxon "$species" &>/dev/null; then
        echo "   ✔ Gen encontrado. Descargando..."
        ./datasets download gene symbol "$target_gene" --taxon "$species" --filename "$output_dir/$filename"
        
        if [ $? -eq 0 ]; then
            echo "   ✅ Successful download: $filename"
        else
            echo "   ❌ Download error"
        fi
    else
        echo "   ⚠️ Gene NOT found in $species"
        # Register missing species
        echo "$species" >> "$output_dir/missing_species.log"
    fi
done

echo "✨ Process completed. Results in: $output_dir/"

# Note: Created with the help of the artificial intelegence of DeepSeek (Not every species is going to download the gene, it doesn´t depends on the code itself but in the NCBI dataset)

