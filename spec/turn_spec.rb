require 'rspec'
require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'

RSpec.describe Turn do
  before(:each) do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, 'Ten', 10)
    @card3 = Card.new(:heart, 'Nine', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, 'Eight', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, 'Three', 3)
    @card8 = Card.new(:diamond, 'Two', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Meegan", @deck1)
    @player2 = Player.new("André", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  it 'Should have player One and Two' do
    expect(@player1).to be_an_instance_of(Player)
    expect(@player2).to be_an_instance_of(Player)
    expect(@player1.name).to eq("Meegan")
    expect(@player2.name).to eq("André")
    expect(@player1.deck).to eq(@deck1)
    expect(@player2.deck).to eq(@deck2)
  end

  it 'new Turn is initialized' do
    expect(@turn).to be_an_instance_of(Turn)
  end

  it 'Should be Basic turn' do
    expect(@turn.type).to eq(@basic)
  end

end
