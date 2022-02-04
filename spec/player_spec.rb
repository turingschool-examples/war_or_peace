require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

RSpec.describe Player do

  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, 'King', 13)
    @card3 = Card.new(:heart, '3', 3)

    @cards = [@card1,@card2,@card3]

    @deck = Deck.new @cards

    @player = Player.new('Clarisa', @deck)
  end

  it "exists" do
    expect(@player).to be_an_instance_of(Player)
  end

  context 'instance methods' do

    it "player name" do

      expect(@player.player_name).to eq("Clarisa")

    end

    it "player deck" do

      expect(@player.deck).to eq(@deck)

    end

    it "has_lost?" do

      expect(@player.has_lost?).to eq(false)
      expect(@player.deck.remove_card).to eq(@card1)
      expect(@player.has_lost?).to eq(false)
      expect(@player.deck.remove_card).to eq(@card2)
      expect(@player.has_lost?).to eq(false)
      expect(@player.deck.remove_card).to eq(@card3)
      expect(@player.has_lost?).to eq(true)
      expect(@player.deck.cards).to eq(@cards)

    end


  end



end
