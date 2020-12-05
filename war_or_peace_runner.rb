require './lib/deck'
require './lib/player'
require './lib/card'
require './lib/turn'
require './lib/game'
require 'pry'

#deck set up
standard_deck = []
suits = [:club, :diamond, :heart, :spade]

suits.map do |suit|
  (2..14).each do |card|
    if card > 1 && card < 11
      standard_deck << Card.new(suit, "#{card}", card)
    elsif card == 11
      standard_deck << Card.new(suit, 'Jack', card)
    elsif card == 12
      standard_deck << Card.new(suit, 'Queen', card)
    elsif card == 13
      standard_deck << Card.new(suit, 'King', card)
    elsif card == 14
      standard_deck << Card.new(suit, 'Ace', card)
    end
  end
end

shuffle_deck = standard_deck.shuffle
cards1 = []
cards2 = []
shuffle_deck.each_with_index do |card, index|
  if index < 26
    cards1 << card
  else
    cards2 << card
  end
end

deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)


player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
  #Game set up
# turns = Turn.new(player1, player2)
# game = Game.new(turns)

# game.start
  turn_index = 0
# while turns.player1.deck.cards.empty? == true || turns.player2.deck.cards.empty? == false || turn_index < 10
  500.times do
    turn_index +=1
    turns = Turn.new(player1, player2)
    game = Game.new(turns)


      if turns.type == :basic
          winner = game.turns.winner
        turns.pile_cards
        turns.award_spoils(winner)
            win_name = winner.name
          puts "Turn #{turn_index}: #{win_name} won 2 cards. Megan has #{turns.player1.deck.cards.length}. Auroa has #{turns.player2.deck.cards.length}."
      elsif turns.type == :war
          winner = game.turns.winner
        turns.pile_cards
        turns.award_spoils(winner)
            win_name = winner.name
          puts "Turn #{turn_index}: WAR - #{win_name} won 6 cards. Megan has #{turns.player1.deck.cards.length}. Auroa has #{turns.player2.deck.cards.length}."
      elsif turns.type == :mutually_assured_destruction
        turns.pile_cards
        # turns.award_spoils(winner)
          puts "Turn #{turn_index}: *mutually assured destruction* 6 cards removed from play"
      end
    # end

    # while turn_index < 10 #|| game.turns.player1.deck.cards == [] || || game.turns.player2.deck.cards != []
    # end
  end
