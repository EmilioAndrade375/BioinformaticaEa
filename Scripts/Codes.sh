
## Codes for the proyect 

# In order to download a from the NCBI database use the following code:

#!/bin/bash

# List of Staphylococcus species (clinical + diversity)
species_list=(
    "Staphylococcus aureus"                  # MRSA
    "Staphylococcus epidermidis"             # MRSE
    "Staphylococcus haemolyticus"            # Glycopeptide resistance
    "Staphylococcus lugdunensis"             # Emerging pathogen
    "Staphylococcus pseudintermedius"        # Veterinary
    "Staphylococcus saprophyticus"           # UTI pathogen
    "Staphylococcus hominis"                 # Skin microbiota
    "Staphylococcus capitis"                 # NICUs
    "Staphylococcus warneri"                 # Hospital environment
    "Staphylococcus cohnii"                  # Emerging resistance
    "Staphylococcus sciuri"                  # Animal reservoir
    "Staphylococcus argenteus"               # S. aureus relative
    "Staphylococcus xylosus"
    "Staphylococcus felis"
    "Staphylococcus equorum"
    "Staphylococcus pettenkoferi"
    "Staphylococcus schleiferi"
    "Staphylococcus borealis"
    "Staphylococcus condimenti"
    "Staphylococcus simulans"
)

# Target resistance gene (mecA - methicillin resistance)
target_gene="mecA"

output_dir="staph_mecA_phylogeny"
mkdir -p "$output_dir"

# Log file for missing genes
log_file="$output_dir/missing_species.log"
> "$log_file"

echo "Starting mecA gene download across 20 Staphylococcus species..."

for species in "${species_list[@]}"; do
    filename="${species// /_}_${target_gene}.zip"
    filename="${filename//subsp./subsp}"  # Clean subspecies notation
    
    echo -n "🔍 Checking $species for $target_gene..."
    
    if ./datasets summary gene symbol "$target_gene" --taxon "$species" &>/dev/null; then
        echo " FOUND → Downloading..."
        ./datasets download gene symbol "$target_gene" --taxon "$species" --filename "$output_dir/$filename"
        
        if [ $? -eq 0 ]; then
            echo "   ✅ Saved: $filename"
        else
            echo "   ❌ Failed to download"
            echo "$species" >> "$log_file"
        fi
    else
        echo " NOT FOUND"
        echo "$species" >> "$log_file"
    fi
done

echo "========================================"
echo "Download summary:"
echo " - Successful downloads: $(ls -1 $output_dir/*.zip 2>/dev/null | wc -l)"
echo " - Species without mecA: $(wc -l < "$log_file")"
echo " - Output directory: $output_dir/"
echo " - Missing species log: $log_file"

 

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

## Code for downloading the gene blaZ (encodes the enzyme beta-lactamase) for 10 species of Staphylococcus
#!/bin/bash

# Target gene (blaZ = beta-lactamase)
TARGET_GENE="blaZ"

# List of clinically relevant Staphylococcus species

SPECIES_LIST=(
    "Staphylococcus aureus"
    "Staphylococcus epidermidis" 
    "Staphylococcus haemolyticus"
    "Staphylococcus lugdunensis"
    "Staphylococcus pseudintermedius"
    "Staphylococcus saprophyticus"
    "Staphylococcus hominis"
    "Staphylococcus capitis"
    "Staphylococcus warneri"
    "Staphylococcus cohnii"
)

OUTPUT_DIR="staph_blaZ_data"
LOG_FILE="$OUTPUT_DIR/missing_species.log"

# Create output directory
mkdir -p "$OUTPUT_DIR"
> "$LOG_FILE"  # Clear previous log

echo "=== Downloading blaZ gene across ${#SPECIES_LIST[@]} Staphylococcus species ==="

for species in "${SPECIES_LIST[@]}"; do
    # Format filename (replace spaces)
    filename="${species// /_}_${TARGET_GENE}.zip"
    
    echo -n "Checking $species..."
    
    # Verify gene exists
    if ./datasets summary gene symbol "$TARGET_GENE" --taxon "$species" &>/dev/null; then
        echo -n " Found. Downloading..."
        ./datasets download gene symbol "$TARGET_GENE" --taxon "$species" --filename "$OUTPUT_DIR/$filename"
        
        if [ $? -eq 0 ]; then
            echo " ✅"
        else
            echo " ❌ Download failed"
            echo "$species" >> "$LOG_FILE"
        fi
    else
        echo " ❌ Gene not found"
        echo "$species" >> "$LOG_FILE"
    fi
done

# Summary report
COMPLETED=$(ls -1 "$OUTPUT_DIR"/*.zip 2>/dev/null | wc -l)
MISSING=$(wc -l < "$LOG_FILE")

echo "=== Results ==="
echo "Successfully downloaded: $COMPLETED"
echo "Species missing blaZ: $MISSING"
echo "Output directory: $OUTPUT_DIR/"
echo "Missing species logged in: $LOG_FILE"

# Note: Created with the help of the artificial intelegence of DeepSeek (Not every species is going to download the gene, it doesn´t depends on the code itself but in the NCBI dataset)

