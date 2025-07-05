Proyecto: “Reconstrucción filogenética y análisis comparativo de genes asociados a resistencia a antibióticos en bacterias patógenas”
💡 Idea central:
Utilizar secuencias de genes relacionados con resistencia a antibióticos (como bla, mecA, tet, van, etc.) presentes en distintas especies de bacterias patógenas (Ej. E. coli, Staphylococcus aureus, Klebsiella pneumoniae, etc.) para:

Construir filogenias.

Analizar patrones evolutivos.

Investigar posibles eventos de transferencia horizontal.

🎯 Objetivos:
Recolectar secuencias genéticas de genes de resistencia a antibióticos desde bases de datos públicas como NCBI o CARD.

Alinear secuencias utilizando herramientas como MUSCLE o MAFFT.

Construir árboles filogenéticos (con métodos como Maximum Likelihood o Bayesian Inference).

Comparar los árboles de genes con los árboles de especies para detectar incongruencias (que podrían sugerir transferencia horizontal).

Analizar si ciertos genes de resistencia son más comunes en ciertos clados o si están distribuidos por convergencia/adquisición.

🛠️ Herramientas sugeridas:
NCBI BLAST: Para obtener secuencias.

MEGA / IQ-TREE / RAxML / MrBayes: Para construcción de árboles.

MAFFT / Clustal Omega / MUSCLE: Para alineamiento de secuencias.

FigTree / iTOL: Para visualizar árboles.

Python + Biopython / R + ape / ggtree: Si deseas hacer análisis más programáticos.

🔬 Cosas interesantes que podrías explorar:
¿Hay evidencia de que un mismo gen de resistencia aparece en especies no relacionadas filogenéticamente?

¿Qué tan similares son los genes entre cepas hospitalarias y ambientales?

¿Puedes trazar un posible origen evolutivo de un gen como blaCTX-M?

¿Qué tipo de presiones selectivas han actuado sobre estos genes? (usando dN/dS por ejemplo)
