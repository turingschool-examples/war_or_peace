require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require 'pry'


RSpec.describe Turn do
  it 'exists' do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)
  card_array1 = [card1, card2, card3]
  deck1 = Deck.new(card_array1)
  player1 = Player.new('Clarisa', deck1)

  card4 = Card.new(:club, '5', 5)
  card5 = Card.new(:spade, '10', 10)
  card6 = Card.new(:heart, 'Jack', 11)
  card_array2 = [card4, card5, card6]
  deck2 = Deck.new(card_array2)
  player2 = Player.new('Cory', deck2)

  turn = Turn.new(player1, player2)

  expect(turn).to be_an_instance_of(Turn)
  end

  it "tells the match type of basic" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_array1 = [card1, card2, card3]
    deck1 = Deck.new(card_array1)
    player1 = Player.new('Clarisa', deck1)

    card4 = Card.new(:club, '5', 5)
    card5 = Card.new(:spade, '10', 10)
    card6 = Card.new(:heart, 'Jack', 11)
    card_array2 = [card4, card5, card6]
    deck2 = Deck.new(card_array2)
    player2 = Player.new('Cory', deck2)

    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:basic)
  end


end
