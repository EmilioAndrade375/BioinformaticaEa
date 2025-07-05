#!/bin/bash

# Made by: Emilio Andrade (emilio.andrade375@gmail.com)
# 05/07/2024

#$ -l h_rt=24:00:00,h_data=10G
#$ -pe shared 1
#$ -N EANFinalProyect
#$ -cwd
#$ -m bea
#$ -o /u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/JPRP/log/GeneCalculator.out
#$ -e /u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/JPRP/log/GeneCalculator.err
#$ -M dechavezv

## Configuración inicial
set -e  # Detener el script si hay errores
main_dir="Final_Project"

## 1. Crear estructura de directorios
mkdir -p "$main_dir"
cd "$main_dir"

# Crear carpetas para genes
genes=("ND1" "ODC" "SWS1")
taxa=("Accipitriformes" "Falconiformes")

for gene in "${genes[@]}"; do
    for taxon in "${taxa[@]}"; do
        mkdir -p "${gene}_${taxon}_genes"
    done
done

## 2. Copiar programas necesarios
# Verificar que existen los archivos fuente
if [ ! -f "../Programs/muscle3.8.31_i86linux64" ]; then
    echo "ERROR: Archivo muscle no encontrado en ../Programs/"
    exit 1
fi

if [ ! -f "../Programs/datasets" ]; then
    echo "ERROR: Archivo datasets no encontrado en ../Programs/"
    exit 1
fi

cp ../Programs/muscle3.8.31_i86linux64 ./
cp ../Programs/datasets ./
chmod +x datasets muscle3.8.31_i86linux64

## 3. Descargar datos de NCBI
for gene in "${genes[@]}"; do
    for taxon in "${taxa[@]}"; do
        echo "Descargando ${gene} para ${taxon}..."
        ./datasets download gene symbol "$gene" --ortholog "$taxon" --filename "${gene}_${taxon}.zip"
        
        # Mover el archivo a su carpeta correspondiente
        mv "${gene}_${taxon}.zip" "${gene}_${taxon}_genes/"
    done
done

## 4. Procesar archivos descargados
for gene in "${genes[@]}"; do
    for taxon in "${taxa[@]}"; do
        dir="${gene}_${taxon}_genes"
        cd "$dir"
        
        # Descomprimir
        unzip "${gene}_${taxon}.zip"
        
        # Mover y renombrar archivo FASTA
        mv ncbi_dataset/data/rna.fna ./"${gene}_${taxon}.fna"
        
        # Limpieza
        rm -rf ncbi_dataset "${gene}_${taxon}.zip"
        
        cd ..
    done
done

## 5. Alineamiento con MUSCLE
for gene in "${genes[@]}"; do
    for taxon in "${taxa[@]}"; do
        dir="${gene}_${taxon}_genes"
        cd "$dir"
        
        mkdir -p MUSCLE
        cp ../muscle3.8.31_i86linux64 MUSCLE/
        mv "${gene}_${taxon}.fna" MUSCLE/
        
        cd MUSCLE
        ./muscle3.8.31_i86linux64 -in "${gene}_${taxon}.fna" -out "${gene}_${taxon}_aligned.fna" -maxiters 1 -diags
        
        cd ../..
    done
done

## 6. Análisis filogenético con IQ-TREE
for gene in "${genes[@]}"; do
    for taxon in "${taxa[@]}"; do
        dir="${gene}_${taxon}_genes"
        cd "$dir"
        
        mkdir -p IQTREE
        cp MUSCLE/"${gene}_${taxon}_aligned.fna" IQTREE/
        
        cd IQTREE
        
        # Cargar módulo primero (comenta/descomenta según tu sistema)
        module load iqtree  # Para sistemas con módulos
        # O especifica la ruta completa:
        # /ruta/a/iqtree -s "${gene}_${taxon}_aligned.fna" -nt AUTO
        
        iqtree -s "${gene}_${taxon}_aligned.fna" -nt AUTO
        
        cd ../..
    done
done
## 7. Recolectar resultados
mkdir -p Final_phylogeny

for gene in "${genes[@]}"; do
    for taxon in "${taxa[@]}"; do
        cp "${gene}_${taxon}_genes/IQTREE/${gene}_${taxon}_aligned.fna.treefile" Final_phylogeny/
    done
done

## 8. Combinar árboles
cd Final_phylogeny
cat *.treefile > All_Accipitriformes_Falconiformes.treefile

