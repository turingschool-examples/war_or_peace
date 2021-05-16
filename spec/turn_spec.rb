require 'rspec'
require './lib/turn'

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
    expect(@turn.type).to eq(:basic)
  end

  it 'Should be War turn' do
    @player2.deck.remove_card
    expect(@turn.type).to eq(:war)
  end

  it 'Should have player 1 win' do
    expect(@turn.winner).to eq(@player1)
  end

  it 'Pile cards?' do
    @turn.winner
    expect(@player1.deck).to eq(@deck1)
    expect(@player2.deck).to eq(@deck2)
    @turn.pile_cards
    expect(@turn.spoils_of_war).to eq([@card1, @card3])
  end

  it 'Sends won cards to winning player' do
    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(winner)
    expect(@player1.deck.cards).to eq([@card2, @card5, @card8, @card1, @card3])
  end
end
describe 'Turn type war' do
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
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Meegan", @deck1)
    @player2 = Player.new("André", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  it 'Should be War turn' do
    expect(@turn.type).to eq(:war)
  end

  it 'Give cards to winner :War' do
    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(winner)
    expect(@player2.deck.cards).to eq([@card7, @card1, @card4, @card2, @card3, @card5, @card6])
  end
end
describe 'Turn type mutually_assured_destruction' do
  before(:each) do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, 'Ten', 10)
    @card3 = Card.new(:heart, 'Nine', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, 'Eight', 8)
    @card6 = Card.new(:diamond, 'Eight', 8)
    @card7 = Card.new(:heart, 'Three', 3)
    @card8 = Card.new(:diamond, 'Two', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Meegan", @deck1)
    @player2 = Player.new("André", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  it 'Should be War turn' do
    expect(@turn.type).to eq(:mutually_assured_destruction)
  end

  it 'Players left with just one card' do
    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(winner)
    expect(@player1.deck.cards).to eq([@card8])
    expect(@player2.deck.cards).to eq([@card7])
  end
end
