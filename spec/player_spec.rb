require 'spec_helper'

RSpec.describe 'iteration 2' do
  context Player do
    before(:all) do
      @card1 = Card.new(:diamond, 'Queen', 12)
      @card2 = Card.new(:spade, '3', 3)
      @card3 = Card.new(:heart, 'Ace', 14)
      @deck = Deck.new([@card1, @card2, @card3])
      @player = Player.new('Clarisa', @deck)
    end

    context '#initialize' do
      it 'exists' do
        expect(@player).to be_a(Player)
      end

      it 'sets the player name' do
        expect(@player.name).to eq('Clarisa')
      end

      it 'gives the player a deck of cards' do
        expect(@player.deck).to be_a(Deck)
      end
    end

    context '#has_lost?' do
      it 'evaluates if the player has lost' do
        expect(@player.has_lost?).to be false
      end
      
      it 'is true if a player has no more cards' do
        @player.deck.remove_card
        @player.deck.remove_card
        @player.deck.remove_card
        
        expect(@player.has_lost?).to be true
      end
    end
  end
end
