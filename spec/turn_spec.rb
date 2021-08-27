require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'rspec'
require 'pry'

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
     player1 = Player.new("Megan", deck1)
     player2 = Player.new("Aurora", deck2)

     turn = Turn.new(player1, player2)
     expect(turn).to be_instance_of(Turn)


  end

  it 'executes a basic turn' do
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
    expect(turn.winner).to eq(player1)
    winner = turn.winner #id winner
    turn.pile_cards      # remove cards from players

    expect(turn.spoils_of_war).to eq([card1, card3])
    turn.award_spoils(winner) #award spoils if applicable
    #binding.pry
    expect(player1.deck.cards).to include(card2, card5, card8, card1, card3)
    expect(player2.deck.cards).to include(card4, card6, card7) #no []
  end

  it 'executes a war turn' do
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
    expect(turn.winner).to eq(player2)
    winner = turn.winner #id winner
    turn.pile_cards      # remove cards from players

    expect(turn.spoils_of_war).to include(card1, card2, card5, card4, card3, card6)
    turn.award_spoils(winner) #award spoils (if applicable)

    expect(player1.deck.cards).to eq([card8])
    expect(player2.deck.cards).to include(card1, card4, card5, card2, card3, card6, card7)
  end

  it 'excutes a mutually assured destruction turn' do

    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:mutually_assured_destruction)
    expect(turn.winner).to eq("No Winner")
    winner = turn.winner #id winner
    turn.pile_cards      # remove cards from players

    expect(turn.spoils_of_war).to eq([])


    expect(player1.deck.cards).to eq([card8])
    expect(player2.deck.cards).to eq([card7])
  end

end
