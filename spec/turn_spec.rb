require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

RSpec.describe Turn do
  describe '#initialize' do
    it 'has two players' do
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

      player1 = Player.new('Robot 1', deck1)
      player2 = Player.new('Robot 2', deck2)

      turn = Turn.new(player1, player2)

      expect(turn.player1).to eq(player1)
      expect(turn.player2).to eq(player2)
    end
  end

  describe '#initialize' do
    it 'starts out without any spoils of war' do
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

      player1 = Player.new('Robot 1', deck1)
      player2 = Player.new('Robot 2', deck2)

      turn = Turn.new(player1, player2)
      expect(turn.spoils_of_war).to eq([])
    end
  end

  describe '#type' do
    it 'can determine the turn type :basic' do
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

      player1 = Player.new('Robot 1', deck1)
      player2 = Player.new('Robot 2', deck2)

      turn = Turn.new(player1, player2)
      expect(turn.type).to eq(:basic)
    end
  end

  describe '#type' do
    it 'can determine the turn type :war' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:spade, 'Jack', 11)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new('Robot 1', deck1)
      player2 = Player.new('Robot 2', deck2)

      turn = Turn.new(player1, player2)
      expect(turn.type).to eq(:war)
    end
  end

  describe '#type' do
    it 'can determine the turn type :mutually_assured_destruction' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:spade, 'Jack', 11)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, '8', 8)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new('Robot 1', deck1)
      player2 = Player.new('Robot 2', deck2)

      turn = Turn.new(player1, player2)
      expect(turn.type).to eq(:mutually_assured_destruction)
    end
  end

  describe '#winner' do
    it 'can determine the winner of a :basic turn' do
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

      player1 = Player.new('Robot 1', deck1)
      player2 = Player.new('Robot 2', deck2)

      turn = Turn.new(player1, player2)
      turn.type

      expect(turn.winner).to eq(player1)
    end
  end

  describe '#winner' do
    it 'can determine the winner of a :war turn' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:spade, 'Jack', 11)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new('Robot 1', deck1)
      player2 = Player.new('Robot 2', deck2)

      turn = Turn.new(player1, player2)
      turn.type

      expect(turn.winner).to eq(player2)
    end
  end

  describe '#winner' do
    it 'works for :mutually_assured_destruction turns' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:spade, 'Jack', 11)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, '8', 8)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new('Robot 1', deck1)
      player2 = Player.new('Robot 2', deck2)

      turn = Turn.new(player1, player2)
      turn.type

      expect(turn.winner).to eq("No Winner.")
    end
  end

  describe '#pile_cards' do
    it 'works for :basic turns' do
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

      player1 = Player.new('Robot 1', deck1)
      player2 = Player.new('Robot 2', deck2)

      turn = Turn.new(player1, player2)
      turn.type
      turn.pile_cards

      expect(turn.spoils_of_war).to eq([card1, card3])
      expect(player1.deck.cards).to eq([card2, card5, card8])
      expect(player2.deck.cards).to eq([card4, card6, card7])
    end
  end

  describe '#pile_cards' do
    it 'works for :war turns' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:spade, 'Jack', 11)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new('Robot 1', deck1)
      player2 = Player.new('Robot 2', deck2)

      turn = Turn.new(player1, player2)
      turn.type
      turn.pile_cards

      expect(turn.spoils_of_war).to eq([card1, card3, card2, card4, card5, card6])
      expect(player1.deck.cards).to eq([card8])
      expect(player2.deck.cards).to eq([card7])
    end
  end

  describe '#pile_cards' do
    it 'works for :mutually_assured_destruction turns' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:spade, 'Jack', 11)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, '8', 8)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new('Robot 1', deck1)
      player2 = Player.new('Robot 2', deck2)

      turn = Turn.new(player1, player2)
      turn.type
      turn.pile_cards

      expect(turn.spoils_of_war).to eq([])
      expect(player1.deck.cards).to eq([card8])
      expect(player2.deck.cards).to eq([card7])
    end
  end

end
