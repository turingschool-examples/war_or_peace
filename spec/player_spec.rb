require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Deck do
it 'initialize' do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)  
  player = Player.new('Clarisa', deck)
  expect(deck.cards).to eq([card1, card2, card3])
  expect(player.name).to eq('Clarisa')

end 

it 'tests player has lost' do 
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)  
  player = Player.new('Clarisa', deck)
  # require 'pry'; binding.pry 
  # expect(player.deck).to eq(cards)
  # require 'pry'; binding.pry 
  expect(deck.cards).to eq([card1, card2, card3])
  expect(player.has_lost?).to eq(false)
  player.deck.remove_card
  expect(deck.cards).to eq([card2, card3])
    #  require 'pry'; binding.pry 
  expect(player.has_lost?).to eq(false)
  player.deck.remove_card
  expect(deck.cards).to eq([card3])

  expect(player.has_lost?).to eq(false)
  player.deck.remove_card
    # require 'pry'; binding.pry 
  expect(player.has_lost?).to eq(true)
    # require 'pry'; binding.pry 
end 




end 