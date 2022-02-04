require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

RSpec.describe Turn do
  it 'exists' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Chris", deck1)
    player2 = Player.new("Sophie", deck2)
    turn = Turn.new(player1, player2)
    expect(turn).to be_an_instance_of(Turn)
  end

  it 'contains at an empty array spoils_of_war' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Chris", deck1)
    player2 = Player.new("Sophie", deck2)
    turn = Turn.new(player1, player2)
    expect(turn.spoils_of_war).to eq([])
  end

  it 'can deteremine a :basic turn, first card ranks do not match' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Ace', 14)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Chris", deck1)
    player2 = Player.new("Sophie", deck2)
    turn = Turn.new(player1, player2)
    expect(turn.type).to eq(:basic)
  end

  it 'can deteremine a :war turn, first card ranks match' do
    card1 = Card.new(:heart, 'Ace', 14)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Ace', 14)
    card5 = Card.new(:heart, '7', 7)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Chris", deck1)
    player2 = Player.new("Sophie", deck2)
    turn = Turn.new(player1, player2)
    expect(turn.type).to eq(:war)
  end

  it 'can deteremine a :mutually_assured_destruction turn, first and third cards ranks match' do
    card1 = Card.new(:heart, 'Ace', 14)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Ace', 14)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Chris", deck1)
    player2 = Player.new("Sophie", deck2)
    turn = Turn.new(player1, player2)
    expect(turn.type).to eq(:mutually_assured_destruction)
  end

  it 'can deteremine the winner of a :basic turn' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Ace', 14)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Chris", deck1)
    player2 = Player.new("Sophie", deck2)
    turn = Turn.new(player1, player2)
    expect(turn.winner).to eq(player2)
  end
  it 'can deteremine the winner of a :war turn' do
    card1 = Card.new(:heart, 'Ace', 14)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Ace', 14)
    card5 = Card.new(:heart, '7', 7)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Chris", deck1)
    player2 = Player.new("Sophie", deck2)
    turn = Turn.new(player1, player2)
    expect(turn.winner).to eq(player2)
  end

  it 'can deteremine the winner of a :mutually_assured_destruction turn' do
    card1 = Card.new(:heart, 'Ace', 14)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Ace', 14)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Chris", deck1)
    player2 = Player.new("Sophie", deck2)
    turn = Turn.new(player1, player2)
    expect(turn.winner).to eq("No Winner")
  end


end
