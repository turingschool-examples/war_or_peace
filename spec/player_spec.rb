require 'rspec'
require './lib/player'
require './lib/deck'
require './lib/card'

RSpec.describe Player do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

  it "has instances of Card" do
    expect(card1).to be_an_instance_of(Card)
    expect(card2).to be_an_instance_of(Card)
    expect(card3).to be_an_instance_of(Card)
  end

   it "has an instance of Deck" do
    expect(deck).to be_an_instance_of(Deck)
   end

   it "is an instance of Player" do
    expect(player).to be_an_instance_of(Player)
   end

   it "can call name" do
     expect(player.name).to eq('Clarisa')
   end

   it "can call deck" do
    expect(player.deck).to eq(deck)
   end

   it "can tell if you have lost or not" do
     expect(player.has_lost?).to eq(false)

     player.deck.remove_card

     expect(player.has_lost?).to eq(false)

     player.deck.remove_card

     expect(player.has_lost?).to eq(false)

     player.deck.remove_card

     expect(player.has_lost?).to eq(true)
   end

   it "returns an amptry array for cards in deck" do
     expect(player.deck.cards).to eq([])
   end
end