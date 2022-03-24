require 'rspec'
require './lib/card_generator'
require './lib/card'

describe 'CardGenerator' do
  it 'exists' do
    cards = CardGenerator.new('test')
    expect(cards).to be_a CardGenerator
  end
end
