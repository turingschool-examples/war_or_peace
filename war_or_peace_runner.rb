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
turns = Turn.new(player1, player2)
game = Game.new(turns)

# game.start
  turn_index = 0
5.times.map do
  turn_index +=1
  winner = game.turns.winner
  win_name = winner.name
  turns.pile_cards
  turns.award_spoils(winner)
    if turns.type == :basic
        puts "Turn #{turn_index}: #{win_name} won 2 cards: #{turns.spoils_of_war[0]}. Megan has #{turns.player1.deck.cards.length}. Auroa has #{turns.player2.deck.cards.length}."
    elsif turns.type == :war
        puts "Turn #{turn_index}: WAR - #{win_name} won 6 cards"
    else type == :mutually_assured_destruction
        puts "Turn #{turn_index}: *mutually assured destruction* 6 cards removed from play"
    end

    # while turn_index < 10 #|| game.turns.player1.deck.cards == [] || || game.turns.player2.deck.cards != []
    # end
  end


  #   winner = game.turns.winner
  #   win_name = winner.name
  #   turns.award_spoils(winner)
  #   turns = Turn.new(player1, player2)
  #       if type == :basic
  #         puts "#{win_name} won 2 cards"
  #       elsif type == :war
  #         puts "WAR - #{win_name} won 6 cards"
  #       else type == :mutually_assured_destruction
  #         puts "*mutually assured destruction* 6 cards removed from play"
  #       end
  #   until game.turns.player1.deck.cards != [] || game.turns.player2.deck.cards != []
  #     break "GAME OVER"
  #   end
  # end




#   if game.turns.player1.deck.cards  == [] && turn.player2.deck.cards == []
#     p "This is mathmatically near impossible, you have accomplished something rare! It is impressive, but everyone LOSES."
#   elsif game.turns.player1.deck.cards  == []
#     p "*~*~*~* Aurora has won the game! *~*~*~*"
#   elsif game.turns.player2.deck.cards == []
#     p "*~*~*~* Megan has won the game! *~*~*~*"
#   elsif
#     p winner = turn.winner
#     p turn.type
#     p turn.pile_cards
#     p turn.award_spoils(winner)
#     p player1.deck.cards.length
#     p player2.deck.cards.length
#     turn = Turn.new(player1, player2)
#   end






























# game.each do |turn|
#   turn.turn.winner = winner
#   turn.turn.pile_cards
#   turn.turn.award_spoils
