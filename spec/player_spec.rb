require 'rspec'
require './lib/player'

describe Player do
  describe '#initialize' do
    before(:each) do
      @card1 = Card.new(:diamond, 'Queen', 12)
      @card2 = Card.new(:spade, '3', 3)
      @cards = [@card1, @card2]
      @deck = Deck.new(@cards)
      @player = Player.new('Clarisa', @deck)
    end
    it 'stores name variable correctly' do
      expect(@player.name).to eq('Clarisa')
    end
    it 'stores deck variable as a Deck object' do
      expect(@player.deck).to be_a(Deck)
    end
  end
  describe '#has_lost?' do
    before(:each) do
      @card1 = Card.new(:diamond, 'Queen', 12)
      @card2 = Card.new(:spade, '3', 3)
      @cards = [@card1, @card2]
      @deck = Deck.new(@cards)
      @player = Player.new('Clarisa', @deck)
    end
    it 'does not create false positives on having lost' do
      expect(@player.has_lost?).to eq(false)
    end
    it 'correctly identifies player has lost' do
      @player.deck.remove_card
      @player.deck.remove_card
      expect(@player.has_lost?).to eq(true)
    end
  end



end
