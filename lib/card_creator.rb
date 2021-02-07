
class CardCreator
  attr_reader :ranks,
              :suits,
              :full_deck

  def initialize(ranks = all_ranks, suits = all_suits)
    @ranks = ranks
    @suits = suits
    @full_deck = []
  end

  def all_ranks
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

  def all_suits
    [:heart, :diamond, :spade, :club]
  end



def create_deck
  @suits.each do |suit|
    @ranks.each do |value, rank|
      @full_deck << Card.new(suit, value, rank)
      end
    end
  end
end
