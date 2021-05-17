require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do

  before :each do
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
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  it "is playable" do
    expect(@turn).to be_an_instance_of(Turn)
  end

  it "has both players and spoils_of_war" do
    expect(@player1.name).to eq("Megan")
    expect(@player2.name).to eq("Aurora")
    expect(@turn.spoils_of_war).to eq([])
  end
end

describe 'basic turn type' do

  before :each do
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
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  it 'is basic turn type' do
    expect(@turn.type).to eq(:basic)
  end

  it 'winner of basic turn type' do
    expect(@turn.winner).to eq(@player1)
  end

  it 'pile_cards for basic type' do
    @turn.pile_cards
    expect(@turn.spoils_of_war).to eq([@card1, @card3])
  end

  it 'award winner with spoils_of_war' do
    @turn.pile_cards
    @turn.award_spoils
    expect(@player1.deck.cards).to eq([@card2, @card5, @card8, @card1, @card3])
    expect(@player2.deck.cards).to eq([@card4, @card6, @card7])
  end

end

describe 'War turn type' do

  before :each do
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
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  it 'turn type' do
    expect(@turn.type).to eq(:war)
  end

  it 'winner' do
    expect(@turn.winner).to eq(@player2)
  end

  it 'pile_cards for war type' do
    @turn.pile_cards
    #error in test here
    expect(@turn.spoils_of_war).to eq([@card1, @card2, @card5, @card4, @card3, @card6])
    expect(@player1.deck).to eq(@card8)
    expect(@player2.deck).to eq(@card7)
  end

  it 'award winner with spoils_of_war' do
    @turn.pile_cards
    @turn.award_spoils
    expect(@player1.deck.cards).to eq([@card8])
    #error in test here
    expect(@player2.deck.cards).to eq([@card7, @card1, @card2, @card5, @card4, @card3, @card6])
  end

end

describe 'mutually_assured_destruction type' do

  before :each do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, '8', 8)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  it 'is mutually_assured_destruction type' do
    expect(@turn.type).to eq(:mutually_assured_destruction)
  end

  it 'has mutually_assured_destruction winner' do
    expect(@turn.winner).to eq("No Winner")
  end

  it 'pile_cards for mutually_assured_destruction' do
    @turn.pile_cards
    expect(@turn.spoils_of_war).to eq([])
    expect(@player1.deck.cards).to eq([@card8])
    expect(@player2.deck.cards).to eq([@card7])
  end

  it 'awards spoils_of_war for mutually_assured_destruction type' do
    @turn.pile_cards
    @turn.award_spoils
    expect(@player1.deck.cards).to eq([@card8])
    expect(@player2.deck.cards).to eq([@card7])
  end

end
