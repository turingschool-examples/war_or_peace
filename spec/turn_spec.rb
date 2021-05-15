require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    cards = [card1, card2, card3, card4, card5, card6, card7, card8]

    deck1 = Deck.new([card1,card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)


    turn = Turn.new(player1, player2)


    expect(turn).to be_an_instance_of(Turn)
  end

  it "has a type" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    cards = [card1, card2, card3, card4, card5, card6, card7, card8]

    deck1 = Deck.new([card1,card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)


    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:basic)
  end

  it "declares a winner" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    cards = [card1, card2, card3, card4, card5, card6, card7, card8]

    deck1 = Deck.new([card1,card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)


    turn = Turn.new(player1, player2)
    winner = turn.winner

    expect(turn.winner).to eq(player1)
  end

  it "piles the cards" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    cards = [card1, card2, card3, card4, card5, card6, card7, card8]

    deck1 = Deck.new([card1,card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)


    turn = Turn.new(player1, player2)
    winner = turn.winner

    turn.pile_cards

    expect(turn.spoils_of_war).to eq([card1, card3])
  end

  it "award the cards" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    cards = [card1, card2, card3, card4, card5, card6, card7, card8]

    deck1 = Deck.new([card1,card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)


    turn = Turn.new(player1, player2)
    winner = turn.winner

    turn.pile_cards
    turn.award_spoils(winner)

    # require 'pry'; binding.pry

    expect(player1.deck.cards).to eq([card2, card5, card8, card1, card3])
  end

  it 'passes the :war type test' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    turn = Turn.new(player1, player2)

    winner = turn.winner

    expect(turn.type).to eq(:war)

    turn.pile_cards
    turn.award_spoils(winner)
    # require 'pry'; binding.pry

    # expect(turn.type).to eq(:war)
    expect(player2.deck.cards).to eq([card7, card1, card2, card5, card4, card3, card6])
  end

  it 'passes the :mutually_assured_destruction type test' do
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

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    turn = Turn.new(player1, player2)

    winner = turn.winner

    expect(turn.type).to eq(:mutually_assured_destruction)



    turn.pile_cards
    turn.spoils_of_war
    # require 'pry'; binding.pry

    # expect(turn.type).to eq(:war)
    expect(player1.deck.cards).to eq([card8])

    expect(player2.deck.cards).to eq([card7])
  end

end
