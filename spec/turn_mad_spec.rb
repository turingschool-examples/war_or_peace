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
card6 = Card.new(:diamond, '8', 8)
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

  it 'confirms m.a.d turn type functionality' do
    expect(turn.type).to eq(:mutually_assured_destruction)
  end

  it 'confirms winner method functionality' do
    expect(turn.winner).to output('No winner')
  end

  it 'confirms pile cards method functionality' do
    turn.type
    turn.pile_cards
    expect(turn.spoils_of_war.count).to eq(2)
  end

  xit 'confirms pile cards method functionality for m.a.d scenario' do
    expect(cards1.count).to eq(1)
    expect(cards2.count).to eq(1)
  end

  it 'confirms correct spoils' do
    expect(turn.spoils_of_war).to include(card1)
    expect(turn.spoils_of_war).to include(card3)
  end

  it 'awards spoils to winner' do
    turn.award_spoils(player1)
    expect(winner.deck.cards.count).to eq(5)
  end

  it 'confirms player decks after awarding spoils' do
    turn.award_spoils(player1)
    expect(player1.deck.cards.count).to eq(5)
    expect(player2.deck.cards.count).to eq(3)
  end
end
