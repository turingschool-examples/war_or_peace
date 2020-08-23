require './lib/card'

class StandardDeck
  # standard deck has two properties
  # the deck itself
  # which holds the cards


  # each card has three properties
  # suit = diamond, heart, club, spade
  # value = '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'
  # rank = 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14

  #card__rank_and_value = {
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

#attr_reader :card_suit
            #:card_value
            #:card_rank
            #:standard_deck  def initialize(card_suit, card_value, card_rank)




  def initialize
    @standard_deck = []
    card_suits = [:diamond, :heart, :club, :spade]
    card_values = {
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

    card_suits.each do |suit|

      card_values.each do |value, rank|


        @standard_deck << Card.new(suit, value, rank)


      end
    end



  end

  def randomize
    shuffle_deck = []
    shuffle_deck << @standard_deck.shuffle!
    shuffle_deck.flatten!
    return shuffle_deck
  end


end

#standard_deck = StandardDeck.new
#p standard_deck.randomize


    #p value
    #p rank
  #end


  #card_suit = ['Diamond', 'Heart', 'Club', 'Spade']
  #card_value = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
  #card_rank = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  #standard_deck = []
  # associate card_value with card_rank for each card_suit
  #card_suit.each do |suit|
    #@card_values.each_key do |value|
    #if value.class == Integer
      #rank = value
    #elsif face == 'Jack'
      #rank = 11
    #elsif face == 'Queen'
          #rank = 12
    #elsif face == 'King'
      #rank = 13
    #elsif face == 'Ace'
      #rank = 14
      #@card_suits.each do |suit|
        #@standard_deck << Card.new(suit, value, rank)
      #standard_deck << Standard_Deck.new(card_suit, card_value, card_rank)
      #end
    #end
  #end
#
#
  ##end
#end

#standard_deck = StandardDeck.new('Diamond', '2', 2)
#
#puts standard_deck
