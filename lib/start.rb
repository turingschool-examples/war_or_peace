require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'rspec'
require 'pry'

class Start
  attr_reader :turn,
              :new_game
  def initialize
    # @turn = turn
  end

  def new_game
    starting_deck = [
    card1 = Card.new(:heart, 'Two', 2),
    card2 = Card.new(:heart, 'Three', 3),
    card3 = Card.new(:heart, 'Four', 4),
    card4 = Card.new(:heart, 'Five', 5),
    card5 = Card.new(:heart, 'Six', 6),
    card6 = Card.new(:heart, 'Seven', 7),
    card7 = Card.new(:heart, 'Eight', 8),
    card8 = Card.new(:heart, 'Nine', 9),
    card9 = Card.new(:heart, 'Ten', 10),
    card10 = Card.new(:heart, 'Jack', 11),
    card11 = Card.new(:heart, 'Queen', 12),
    card12 = Card.new(:heart, 'King', 13),
    card13 = Card.new(:heart, 'Ace', 14),
    card14 = Card.new(:clubs, 'Two', 2),
    card15 = Card.new(:clubs, 'Three', 3),
    card16 = Card.new(:clubs, 'Four', 4),
    card17 = Card.new(:clubs, 'Five', 5),
    card18 = Card.new(:clubs, 'Six', 6),
    card19 = Card.new(:clubs, 'Seven', 7),
    card20 = Card.new(:clubs, 'Eight', 8),
    card21 = Card.new(:clubs, 'Nine', 9),
    card22 = Card.new(:clubs, 'Ten', 10),
    card23 = Card.new(:clubs, 'Jack', 11),
    card24 = Card.new(:clubs, 'Queen', 12),
    card25 = Card.new(:clubs, 'King', 13),
    card26 = Card.new(:clubs, 'Ace', 14),
    card27 = Card.new(:diamond, 'Two', 2),
    card28 = Card.new(:diamond, 'Three', 3),
    card29 = Card.new(:diamond, 'Four', 4),
    card30 = Card.new(:diamond, 'Five', 5),
    card31 = Card.new(:diamond, 'Six', 6),
    card32 = Card.new(:diamond, 'Seven', 7),
    card33 = Card.new(:diamond, 'Eight', 8),
    card34 = Card.new(:diamond, 'Nine', 9),
    card35 = Card.new(:diamond, 'Ten', 10),
    card36 = Card.new(:diamond, 'Jack', 11),
    card37 = Card.new(:diamond, 'Queen', 12),
    card38 = Card.new(:diamond, 'King', 13),
    card39 = Card.new(:diamond, 'Ace', 14),
    card40 = Card.new(:spade, 'Two', 2),
    card41 = Card.new(:spade, 'Three', 3),
    card42 = Card.new(:spade, 'Four', 4),
    card43 = Card.new(:spade, 'Five', 5),
    card44 = Card.new(:spade, 'Six', 6),
    card45 = Card.new(:spade, 'Seven', 7),
    card46 = Card.new(:spade, 'Eight', 8),
    card47 = Card.new(:spade, 'Nine', 9),
    card48 = Card.new(:spade, 'Ten', 10),
    card49 = Card.new(:spade, 'Jack', 11),
    card50 = Card.new(:spade, 'Queen', 12),
    card51 = Card.new(:spade, 'King', 13),
    card52 = Card.new(:spade, 'Ace', 14)
    ]
    starting_deck.shuffle!

    deck1 = Deck.new([])
    deck2 = Deck.new([])

    26.times do |deal_to_deck1|
      deck1.cards << starting_deck.pop
    end


    26.times do |deal_to_deck2|
      deck2.cards <<  starting_deck.pop
    end

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    turn_count = 0
    until turn_count == 1000000
      turn_count += 1
      if turn.type == :basic
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        p "Turn #{turn_count}: #{winner.name} has won 2 cards!"
      elsif turn.type == :war
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        p "Turn #{turn_count}: WAR - #{winner.name} has won 6 cards!"
      elsif turn.type == :mutually_assured_destruction
        turn.pile_cards
        p "Turn #{turn_count}: *mutually_assured_destruction* - 6 cards have been removed from play."
      end
    end

    if turn.player1.has_lost? || turn.player2.has_lost?
      p "~*~*~*~#{winner.name} has won the game!~*~*~*~"
    elsif turn_count == 1000000
      p "Draw - Game Over"
    elsif turn.player1.deck.cards.count < 3 || turn.player2.deck.cards.count < 3
      p "Draw - Game Over"
    end
  end
  # break if player1.has_lost? || player2.has_lost?
  # || player1.deck.cards.count < 3 || player2.deck.cards.count < 3
end
