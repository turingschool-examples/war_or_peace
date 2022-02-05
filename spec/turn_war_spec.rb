require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

card1 = Card.new(:heart, 'Jack', 11)
card2 = Card.new(:heart, '10', 10)
card3 = Card.new(:heart, '9', 9)
card4 = Card.new(:diamond, 'Jack', 11)
card5 = Card.new(:heart, '8', 8)
card6 = Card.new(:diamond, 'Queen', 12)
card7 = Card.new(:heart, '3', 3)
card8 = Card.new(:diamond, '2', 2)

cards1 = [card1, card2, card5, card8]
cards2 = [card4, card3, card6, card7]

deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)

player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

turn = Turn.new(player1, player2)

winner = turn.winner

RSpec.describe Turn do

  it 'creates new turn' do
    expect(turn).to be_an_instance_of(Turn)
  end

  it 'can read player1' do
    expect(turn.player1).to eq(player1)
  end

  it 'can read player2' do
    expect(turn.player2).to eq(player2)
  end

  it 'can read deck1' do
    expect(deck1.cards).to eq(cards1)
  end

  it 'can read deck2' do
    expect(deck2.cards).to eq(cards2)
  end

  it 'has spoils of war method' do
    expect(turn.spoils_of_war).to eq([])
  end

  it 'confirms war turn type functionality' do
    expect(turn.type).to eq(:war)
  end

  it 'confirms winner method functionality' do
    expect(turn.winner).to eq(player2)
  end

  it 'confirms pile cards method functionality' do
    turn.type
    turn.pile_cards
    expect(turn.spoils_of_war.count).to eq(6)
  end

  it 'awards spoils to winner' do
    turn.award_spoils(player2)
    expect(winner.deck.cards.count).to eq(7)
  end

  it 'confirms player decks after awarding spoils' do
    turn.award_spoils(player1)
    expect(player1.deck.cards.count).to eq(5)
    expect(player2.deck.cards.count).to eq(3)
  end
end
