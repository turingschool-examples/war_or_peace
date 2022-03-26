require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

describe Turn do
  it "exists" do
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

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    expect(turn).to be_an_instance_of(Turn)
  end

  it "Can check if turn is basic" do
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

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)


    expect(turn.type).to eq(:basic)

  end

  it "Can check if turn is a war" do
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

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)


    expect(turn.type).to eq(:war)

  end


  it "Can check for mutual destruction" do
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

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:mutually_assured_destruction)
  end


  it "Can determine the winner" do
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

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    expect(turn.winner).to eq(player1)

    # here i decided to run 3 expectations in 1 test
    # redefine variables to test a war scenario
    # deck 2 array changes here
    # separate tests could be added
    # but that would be messy, take longer to type and load when run

    deck2 = Deck.new([card4, card3, card6, card7])
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    expect(turn.winner).to eq(player2)

    # redefine variables to test a mutual_destr scenario
    # card 6 changes here

    card6 = Card.new(:diamond, '8', 8)
    deck2 = Deck.new([card4, card3, card6, card7])
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    expect(turn.winner).to eq('No winner')
  end

  it "Can pile cards" do
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

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)
    expect(turn.pile_cards).to eq([card1, card3])

    #this was done the long way below due to errors

    # deck1 = Deck.new([card1, card2, card5, card8])
    # deck2 = Deck.new([card4, card3, card6, card7])
    # player1 = Player.new("Megan", deck1)
    # player2 = Player.new("Aurora", deck2)
    # turn = Turn.new(player1, player2)
    #
    #
    # expect(turn.pile_cards).to eq([card1, card2, card5, card4, card3, card6])

    # card6 = Card.new(:diamond, '8', 8)
    # deck2 = Deck.new([card4, card3, card6, card7])
    # player2 = Player.new("Aurora", deck2)
    # turn = Turn.new(player1, player2)
    #
    # expect(turn.pile_cards).to eq
  end

  it "can pile cards in a war" do
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

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:war)
    expect(turn.pile_cards).to eq([card1, card2, card5, card4, card3, card6])
  end

  it "can check no piled cards in a mutually assured destruction" do
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

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:mutually_assured_destruction)
    expect(turn.pile_cards).to eq([])
  end

  it "can award spoils in basic" do
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

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)
    winner = turn.winner

    expect(turn.type).to eq(:basic)
    turn.pile_cards
    turn.award_spoils(winner)

    expect(turn.player1.deck.cards).to eq([card2, card5, card8, card1, card3])
    #
    # using this way broke, going back to lengthy version :(
    # leaving for refactor later. brain.function => fried

    # deck1 = Deck.new([card1, card2, card5, card8])
    # deck2 = Deck.new([card4, card3, card6, card7])
    # player1 = Player.new("Megan", deck1)
    # player2 = Player.new("Aurora", deck2)
    # turn = Turn.new(player1, player2)
    # winner = turn.winner
    # expect(turn.type).to eq(:war)
    # turn.award_spoils(winner)

    # this is where it broke. fix after figuring out

    # expect(turn.player1.deck.cards).to eq([])
  end

  it "can award spoils in war" do
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

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)
    winner = turn.winner

    expect(turn.type).to eq(:war)

    turn.pile_cards
    turn.award_spoils(winner)

    expect(turn.player1.deck.cards).to eq([card8])
    expect(turn.player2.deck.cards).to eq([card7, card1, card2, card5, card4, card3, card6])

  end

  it "can check nobody wins cards in mutual destruction" do
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

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)
    winner = turn.winner

    expect(turn.type).to eq(:mutually_assured_destruction)

    turn.pile_cards
    turn.award_spoils(winner)

    expect(turn.player1.deck.cards).to eq([card8])
    expect(turn.player2.deck.cards).to eq([card7])

    #note: at this point it has not yet done a turn (originally index 4, now indx 1)
    # to see who will win the last turn and player2 be awarded card 8

  end
end
