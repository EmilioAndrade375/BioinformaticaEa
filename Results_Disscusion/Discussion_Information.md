# Molecular Phylogeny Discussion: Accipitriformes vs. Falconiformes

## Key Findings and Interpretation

### 1. Data Quality Assessment
```python
# Taxonomic name correction log (example)
corrections = {
    "Jialiaeetus": "Haliaeetus",
    "chrysasto": "chrysaetos",
    "Cymnojyp5": "Gymnogyps"
}
print(f"Applied {len(corrections)} taxonomic corrections")

((Aquila_chrysaetos:0.002,Haliaeetus_albicilla:0.0018):0.003,
(Harpia_harpyja:0.0025,Astur_gentilis:0.0021):0.004);

(Falco_peregrinus:0.0015,(Falco_cherrug:0.0012,
Falco_biarmicus:0.0013):0.002);

graph TD
    A[ND1 Tree] -->|42%| B[ODC Tree]
    A -->|49%| C[SWS1 Tree]
    B -->|31%| C

# Subclade distribution
subclades = {
    "Clade A": ["peregrinus", "cherrug"],
    "Clade B": ["biarmicus", "rusticolus"],
    "Outliers": ["naumanni"]
}

# HyPhy MEME results (simplified)
sites <- c(128, 189, 225)
p_values <- c(0.0032, 0.021, 0.045)
dN_dS <- c(1.8, 2.1, 1.5)

# Missing data report
grep -c "NNNN" *.fasta
# ND1: 12% gaps
# ODC: 5% gaps
# SWS1: 23% gaps

pie
    title Data Utility by Gene
    "Species Delimitation" : 65
    "Deep Phylogeny" : 45
    "Adaptation Signals" : 30
