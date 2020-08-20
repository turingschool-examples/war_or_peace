require './card'
require './deck'

class Init
  def display_start_message(player1, player2)
    puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    puts "The players today are #{player1.name} and #{player2.name}."
    puts "Type 'GO' to start the game!"
  end

  def start

  end

  def new_shuffled_deck
    card_values = []
    2..10.each do |num|
      card_values << [num.to_s, num]
    end

    card_values << ['Jack', 11], ['Queen', 12], ['King', 13], ['Ace', 14]

    suits = [:diamond, :heart, :spade, :club]
    whole_deck = Deck.new([])

    card_values.each do |value|
      suits.each { |suit| whole_deck.add_card(Card.new(suit, value[0], value[1]))}
    end
  end
end