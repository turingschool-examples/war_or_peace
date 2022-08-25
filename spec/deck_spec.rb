require 'rspec'
require './lib/card'
require 'pry'

RSpec.describe Deck do
  it 'exists' do
    card = Card.new(:diamond, 'Queen', 12)
  end
end