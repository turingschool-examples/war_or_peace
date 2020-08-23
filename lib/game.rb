class Game
  attr_reader :player1, :player2, :all_cards

  SUITS = ['Spades', 'Hearts', 'Diamonds', 'Clubs']
  VALUES_TO_RANK = {
    '2' => 1,
    '3' => 2,
    '4' => 3,
    '5' => 4,
    '6' => 5,
    '7' => 6,
    '8' => 7,
    '9' => 8,
    '10' => 9,
    'J' => 10,
    'Q' => 11,
    'K' => 12,
    'A' => 13,
  }

  def initialize
    all_cards = build_cards
    deck_1, deck_2 = split_deck(all_cards)

    @player1 = Player.new("Megan", deck_1)
    @player2 = Player.new("Aurora", deck_2)
  end

end
