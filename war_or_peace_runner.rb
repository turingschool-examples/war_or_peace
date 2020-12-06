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

card3 = Card.new(:heart, "2", 2)
card4 = Card.new(:diamond, "2", 2)
card5 = Card.new(:club, "2", 2)
card6 = Card.new(:spade, "2", 2)
card7 = Card.new(:club, "10", 10)
card8 = Card.new(:spade, "10", 10)

card_winner_test = [card3, card3]
card_mad_test = [card8, card8]



deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)



player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)


# game.start
# game.play

turn_index = 0
10000000.times do
    turn_index +=1
    turns = Turn.new(player1, player2)
    game = Game.new(turns)
  if turn_index > 1000000
    return p "---- DRAW ----"
  else
    if turns.type == :basic
      if turns.player1.deck.cards.empty? == true
        return print "*~*~*~* Aurora has won the game! *~*~*~*"
      elsif turns.player2.deck.cards.empty? == true
        return print "*~*~*~* Megan has won the game! *~*~*~*"
      else
        game.turns.winner
        winner = game.turns.winner
        turns.pile_cards
        turns.award_spoils (winner)
        win_name = winner.name
        d1 = turns.player1.deck.cards.length
        d2 = turns.player2.deck.cards.length
        p "Turn #{turn_index}: #{win_name} won 2 cards. Megan has #{d1}. Aurora has #{d2}"
      end
    elsif turns.type == :war
      if turns.player1.deck.cards.length < 3
        return print "*~*~*~* Aurora has won the game! *~*~*~*"
      elsif turns.player2.deck.cards.length < 3
        return print "*~*~*~* Megan has won the game! *~*~*~*"
      else
        winner = game.turns.winner
        turns.pile_cards
        turns.award_spoils(winner)
        win_name = winner.name
        d1 = turns.player1.deck.cards.length
        d2 = turns.player2.deck.cards.length
        puts "Turn #{turn_index}: WAR - #{win_name} won 6 cards. Megan has #{d1}. Aurora has #{d2}"
      end
    else turns.type == :mutually_assured_destruction
      if turns.player1.deck.cards.length < 3
        return print "*~*~*~* Aurora has won the game! *~*~*~*"
      elsif turns.player2.deck.cards.length < 3
        return print "*~*~*~* Megan has won the game! *~*~*~*"
      else
        turns.winner
        turns.pile_cards
        d1 = turns.player1.deck.cards.length
        d2 = turns.player2.deck.cards.length
        puts "Turn #{turn_index}: *mutually assured destruction* 6 cards removed from play. Megan has #{d1}. Aurora has #{d2}"
      end
    end
  end
end
