class CardGenerator
  attr_reader :suits,
              :ranks,
              :full_card_deck

  def initialize(suits = default_suits, ranks = default_ranks)
    @suits = suits
    @ranks = ranks
    @full_card_deck = []
  end

  def default_suits
    [:heart, :spade, :club, :diamond]
  end

  def default_ranks
    {
      '2' => 2,
      '3' => 3,
      '4' => 4,
      '5' => 5,
      '6' => 6,
      '7' => 7,
      '8' => 8,
      '9' => 9,
      '10' => 10,
      'Jack' => 11,
      'Queen' => 12,
      'King' => 13,
      'Ace' => 14
    }
  end
end
