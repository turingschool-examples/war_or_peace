require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    deck1 = Deck.new([card1, card2, card3, card4])
    player1 = Player.new('Megan', deck1)
    card5 = Card.new(:spade, '6', 6)
    card6 = Card.new(:club, 'Jack', 11)
    card7 = Card.new(:diamond, '10', 10)
    card8 = Card.new(:heart, '8', 8)
    deck2 = Deck.new([card5, card6, card7, card8])
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    expect(turn).to be_an_instance_of(Turn)
  end

  it 'has attributes' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    deck1 = Deck.new([card1, card2, card3, card4])
    player1 = Player.new('Megan', deck1)
    card5 = Card.new(:spade, '6', 6)
    card6 = Card.new(:club, 'Jack', 11)
    card7 = Card.new(:diamond, '10', 10)
    card8 = Card.new(:heart, '8', 8)
    deck2 = Deck.new([card5, card6, card7, card8])
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    expect(turn.player1).to eq(player1)
    expect(turn.player2).to eq(player2)
    expect(turn.spoils_of_war).to eq([])
  end

  it 'type of turn :basic' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Ace', 14)
    cards = [card1, card2, card3]
    deck1 = Deck.new([card1, card2, card3])
    player1 = Player.new('Megan', deck1)

    card4 = Card.new(:spade, '6', 6)
    card5 = Card.new(:club, 'Jack', 11)
    card6 = Card.new(:diamond, '10', 10)
    cards = [card4, card5, card6]
    deck2 = Deck.new([card4, card5, card6])
    player2 = Player.new('Aurora', deck2)

    turn1 = Turn.new(player1, player2)
    expect(turn1.type).to eq(:basic)
  end

  it 'type of turn :war' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Ace', 14)
    cards = [card1, card2, card3]
    deck1 = Deck.new([card1, card2, card3])
    player1 = Player.new('Megan', deck1)

    card4 = Card.new(:spade, 'Queen', 12)
    card5 = Card.new(:club, 'Jack', 11)
    card6 = Card.new(:diamond, '10', 10)
    cards = [card4, card5, card6]
    deck2 = Deck.new([card4, card5, card6])
    player2 = Player.new('Aurora', deck2)

    turn2 = Turn.new(player1, player2)
    expect(turn2.type).to eq(:war)
  end

  it 'type of turn :mutually assured destruction' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, '10', 10)
    cards = [card1, card2, card3]
    deck1 = Deck.new([card1, card2, card3])
    player1 = Player.new('Megan', deck1)

    card4 = Card.new(:spade, 'Queen', 12)
    card5 = Card.new(:club, 'Jack', 11)
    card6 = Card.new(:diamond, '10', 10)
    cards = [card4, card5, card6]
    deck2 = Deck.new([card4, card5, card6])
    player2 = Player.new('Aurora', deck2)

    turn3 = Turn.new(player1, player2)
    expect(turn3.type).to eq(:mutually_assured_destruction)
  end

  it 'winner :basic' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Ace', 14)
    cards = [card1, card2, card3]
    deck1 = Deck.new([card1, card2, card3])
    player1 = Player.new('Megan', deck1)

    card4 = Card.new(:spade, '6', 6)
    card5 = Card.new(:club, 'Jack', 11)
    card6 = Card.new(:diamond, '10', 10)
    cards = [card4, card5, card6]
    deck2 = Deck.new([card4, card5, card6])
    player2 = Player.new('Aurora', deck2)

    turn1 = Turn.new(player1, player2)
    expect(turn1.type).to eq(:basic)
    expect(turn1.winner).to eq(player1)
  end

  it 'winner :war' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Ace', 14)
    cards = [card1, card2, card3]
    deck1 = Deck.new([card1, card2, card3])
    player1 = Player.new('Megan', deck1)

    card4 = Card.new(:spade, 'Queen', 12)
    card5 = Card.new(:club, 'Jack', 11)
    card6 = Card.new(:diamond, '10', 10)
    cards = [card4, card5, card6]
    deck2 = Deck.new([card4, card5, card6])
    player2 = Player.new('Aurora', deck2)

    turn2 = Turn.new(player1, player2)
    expect(turn2.type).to eq(:war)
    expect(turn2.winner).to eq(player1)
  end

  it 'winner :mutually assured destruction' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, '10', 10)
    cards = [card1, card2, card3]
    deck1 = Deck.new([card1, card2, card3])
    player1 = Player.new('Megan', deck1)

    card4 = Card.new(:spade, 'Queen', 12)
    card5 = Card.new(:club, 'Jack', 11)
    card6 = Card.new(:diamond, '10', 10)
    cards = [card4, card5, card6]
    deck2 = Deck.new([card4, card5, card6])
    player2 = Player.new('Aurora', deck2)

    turn3 = Turn.new(player1, player2)
    expect(turn3.type).to eq(:mutually_assured_destruction)
    expect(turn3.winner).to eq("No winner")
  end

  it 'pile cards :basic' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Ace', 14)
    cards = [card1, card2, card3]
    deck1 = Deck.new([card1, card2, card3])
    player1 = Player.new('Megan', deck1)

    card4 = Card.new(:spade, '6', 6)
    card5 = Card.new(:club, 'Jack', 11)
    card6 = Card.new(:diamond, '10', 10)
    cards = [card4, card5, card6]
    deck2 = Deck.new([card4, card5, card6])
    player2 = Player.new('Aurora', deck2)
    turn1 = Turn.new(player1, player2)
    expect(turn1.type).to eq(:basic)
    winner = turn1.winner
    turn1.pile_cards
    expect(turn1.spoils_of_war).to eq([card1, card4])
  end

  it 'pile cards :war' do
    card1 = Card.new(:diamond, '7', 7)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Queen', 12)
    cards = [card1, card2, card3]
    deck1 = Deck.new([card1, card2, card3])
    player1 = Player.new('Megan', deck1)

    card4 = Card.new(:spade, '7', 7)
    card5 = Card.new(:club, 'Jack', 11)
    card6 = Card.new(:diamond, 'Ace', 14)
    cards = [card4, card5, card6]
    deck2 = Deck.new([card4, card5, card6])
    player2 = Player.new('Aurora', deck2)

    turn1 = Turn.new(player1, player2)
    expect(turn1.type).to eq(:war)
    #winner = turn1.winner
    turn1.pile_cards
    expect(turn1.spoils_of_war).to eq([card1, card2, card3, card4, card5, card6])
  end

  it 'pile cards :mutually assured destruction' do
    card1 = Card.new(:diamond, '6', 6)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Queen', 12)
    cards = [card1, card2, card3]
    deck1 = Deck.new([card1, card2, card3])
    player1 = Player.new('Megan', deck1)

    card4 = Card.new(:spade, '6', 6)
    card5 = Card.new(:club, 'Jack', 11)
    card6 = Card.new(:diamond, 'Queen', 12)
    cards = [card4, card5, card6]
    deck2 = Deck.new([card4, card5, card6])
    player2 = Player.new('Aurora', deck2)
    turn1 = Turn.new(player1, player2)
    expect(turn1.type).to eq(:mutually_assured_destruction)
    winner = turn1.winner
    turn1.pile_cards
    expect(player1.deck.cards).to eq([])
    expect(turn1.spoils_of_war).to eq([])
  end

  it 'award spoils :war' do
    card1 = Card.new(:diamond, '7', 7)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Queen', 12)
    cards = [card1, card2, card3]
    deck1 = Deck.new([card1, card2, card3])
    player1 = Player.new('Megan', deck1)

    card4 = Card.new(:spade, '7', 7)
    card5 = Card.new(:club, 'Jack', 11)
    card6 = Card.new(:diamond, 'Ace', 14)
    cards = [card4, card5, card6]
    deck2 = Deck.new([card4, card5, card6])
    player2 = Player.new('Aurora', deck2)

    turn1 = Turn.new(player1, player2)
    expect(turn1.type).to eq(:war)
    winner = turn1.winner
    turn1.pile_cards
    expect(turn1.spoils_of_war).to eq([card1, card2, card3, card4, card5, card6])
  end

  it 'award spoils :mutually assured destruction' do
    card1 = Card.new(:diamond, '6', 6)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Queen', 12)
    cards = [card1, card2, card3]
    deck1 = Deck.new([card1, card2, card3])
    player1 = Player.new('Megan', deck1)

    card4 = Card.new(:spade, '6', 6)
    card5 = Card.new(:club, 'Jack', 11)
    card6 = Card.new(:diamond, 'Queen', 12)
    cards = [card4, card5, card6]
    deck2 = Deck.new([card4, card5, card6])
    player2 = Player.new('Aurora', deck2)
    turn1 = Turn.new(player1, player2)
    expect(turn1.type).to eq(:mutually_assured_destruction)
    winner = turn1.winner
    turn1.pile_cards
    expect(turn1.spoils_of_war).to eq([])
  end
end
