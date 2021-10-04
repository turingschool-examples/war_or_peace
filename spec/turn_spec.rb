require 'rspec'
require 'pry'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

RSpec.describe Player do
  before :each do
    deck1 = Deck.new
    deck2 = Deck.new
    @player1 = Player.new('Sally', deck1)
    @player2 = Player.new('James', deck2)
  end

  it 'exists' do
    turn = Turn.new(@player1, @player2)
    expect(turn).to be_a Turn
  end

  it 'has attributes' do
    turn = Turn.new(@player1, @player2)
    expect(turn.player1).to be_a Player
    expect(turn.player2).to be_a Player
    expect(turn.spoils_of_war).to be_a Array
  end

  it 'has a type' do
    # mutually assured destruction
    turn = Turn.new(@player1, @player2)
    expect(turn.type).to eq(:mutually_assured_destruction)

    # basic turn
    turn.player1.deck.remove_card
    expect(turn.type).to eq(:basic)

    # war turn, where one deck only has one card left
    50.times { |_i| turn.player1.deck.remove_card }
    last_card = turn.player2.deck.cards.pop
    turn.player2.deck.cards.unshift(last_card)
    expect(turn.type).to eq(:war)
  end

  it 'can determine a winner' do
    # mutually assured destruction
    turn = Turn.new(@player1, @player2)
    expect(turn.winner).to eq('No Winner')

    # basic turn
    turn.player1.deck.remove_card
    expect(turn.winner).to eq(@player1)

    # basic turn, where one deck only has two cards left
    49.times { turn.player1.deck.remove_card }
    last_card = turn.player2.deck.cards.pop
    turn.player2.deck.cards.unshift(last_card)
    expect(turn.winner).to eq(@player2)
  end

  it 'can pile cards' do
    # mutually assured destruction
    turn = Turn.new(@player1, @player2)
    expect(turn.winner).to eq('No Winner')
    turn.pile_cards
    expect(@player1.deck.cards.size).to eq(49)
    expect(@player2.deck.cards.size).to eq(49)

    turn = Turn.new(@player1, @player2)
    @player1.deck.remove_card
    turn.pile_cards
    expect(turn.spoils_of_war.size).to eq(2)

    turn = Turn.new(@player1, @player2)
    46.times { @player1.deck.remove_card }
    last_card = turn.player2.deck.cards.pop
    turn.player2.deck.cards.unshift(last_card)
    turn.pile_cards
    expect(turn.spoils_of_war.size).to eq(4)
  end
end
