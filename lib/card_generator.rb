class CardGenerator

attr_reader :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = create_cards
  end

  def create_cards
    File.readlines('cards.txt').map do |line|
      card_info = line.chomp.delete(" ").split(',')
      Card.new(card_info[1], card_info[0], card_info[2].to_i)
    end
  end
end
