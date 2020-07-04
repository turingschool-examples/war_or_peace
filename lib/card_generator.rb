class CardGenerator

  def initialize(given_file)

    @card_file = given_file
    @initial_deck = []
    @main_deck = []

  end

  def create_cards
    file = File.open(@card_file)

    file.each do |line|
      @initial_deck << line.split(",")
    end

    file.close
    @initial_deck.each do |card|
      @main_deck << Card.new(card[0].to_sym, card[1].to_s, card[2].to_i)
    end
    @main_deck
  end

end
