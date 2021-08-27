require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  it "exists" do

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)


    expect(player).to be_an_instance_of(Player)
  end

  it 'starts with cards' do

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)


    expect(deck.cards).to eq([card1, card2, card3])

  end

  it 'starts with players' do

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck.cards)

    expect(player.name). to eq('Clarisa')

    expect(player.deck). to eq([card1, card2, card3])

  end


  it 'can say if player lost' do

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)


    expect(player.has_lost?). to eq(false)


    player.deck.remove_card
    expect(player.deck). to eq(card2, card3)


    expect(player.has_lost?). to eq(false)


    player.deck.remove_card
    expect(player.deck). to eq(card3)


    expect(player.has_lost?). to eq(false)


    player.deck.remove_card
    expect(player.deck). to eq()


    expect(player.has_lost?). to eq(true)
    expect(player.deck). to eq()

  end



end
