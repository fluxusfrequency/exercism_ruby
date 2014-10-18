class InvalidCodonError < ArgumentError; end

class Translation
  def self.of_codon(codon)
    raise InvalidCodonError unless CODONS.keys.any?{|k| k.include?(codon)}
    key = CODONS.keys.find{ |key| key.include?(codon) }
    CODONS[key]
  end

  def self.of_rna(strand)
    strand.chars.each_slice(3).with_object([]) do |codon, output|
      return output if of_codon(codon.join) == "STOP"
      output << of_codon(codon.join)
    end
  end

  CODONS = {
    ["AUG"] => "Methionine",
    ["UUU", "UUC"] => "Phenylalanine",
    ["UUA", "UUG"] => "Leucine",
    ["UCU", "UCC", "UCA", "UCG"] => "Serine",
    ["UAU", "UAC"] => "Tyrosine",
    ["UGU", "UGC"] => "Cystine",
    ["UGG"] => "Tryptophan",
    ["UAA", "UAG", "UGA"] => "STOP"
  }
end
