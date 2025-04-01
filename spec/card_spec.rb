require 'rspec'
require './lib/card'

# double check that you are in your war_or_peace project directory!
# pry(main)> require './lib/card'
#=> true

RSpec.describe Card do
  it "exists" do
    card = Card.new(:diamond, 'Queen', 12)
    # pry(main)> card = Card.new(:diamond, 'Queen', 12)
    # => #<Card:0x00000001005dae48 @rank=12, @suit=:diamond, @value="Queen">
   
    expect(card).to be_an_instance_of(Card)

  end

  it "has readable attributes" do
    card = Card.new(:diamond, 'Queen', 12)
    # pry(main)> card = Card.new(:diamond, 'Queen', 12)
    # => #<Card:0x00000001005dae48 @rank=12, @suit=:diamond, @value="Queen">

    expect(card.suit).to eq(:diamond)
    # pry(main)> card.suit
    # => diamond
    expect(card.value).to eq('Queen')
    # pry(main)> card.value
    # => Queen
    expect(card.rank).to eq(12)
    # pry(main)> card.rank
    # => 12
  end
end
