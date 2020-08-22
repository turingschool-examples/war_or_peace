class Standard_Deck
  # standard deck has two properties
  # the deck itself
  # which holds the cards


  # each card has three properties
  # suit = diamond, heart, club, spade
  # value = '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'
  # rank = 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14

  #card_value = {
    #'2' => 2,
    #'3' => 3,
    #'4' => 4,
    #'5' => 5,
    #'6' => 6,
    #'7' => 7,
    #'8' => 8,
    #'9' => 9,
    #'10' => 10,
    #'Jack' => 11,
    #'Queen' => 12,
    #'King' => 13,
    #'Ace' => 14
  #}

attr_reader :card_suit
            :card_value
            :card_rank
            :standard_deck
  def initialize(card_suit, card_value, card_rank)
    @card_suit = card_suit
    @card_value = card_value
    @card_rank =  card_rank
    @standard_deck = []
  end

  card_suit = ['Diamond', 'Heart', 'Club', 'Spade']
  card_value = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
  card_rank = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  standard_deck = []
  # associate card_value with card_rank for each card_suit
  #card_suit.each do |suit|

      standard_deck << Standard_Deck.new(card_suit, card_value, card_rank )

  #end
end

standard_deck = Standard_Deck.new('Diamond', '2', 2)

puts standard_deck
