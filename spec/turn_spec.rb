require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require 'pry'

RSpec.describe Card do
  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3) 
    @card3 = Card.new(:heart, 'Ace', 14)  
    @card4 = Card.new(:diamond, 'Jack', 11) 
    @card5 = Card.new(:heart, '8', 8)  
    @card6 = Card.new(:diamond, 'Queen', 12) 
    @card7 = Card.new(:heart, '3', 3) 
    @card8 = Card.new(:diamond, '2', 2)     
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new('V', @deck1)
    @player2 = Player.new('Michelle', @deck2)
    @turn = Turn.new(@player1, @player2) 
  end 

  it "exists" do

    expect(@player1).to be_an_instance_of(Player)
    expect(@player2).to be_an_instance_of(Player)
  end

  it "has readable attributes" do

    expect(@turn.player1.name).to eq('V')
    expect(@turn.player2.name).to eq('Michelle')
    expect(@turn.spoils_of_war).to eq([])
  end

  it "has types" do
    # binding.pry
    expect(@turn.type).to eq(:basic)
    @player2.deck.cards.delete_at(0)
    @player2.deck.cards.delete_at(0)
    expect(@turn.type).to eq(:war)
    @player2.deck.add_card(@card2)
    @player1.deck.cards.delete_at(-1)
    @player1.deck.add_card(@card2)
    @player1.deck.cards.delete_at(-2)
    expect(@turn.type).to eq(:mutually_assured_destruction)
  end
end 