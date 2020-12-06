require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/player'

class PlayGame
  def initialize
    deck = create_deck
    deck1 = Deck.new(split_deck_randomly(deck))
    deck2 = Deck.new(deck)
    @p1 = Player.new("Megan", deck1)
    @p2 = Player.new("Aurora", deck2)

  end

  def start
    (1..1000000).each do |turn_num|
      if turn_num == 1000000
        puts "---- DRAW ----"
        break
      end
      turn = Turn.new(@p1, @p2)
      turn_type = turn.type
      winner = turn.winner
      turn.pile_cards
      print "Turn "+turn_num.to_s+": "
      if turn_type == :basic
        puts winner.name+ " won "+turn.spoils_of_war.length.to_s+" cards"
        turn.award_spoils(winner)
      elsif turn_type == :war
        puts "WAR - "+winner.name+ " won "+turn.spoils_of_war.length.to_s+" cards"
        turn.award_spoils(winner)
      elsif turn_type == :mutually_assured_destruction
        puts "*mutually assured destruction* 6 cards removed from play"
      end
      if @p1.has_lost?
        puts "*~*~*~* "+@p2+" has won the game! *~*~*~*"
        break
      elsif @p2.has_lost?
        puts "*~*~*~* "+@p1+" has won the game! *~*~*~*"
        break
      end

    end
  end


  def create_deck
    suits = [:heart, :spade, :diamond, :club]
    deck = []
    suits.each do |suit|
      cards = [
          Card.new(suit, 'Ace', 14),
          Card.new(suit, 'King', 13),
          Card.new(suit, 'Queen', 12),
          Card.new(suit, 'Jack', 11),
          Card.new(suit, '10', 10),
          Card.new(suit, '9', 9),
          Card.new(suit, '8', 8),
          Card.new(suit, '7', 7),
          Card.new(suit, '6', 6),
          Card.new(suit, '5', 5),
          Card.new(suit, '4', 4),
          Card.new(suit, '3', 3),
          Card.new(suit, '2', 2)
      ]
      cards.each do |card|
        deck.push(card)
      end
    end
    deck
  end

  def split_deck_randomly(deck)
    half_deck = []
    (1..26).each do
      rand_card = deck.sample
      half_deck.push(rand_card)
      deck.delete(rand_card)
    end
    half_deck
  end
end
