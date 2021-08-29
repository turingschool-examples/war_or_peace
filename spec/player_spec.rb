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

    it 'check if player has a deck' do
      expect(@player1.deck).to eq(@deck)
    end


    it 'checks to see if a player has lost' do
      expect(@player1.has_lost?).to eq(false)
      3.times do
        @player1.deck.remove_card
      end
      # @player1.deck.remove_card
      # @player1.deck.remove_card
      # @player1.deck.remove_card
      expect(@player1.has_lost?).to eq(true)
    end

    it 'has a playable deck' do
      expect(@player1.deck).to eq(@deck)
    end
  end
end
