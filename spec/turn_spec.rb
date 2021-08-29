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
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    expect(turn).to be_an_instance_of(Turn)
  end

  it 'returns player information' do
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
    expect(turn.player1).to eq player1
    expect(turn.player2).to eq player2
  end

  it 'returns the spoils of war' do
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
    expect(turn.spoils_of_war).to eq []
  end

  it 'returns the type of turn' do
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
    turn1 = Turn.new(player1, player2)
    expect(turn1.type).to eq :basic
    deck3 = Deck.new([card8, card2, card5, card1])
    deck4 = Deck.new([card8, card3, card4, card6])
    player1 = Player.new("Alejandro", deck3)
    player2 = Player.new("Bob", deck4)
    turn2 = Turn.new(player1, player2)
    expect(turn2.type).to eq :war
    deck5 = Deck.new([card8, card2, card1, card1])
    deck6 = Deck.new([card8, card3, card4, card6])
    player1 = Player.new("Alejandro", deck5)
    player2 = Player.new("Bob", deck6)
    turn3 = Turn.new(player1, player2)
    expect(turn3.type).to eq :mutually_assured_destruction
  end

  it 'returns the winner' do
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
    turn1 = Turn.new(player1, player2)
    expect(turn1.winner).to eq player1
    deck3 = Deck.new([card8, card2, card5, card1])
    deck4 = Deck.new([card8, card3, card4, card6])
    player1 = Player.new("Alejandro", deck3)
    player2 = Player.new("Bob", deck4)
    turn2 = Turn.new(player1, player2)
    expect(turn2.winner).to eq player2
    deck5 = Deck.new([card8, card2, card1, card1])
    deck6 = Deck.new([card8, card3, card4, card6])
    player1 = Player.new("Alejandro", deck5)
    player2 = Player.new("Bob", deck6)
    turn3 = Turn.new(player1, player2)
    expect(turn3.winner).to eq "No Winner"
  end

  it 'piles the cards as specified in the prompt' do
    #basic
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
    turn.pile_cards
    expect(deck1.cards.first).to eq(card2)
    expect(deck2.cards.first).to eq(card4)
    expect(deck1.cards.count).to eq 3
    expect(deck2.cards.count).to eq 3
    expect(turn.spoils_of_war.count).to eq 2
    #war
    deck1 = Deck.new([card8, card2, card5, card1])
    deck2 = Deck.new([card8, card3, card4, card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards
    expect(deck1.cards.first).to eq(card1)
    expect(deck2.cards.first).to eq(card6)
    expect(deck1.cards.count).to eq 1
    expect(deck2.cards.count).to eq 1
    expect(turn.spoils_of_war.count).to eq 6
    #mutually_assured_destruction
    deck1 = Deck.new([card8, card2, card1, card1])
    deck2 = Deck.new([card8, card3, card4, card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards
    expect(deck1.cards.first).to eq(card1)
    expect(deck2.cards.first).to eq(card6)
    expect(deck1.cards.count).to eq 1
    expect(deck2.cards.count).to eq 1
    expect(turn.spoils_of_war.count).to eq 0
  end

  it 'awards spoils to the winner' do
    #basic
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
    expect(turn.spoils_of_war.count).to eq 0
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
    expect(player1.deck.cards.count).to eq 5
    expect(player2.deck.cards.count).to eq 3
    #war
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
    expect(player1.deck.cards.count).to eq 1
    expect(player2.deck.cards.count).to eq 7
    #mutually_assured_destruction
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
    expect(winner).to eq "No Winner"
  end
end





























#
