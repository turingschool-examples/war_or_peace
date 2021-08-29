require 'rspec'
require './lib/deck.rb'
require './lib/card.rb'
require './lib/player.rb'

describe Player do
  context 'iteration 2' do
    before :each do
      @card1 = Card.new(:diamond, 'Queen', 12)
      @card2 = Card.new(:spade, '3', 3)
      @card3 = Card.new(:heart, 'Ace', 14)
      @cards = [@card1, @card2, @card3]
      @deck = Deck.new(@cards)
      @player1 = Player.new('Clarissa', @deck)
    end
    it 'exists' do
      expect(@player1).to be_a(Player)
    end

    it 'has a name' do
      expect(@player1.name).to eq('Clarissa')
    end

    it 'can remove a card' do
      expect(@player1.deck.remove_card).to eq(@card1)
    end

    it 'removes card and checks if it has lost' do
      expect(@player1.deck.remove_card).to eq(@card1)
      expect(@player1.has_lost).to eq(false)
      expect(@player1.deck.remove_card).to eq(@card2)
      expect(@player1.has_lost).to eq(false)
      expect(@player1.deck.remove_card).to eq(@card3)
      expect(@player1.has_lost).to eq(true)
    end

    it 'has a playable deck' do
      require "pry"; binding.pry
      expect(@player1.deck).to eq(@deck)
    end
  end
end
