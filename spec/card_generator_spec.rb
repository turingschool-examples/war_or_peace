require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'
require 'rspec'
require 'pry'

RSpec.describe CardGenerator do

  it 'exists' do
    card_generator = CardGenerator.new('cards.txt')
    expect(card_generator). to be_instance_of(CardGenerator)
  end

  it 'takes a filename as an argument' do
    card_generator = CardGenerator.new('cards.txt')
    expect(card_generator.filename). to eq('cards.txt')
  end

  describe '#cards' do

    xit 'outputs an array of Card objects' do
      card_generator = CardGenerator.new('cards.txt')
      cards = card_generator.cards
      expect(cards[0]).to be_instance_of(Card)
    end

  end

end
