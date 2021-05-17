require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  context 'type :basic' do
    before do
      @card1 = Card.new(:heart, 'Jack', 11)
      @card2 = Card.new(:heart, '10', 10)
      @card3 = Card.new(:heart, '9', 9)
      @card4 = Card.new(:diamond, 'Jack', 11)
      @card5 = Card.new(:heart, '8', 8)
      @card6 = Card.new(:diamond, 'Queen', 12)
      @card7 = Card.new(:heart, '3', 3)
      @card8 = Card.new(:diamond, '2', 2)
      @deck1 = Deck.new([@card1, @card2, @card5, @card8])
      @deck2 = Deck.new([@card3, @card4, @card6, @card7])
      @player1 = Player.new('Megan', @deck1)
      @player2 = Player.new('Aurora', @deck2)
      @turn = Turn.new(@player1, @player2)
    end

    it 'exists' do
      expect(@turn).to be_a(Turn)
      expect(@turn.player1).to eq(@player1)
      expect(@turn.player2).to eq(@player2)
    end

    it 'has spoils of war method' do
      expect(@turn.spoils_of_war).to eq([])
    end

    it 'returns type method as basic' do
      expect(@turn.type).to eq(:basic)
    end

    it 'returns winner' do
      expect(@turn.winner).to eq(@player1)
    end

    it 'tests pile_cards and returns spoils_of_war' do
      @turn.winner

      expect(@turn.pile_cards).to eq([@card1, @card3])
      expect(@turn.spoils_of_war). to eq ([@card1, @card3])
    end

    it 'gives spoils of war' do
      @turn.winner
      @turn.pile_cards
      @turn.award_spoils

      expect(@turn.player1.deck.cards.length).to eq(5)
      expect(@turn.player2.deck.cards.length).to eq(3)
    end
  end

  context 'turn type :war' do
    before do
      @card1 = Card.new(:heart, 'Jack', 11)
      @card2 = Card.new(:heart, '10', 10)
      @card3 = Card.new(:heart, '9', 9)
      @card4 = Card.new(:diamond, 'Jack', 11)
      @card5 = Card.new(:heart, '8', 8)
      @card6 = Card.new(:diamond, 'Queen', 12)
      @card7 = Card.new(:heart, '3', 3)
      @card8 = Card.new(:diamond, '2', 2)
      @deck1 = Deck.new([@card1, @card2, @card5, @card8])
      @deck2 = Deck.new([@card4, @card3, @card6, @card7])
      @player1 = Player.new('Megan', @deck1)
      @player2 = Player.new('Aurora', @deck2)
      @turn = Turn.new(@player1, @player2)
    end

    it 'returns type method as :war' do
      expect(@turn.type).to eq(:war)
    end

    it 'returns winner as player 2' do
      expect(@turn.winner).to eq(@player2)
    end

    it 'gives spoils of war to player 2' do
      @turn.winner
      @turn.pile_cards
      @turn.award_spoils

      expect(@turn.player2.deck.cards.length).to eq(7)
      expect(@turn.player1.deck.cards.length).to eq(1)
    end
  end
end
