
Lets write an algorithm to translate RNA sequences into protein. RNA
can be broken into three nucleotide sequences called codons, and then
translated to a protein chain like this:

RNA: "AUGUUUUCU"
Codons: "AUG", "UUU", "UCU"
Protein: "Methionine", "Phenylalanine", "Serine"

There are 64 codons which in turn correspond to 20 amino acids;
however, all of the codon sequences and resulting amino acids are not
important in this exercise.  If it works for one codon, the program
should work for all of them.  However, feel free to expand the list
in the test suite your code to include them all.  There are also four
codons that correspond to 'STOP'; this is to say, if any of these
codons are encountered by the ribosome, all tranlsation ends, the
protein is terminated, and all subsequent codons after are ignored,
like this:

RNA: "AUGUUUUCUUAAAUG"
Codons: "AUG", "UUU", "UCU", "UAG", "AUG"
Protein: "Methionine", "Phenylalanine", "Serine"
Note the stop codon terminates the translation and the final
methionine is not translated into the protein sequence.  

Below are the codons and resulting Amino Acids needed for the
exercise.  
|Codon|               |Protein
---------------------------------------
AUG                   |Methionine
UUU, UUC              |Phenylalanine
UUA, UUG              |Leucine
UCU, UCC, UCA, UCG    |Serine
UAU, UAC              |Tyrosine
UGU, UGC              |Cystine
UGG                   |Tryptophan
UAA, UAG, UGA         |STOP
