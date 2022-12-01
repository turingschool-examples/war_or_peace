class Game 

  attr_reader :turn_count, :deck_of_cards

  def initialize 
    @turn_count = 0
    @deck_of_cards = []
  end

  def create_cards 
 
    card_1 = Card.new(:heart, '9', 9)
    card_2 = Card.new(:heart, '10', 10)
    card_3 = Card.new(:heart, 'Jack', 11)
    card_4 = Card.new(:heart, 'Queen', 12)

    card_5 = Card.new(:diamond, '9', 9)
    card_6 = Card.new(:diamond, '10', 10)
    card_7 = Card.new(:diamond, 'Jack', 11)
    card_8 = Card.new(:diamond, 'Queen', 12)

    card_9 = Card.new(:spade, '9', 9)
    card_10 = Card.new(:spade, '10', 10)
    card_11 = Card.new(:spade, 'Jack', 11)
    card_12 = Card.new(:spade, 'Queen', 12)

    card_13 = Card.new(:club, '9', 9)
    card_14 = Card.new(:club, '10', 10)
    card_15 = Card.new(:club, 'Jack', 11)
    card_16 = Card.new(:club, 'Queen', 12)
    

    @deck_of_cards = [card_1, card_2, card_3, card_4, card_5, card_6,
                      card_7, card_8, card_9, card_10, card_11, card_12, 
                      card_13, card_14, card_15, card_16]
                      
  end 

  def set_up 
    @deck_of_cards.shuffle! 
    deck_1 = Deck.new(@deck_of_cards[0..7])
    deck_2 = Deck.new(@deck_of_cards[7..15]) 
    

    player_1 = Player.new("Megan", deck_1)
    player_2 = Player.new("Aurora", deck_2)
    
  end
end