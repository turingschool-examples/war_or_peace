require 'rspec'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'
require './lib/game.rb'

describe Game do

  before :each do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '3', 3)
    @card4 = Card.new(:heart, 'Queen', 12)
    @card5 = Card.new(:heart, '4', 4)
    @card6 = Card.new(:diamond, '8', 8)
    @card7 = Card.new(:diamond, '4', 4)
    @card8 = Card.new(:diamond, '2', 2)
    @card9 = Card.new(:diamond, '9', 9)
    @card10 = Card.new(:diamond, '6', 6)
    @deck1 = Deck.new([@card1, @card2, @card3, @card4, @card5])
    @deck2 = Deck.new([@card6, @card7, @card8, @card9, @card10])
    @player1 = Player.new('P1', @deck1)
    @player2 = Player.new('P2', @deck2)
  end

  context 'Scenario 1' do
    it 'exists' do
      game = Game.new(@player1, @player2)

      expect(game).to be_a(Game)
    end

    it 'might have a winner' do
      game = Game.new(@player1, @player2)
      result = game.start

      expect(result).to eq(@player1)
    end
  end

  context 'Scenario 2' do
    it 'could also be a draw' do
      @deck1 = Deck.new([@card1, @card8, @card6, @card9, @card5])
      @deck2 = Deck.new([@card10, @card3, @card2, @card7, @card4])
      @player1 = Player.new('P1', @deck1)
      @player2 = Player.new('P2', @deck2)
      game = Game.new(@player1, @player2)
      result = game.start

      expect(result).to eq('DRAW')
    end
  end

  context 'Scenario 3' do
    it "P1 doesn't have to win" do
      @deck1 = Deck.new([@card5, @card8, @card6, @card9, @card1])
      @deck2 = Deck.new([@card7, @card3, @card2, @card10, @card4])
      @player1 = Player.new('P1', @deck1)
      @player2 = Player.new('P2', @deck2)
      game = Game.new(@player1, @player2)
      result = game.start

      expect(result).to eq(@player2)
    end
  end

  context 'Scenario 4' do
    it 'could be a weird game' do
      @deck1 = Deck.new([@card1, @card2, @card3, @card4, @card5])
      @deck2 = Deck.new([@card1, @card2, @card3, @card4, @card5])
      @player1 = Player.new('P1', @deck1)
      @player2 = Player.new('P2', @deck2)
      game = Game.new(@player1, @player2)
      result = game.start

      expect(result).to eq('No Winner')
    end
  end
end
