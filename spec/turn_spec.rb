require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    turn = Turn.new(player1, player2)

    expect(turn.player1.name).to eq('Megan')
    expect(turn.player2.name).to eq('Aurora')
    expect(turn).to be_an_instance_of(Turn)
  end

  it 'will return a turn type' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    turn = Turn.new(player1, player2)

    turn.player1.name
    turn.player2.name

    expect(turn.type).to eq(:basic)
  end

  it 'returns a winner with spoils_of_war' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    turn = Turn.new(player1, player2)

    turn.player1.name
    turn.player2.name

    expect(turn.pile_cards).to eq([card1, card3])
    expect(turn.spoils_of_war(winner)).to eq(player1)

    expect(player1.deck).to eq([card2, card5, card8])
    expect(player2.deck).to eq([card4, card6, card7])
  end

  xit 'returns spoils_of_war' do
    expect(turn.award_spoils).to eq()
  end
end
