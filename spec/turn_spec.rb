require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require 'pry'


RSpec.describe Turn do
  it 'exists' do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)
  card_array1 = [card1, card2, card3]
  deck1 = Deck.new(card_array1)
  player1 = Player.new('Clarisa', deck1)

  card4 = Card.new(:club, '5', 5)
  card5 = Card.new(:spade, '10', 10)
  card6 = Card.new(:heart, 'Jack', 11)
  card_array2 = [card4, card5, card6]
  deck2 = Deck.new(card_array2)
  player2 = Player.new('Cory', deck2)

  turn = Turn.new(player1, player2)

  expect(turn).to be_an_instance_of(Turn)
  end

  it "tells the match type of basic" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_array1 = [card1, card2, card3]
    deck1 = Deck.new(card_array1)
    player1 = Player.new('Clarisa', deck1)

    card4 = Card.new(:club, '5', 5)
    card5 = Card.new(:spade, '10', 10)
    card6 = Card.new(:heart, 'Jack', 11)
    card_array2 = [card4, card5, card6]
    deck2 = Deck.new(card_array2)
    player2 = Player.new('Cory', deck2)

    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:basic)
  end

  it "tells the match type of war" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_array1 = [card1, card2, card3]
    deck1 = Deck.new(card_array1)
    player1 = Player.new('Clarisa', deck1)

    card4 = Card.new(:club, '5', 12)
    card5 = Card.new(:spade, '10', 10)
    card6 = Card.new(:heart, 'Jack', 11)
    card_array2 = [card4, card5, card6]
    deck2 = Deck.new(card_array2)
    player2 = Player.new('Cory', deck2)

    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:war)
  end

  it "tells the match type of mutually_assured_destruction" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_array1 = [card1, card2, card3]
    deck1 = Deck.new(card_array1)
    player1 = Player.new('Clarisa', deck1)

    card4 = Card.new(:club, '5', 12)
    card5 = Card.new(:spade, '10', 10)
    card6 = Card.new(:heart, 'Jack', 14)
    card_array2 = [card4, card5, card6]
    deck2 = Deck.new(card_array2)
    player2 = Player.new('Cory', deck2)

    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:mutually_assured_destruction)
  end

  it 'determines the :basic winner' do
    card1 = Card.new(:diamond, 'Queen', 1)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_array1 = [card1, card2, card3]
    deck1 = Deck.new(card_array1)
    player1 = Player.new('Clarisa', deck1)

    card4 = Card.new(:club, '5', 5)
    card5 = Card.new(:spade, '10', 10)
    card6 = Card.new(:heart, 'Jack', 11)
    card_array2 = [card4, card5, card6]
    deck2 = Deck.new(card_array2)
    player2 = Player.new('Cory', deck2)

    turn = Turn.new(player1, player2)

    expect(turn.winner).to eq(turn.player2)

  end

  it 'shows no one has won' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_array1 = [card1, card2, card3]
    deck1 = Deck.new(card_array1)
    player1 = Player.new('Clarisa', deck1)

    card4 = Card.new(:club, '5', 12)
    card5 = Card.new(:spade, '10', 10)
    card6 = Card.new(:heart, 'Jack', 14)
    card_array2 = [card4, card5, card6]
    deck2 = Deck.new(card_array2)
    player2 = Player.new('Cory', deck2)

    turn = Turn.new(player1, player2)

    expect(turn.winner).to eq('No Winner')
  end

  it 'shows the :war winner' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 1)
    card_array1 = [card1, card2, card3]
    deck1 = Deck.new(card_array1)
    player1 = Player.new('Clarisa', deck1)

    card4 = Card.new(:club, '5', 12)
    card5 = Card.new(:spade, '10', 10)
    card6 = Card.new(:heart, 'Jack', 11)
    card_array2 = [card4, card5, card6]
    deck2 = Deck.new(card_array2)
    player2 = Player.new('Cory', deck2)

    turn = Turn.new(player1, player2)

    expect(turn.winner).to eq(turn.player2)
  end

  it 'removes cards based on turn type :basic' do #pile_cards
    card1 = Card.new(:diamond, 'Queen', 12)       #test check for spoils?
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_array1 = [card1, card2, card3]
    deck1 = Deck.new(card_array1)
    player1 = Player.new('Clarisa', deck1)

    card4 = Card.new(:club, '5', 5)
    card5 = Card.new(:spade, '10', 10)
    card6 = Card.new(:heart, 'Jack', 11)
    card_array2 = [card4, card5, card6]
    deck2 = Deck.new(card_array2)
    player2 = Player.new('Cory', deck2)

    turn = Turn.new(player1, player2)

    turn.pile_cards

    expect(turn.player1.deck.cards.length).to eq(2)
    expect(turn.player2.deck.cards.length).to eq(2)

  end

  it 'removes cards based on turn type :mutually_assured_destruction' do #pile_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 11)
    card_array1 = [card1, card2, card3]
    deck1 = Deck.new(card_array1)
    player1 = Player.new('Clarisa', deck1)

    card4 = Card.new(:club, '5', 12)
    card5 = Card.new(:spade, '10', 10)
    card6 = Card.new(:heart, 'Jack', 11)
    card_array2 = [card4, card5, card6]
    deck2 = Deck.new(card_array2)
    player2 = Player.new('Cory', deck2)

    turn = Turn.new(player1, player2)

    turn.pile_cards

    expect(turn.player1.deck.cards.length).to eq(0)
    expect(turn.player2.deck.cards.length).to eq(0)

  end

  it 'removes cards based on turn type :war' do #pile_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_array1 = [card1, card2, card3]
    deck1 = Deck.new(card_array1)
    player1 = Player.new('Clarisa', deck1)

    card4 = Card.new(:club, '5', 12)
    card5 = Card.new(:spade, '10', 10)
    card6 = Card.new(:heart, 'Jack', 11)
    card_array2 = [card4, card5, card6]
    deck2 = Deck.new(card_array2)
    player2 = Player.new('Cory', deck2)

    turn = Turn.new(player1, player2)

    turn.pile_cards

    expect(turn.player1.deck.cards.length).to eq(0)
    expect(turn.player2.deck.cards.length).to eq(0)

  end

  it "awards the winner with cards" do #award_spoils
    card1 = Card.new(:diamond, 'Queen', 12) #passes :mad
    card2 = Card.new(:spade, '3', 3)        #passes :basic
    card3 = Card.new(:heart, 'Ace', 14)     #passes :war
    card_array1 = [card1, card2, card3]
    deck1 = Deck.new(card_array1)
    player1 = Player.new('Clarisa', deck1)

    card4 = Card.new(:club, '5', 12)
    card5 = Card.new(:spade, '10', 10)
    card6 = Card.new(:heart, 'Jack', 11)
    card_array2 = [card4, card5, card6]
    deck2 = Deck.new(card_array2)
    player2 = Player.new('Cory', deck2)

    turn = Turn.new(player1, player2)

    the_winner = turn.winner
    turn.pile_cards
    turn.award_spoils(the_winner)

    expect(turn.spoils_of_war).to eq([])
    expect(card_array1.length).to eq(6)
    expect(card_array2.length).to eq(0)
  end


end
