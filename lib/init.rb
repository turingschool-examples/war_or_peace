require './lib/card'
require './lib/deck'
require './lib/player'

class Init
  def display_start_message(player1, player2)
    puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    puts "The players today are #{player1.name} and #{player2.name}."
    puts "Type 'GO' to start the game!"
  end

  def start

  end

  def new_shuffled_deck
    card_values = Array(2..10).map { |num| [num.to_s, num] }

    card_values << ['Jack', 11]
    card_values << ['Queen', 12]
    card_values << ['King', 13]
    card_values << ['Ace', 14]

    suits = %i[diamond heart spade club]
    whole_deck = Deck.new([])

    card_values.each do |value|
      suits.each { |suit| whole_deck.add_card(Card.new(suit, value[0], value[1])) }
    end

    Deck.new(whole_deck.cards.shuffle)
  end

  def create_players(names)
    decks = deal_cards

    [Player.new(names[0], decks[0]), Player.new(names[1], decks[1])]
  end

  def deal_cards
    deck1 = Deck.new([])
    deck2 = Deck.new([])

    new_shuffled_deck.each_with_index do |card, idx|
      case idx.even?
      when true
        deck1.add_card(card)
      when false
        deck2.add_card(card)
      end
    end

    [deck1, deck2]
  end
end
