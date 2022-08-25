require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

RSpec.describe Turn do
  describe '#initialize' do
    it 'exists' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn).to be_an_instance_of(Turn)
    end

    it 'has attributes' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn.player1).to eq(player1)
      expect(turn.player2).to eq(player2)
      expect(turn.type).to eq(:basic)
    end
  end

  describe '#winner' do
    it 'determines winner of turn' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      turn.player1
      turn.player2
      turn.spoils_of_war
      turn.type
      expect(turn.winner).to eq(player1)
    end
  end

  describe '#pile_cards' do
    it 'sends cards from players deck to spoils_of_war' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      turn.type
      winner = turn.winner
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([card1, card3])
    end
  end

  



end

# QUESTION: ITERATION 2 PROVIDES 3 INTERACTION PATTERNS. SHOULD I BE INCLUDING EACH OF THE THREE IN MY TESTING? JUST FOCUS ON ONE FOR TESTING?
