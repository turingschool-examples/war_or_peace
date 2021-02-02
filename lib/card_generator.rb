class CardGenerator
  attr_reader :filename
  def initialize(f)
    @filename = f

  end

  def generate_txt
    path_to_file = "#{filename}"

    File.delete(path_to_file) if File.exist?(path_to_file)

    suits = %w[Spades Hearts Diamonds Clubs]
    ranks = %w{2 3 4 5 6 7 8 9 10 Jack Queen King Ace}
    suits.each do |suit|
      ranks.size.times do |i|
        File.open(path_to_file, "a") { |f| f.write "#{ranks[i]}, #{suit}, #{i+2} \n" }
      end
    end
  end

  def cards
    card_array = self.file_to_array
    standard_deck = []
    52.times {
      rank = card_array.shift
      suit = card_array.shift
      value = card_array.shift.to_i
      standard_deck << Card.new(suit, rank, value)
    }
    standard_deck
  end

  def file_to_array
    path_to_file = "#{filename}"
    text = File.open(path_to_file).read.scan(/\w+/)
  end

end
