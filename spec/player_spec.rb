require 'rspec'
require '../lib/card'
require '../lib/deck'
require '../lib/player'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Player do 
  it "exists and has a name" do 
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "9", 9)
    card3 = Card.new(:heart, "Ace", 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new("John", deck)

    expect(player).to be_an_instance_of(Player)
    expect(player.name).to eq("John")
  end

  it 'has a deck' do 
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "9", 9)
    card3 = Card.new(:heart, "Ace", 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new("John", deck)

    expect(player.deck).to eq(deck)
  end

  it 'has not lost yet' do 
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "9", 9)
    card3 = Card.new(:heart, "Ace", 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new("John", deck)
    
    expect(player.has_lost?).to be(false)
  end

  it 'can lose' do 
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "9", 9)
    card3 = Card.new(:heart, "Ace", 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new("John", deck)

    expect(player.has_lost?).to be(false)

    player.deck.remove_card

    expect(player.has_lost?).to be(false)

    player.deck.remove_card

    expect(player.has_lost?).to be(false)

    player.deck.remove_card

    expect(player.has_lost?).to be(true)

    expect(player.deck).to eq(deck)
  end
end