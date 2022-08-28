require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'
require 'pry'

RSpec.describe Game do
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
      war = Game.new(player1, player2, turn)
      expect(war).to be_an_instance_of(Game)
    end
  end

  describe '#game_go' do
    it 'sends cards to winner' do # basic
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
      expect(turn.type).to eq(:basic)
      turn.pile_cards
      expect(turn.winner).to eq(player1)
      expect(turn.spoils_of_war).to eq([card1, card3])
      turn.award_spoils(turn.winner)
      expect(player1.deck.cards.length).to eq(5)
    end

    it 'sends cards to winner' do # war
      card1 = Card.new(:heart, '9', 9)
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
      expect(turn.type).to eq(:war)
      turn.pile_cards
      expect(turn.winner).to eq(player2)
      expect(turn.spoils_of_war).to eq([card1, card3, card2, card4, card5, card6])
      turn.award_spoils(turn.winner)
      expect(player1.deck.cards.length).to eq(1)
      expect(player2.deck.cards.length).to eq(7)
    end

    it 'sends cards out of game' do # mutually_assured_destruction
      card1 = Card.new(:heart, '9', 9)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:heart, '8', 8)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn.type).to eq(:mutually_assured_destruction)
      expect(turn.winner).to eq('No Winner')
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([])
      expect(player1.deck.cards.length).to eq(1)
      expect(player2.deck.cards.length).to eq(1)
    end

    it 'loses when can\'t go to war' do
      card1 = Card.new(:heart, '9', 9)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      #binding.pry
      expect(turn.type).to eq(:player2_lost)
      turn.pile_cards
      expect(player2.deck.cards.length).to eq(0)
    end
  end

end
