require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

describe '#initialize' do
  it 'is an instance of turn' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond,'2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn= Turn.new(player1, player2)
    expect(turn). to be_a Turn
  end
end

describe '#type of turn :basic and winnings' do
  it 'is basic' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond,'2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn= Turn.new(player1, player2)
    expect(turn.type).to eq(:basic)
    expect(turn.winner).to eq(player1)
    turn.pile_cards
    turn.award_spoils(player1)
    expect(turn.spoils_of_war).to eq([card1, card3])
  end
end

describe '#type of turn :war and winnings' do
  it 'is war' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1,card2,card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn= Turn.new(player1, player2)
    expect(turn.type).to eq :war
    expect(turn.winner).to eq(player2)
    turn.pile_cards
    turn.award_spoils(player2)
    expect(turn.spoils_of_war).to eq([card1, card4, card2, card3, card5,card6])
  end
end

describe '#type of turn :mutually_assured_destruction and winnings' do
  it 'is :mutually_assured_destruction' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1,card2,card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn= Turn.new(player1, player2)
    expect(turn.type).to eq :mutually_assured_destruction
    expect(turn.winner).to eq("no winner")
    turn.pile_cards
    turn.award_spoils("no winner")
    expect(turn.spoils_of_war).to eq([])
  end
end
