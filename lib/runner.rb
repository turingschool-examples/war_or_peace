require './card'

# create deck
# create players
# make a game
# tell it to play

def create_deck
  suits = [:heart, :diamond, :spade, :club]
  deck = []

  suits.each do |suit|
    (2..14).each do |number|
      deck << Card.new(suit, card_value(number), number)
    end
  end

  deck
end

def card_value(rank)
    case rank
      when 14
        "Ace"
      when 13
        "King"
      when 12
        "Queen"
      when 11
        "Jack"
      else
        rank.to_s
    end
end

def shuffle_deck(deck)
  deck.shuffle
end
