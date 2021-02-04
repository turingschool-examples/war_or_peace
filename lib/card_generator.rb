class CardGenerator
  SUITS = %w[Spades Hearts Diamonds Clubs].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze

  attr_reader :filename
  def initialize(f)
    @filename = f

  end

  def generate_txt
    File.delete(filename) if File.exist?(filename)
    SUITS.each do |suit|
      RANKS.size.times do |i|
        File.open(filename, "a") { |f| f.puts "#{RANKS[i]}, #{suit}, #{i+2}" }
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
    text = File.open(filename).read.scan(/\w+/)
  end

end
