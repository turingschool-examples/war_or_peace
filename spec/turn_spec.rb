require 'pry'
require './lib/deck'
require './lib/card'
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
    @deck1 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  it 'exists' do
    expect(@turn).to be_a(Turn)
  end

  it 'has players with decks' do
    expect(@turn.player1.name).to eq('Megan')
    expect(@turn.player1.deck).to eq(@deck1)
    expect(@turn.player2.name).to eq('Aurora')
    expect(@turn.player2.deck).to eq(@deck2)
  end

  it 'identifies turn type basic' do
    expect(@turn.type).to eq(:basic)
  end

  it 'identifies turn type war' do
    expect(@turn.type).to eq(:war)
  end

  it 'identifies turn type mutally assured destruction' do
    expect(@turn.type).to eq(:mutually_assured_destruction)
  end

  it 'identifies basic turn winner' do
    expect(@turn.winner).to eq(@player1)
  end

  it 'identifies war turn winner' do
    expect(@turn.winner).to eq(@player2)
  end

  it 'identifies mutally assured destruction turn winner' do
    expect(@turn.winner).to eq("No Winner")
  end

  it 'piles cards and returns spoils_of_war for :basic' do
    expect(@turn.spoils_of_war).to eq([])

    @turn.pile_cards

    expect(@turn.player1.deck.cards).to eq([@card2, @card5, @card8])
    expect(@turn.play2.deck.cards).to eq([@card4, @card6, @card7])
    expect(@turn.spoils_of_war).to eq([@card1, @card3])
  end

  it 'piles cards and returns spoils_of_war for :war' do
    expect(@turn.spoils_of_war).to eq([])

    @turn.pile_cards

    expect(@turn.player1.deck.cards).to eq([@card8])
    expect(@turn.player2.deck.cards).to eq([@card7])
    expect(@turn.spoils_of_war).to eq([@card1, @card4, @card2, @card3, @card5, @card6])
  end

  it 'piles cards and discards for mutually_assured_destruction' do
    expect(@turn.spoils_of_war).to eq([])

    @turn.pile_cards

    expect(@turn.player1.deck.cards).to eq([@card8])
    expect(@turn.player2.deck.cards).to eq([@card7])
    expect(@turn.spoils_of_war).to eq([])
  end

  it 'awards spoils_of_war to the winner for :basic' do
    @turn.pile_cards
    @turn.award_spoils(@winner)

    expect(@winner).to eq(@player1)
    expect(@player1.deck.cards).to eq([@card2, @card5, @card8, @card1, @card3])
    expect(@player2.deck.cards).to eq([@card4, @card6, @card7])
  end

  it 'awards spoils_of_war to the winner for :war' do
    type = @turn.type
    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(@winner)

    expect(@winner).to eq(@player2)
    expect(@player1.deck.cards).to eq([@card8])
    expect(@player2.deck.cards).to eq([@card7, @card1, @card4, @card2, @card3, @card5, @card6])
  end

  it 'disregards spoils_of_war for mutually_assured_destruction' do
    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(@winner)

    expect(@winner).to eq("No Winner")
    expect(@player1.deck.cards).to eq([@card8])
    expect(@player2.deck.cards).to eq([@card7])
  end
end
