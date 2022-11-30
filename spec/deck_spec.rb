require 'rspec'
require 'pry'; binding.pry
require './lib/card'
require './lib/deck'





RSpec.describe Card do
    it "adds one card" do
    card1 = Card.new(:diamond, 'Queen', 12)
    require 'pry'; binding.pry
    end
end