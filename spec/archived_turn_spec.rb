require './lib/turn'
require './lib/card'
require './lib/player'
require './lib/deck'

describe Turn do
  
  it 'is an instance of turn' do
  turn = Turn.new("player1", "deck")
    expect(turn).to be_a(Turn)
  end

  it 'can track the current turn' do
    card1 = Card.new(:diamond, 'Two', 1)
    card2 = Card.new(:diamond, 'Three', 2)
    card3 = Card.new(:diamond, 'Four', 3)
    card4 = Card.new(:diamond, 'Five', 4)
    card5 = Card.new(:diamond, 'Six', 5)
    card6 = Card.new(:diamond, 'Seven', 6)
    card7 = Card.new(:diamond, 'Eight', 7)
    card8 = Card.new(:diamond, 'Nine', 8)
    card9 = Card.new(:diamond, 'Ten', 9)
    card10 = Card.new(:diamond, 'Jack', 10)
    card11 = Card.new(:diamond, 'Queen', 11)
    card12 = Card.new(:diamond, 'King', 12)
    card13 = Card.new(:diamond, 'Ace', 13)
    player1_deck = Deck.new([card1, card2, card3, card4, card5, card6])
    player2_deck = Deck.new([card8, card9, card10, card11, card12, card13])
    player1 = Player.new("Player 1", player1_deck)
    player2 = Player.new("Player 2", player2_deck)


    turn = Turn.new(player1, player2)
    turn.go

    expect(turn.turn).to eq(6)

  end

  it 'Can have a player win a game' do
    card1 = Card.new(:diamond, 'Two', 1)
    card2 = Card.new(:diamond, 'Three', 2)
    card3 = Card.new(:diamond, 'Four', 3)
    card4 = Card.new(:diamond, 'Five', 4)
    card5 = Card.new(:diamond, 'Six', 5)
    card6 = Card.new(:diamond, 'Seven', 6)
    card7 = Card.new(:diamond, 'Eight', 7)
    card8 = Card.new(:diamond, 'Nine', 8)
    card9 = Card.new(:diamond, 'Ten', 9)
    card10 = Card.new(:diamond, 'Jack', 10)
    card11 = Card.new(:diamond, 'Queen', 11)
    card12 = Card.new(:diamond, 'King', 12)
    card13 = Card.new(:diamond, 'Ace', 13)
    player1_deck = Deck.new([card1, card2, card3, card4, card5, card6])
    player2_deck = Deck.new([card8, card9, card10, card11, card12, card13])
    player1 = Player.new("Player 1", player1_deck)
    player2 = Player.new("Player 2", player2_deck)


    turn = Turn.new(player1, player2)
    turn.go

    expect(player1.has_lost?).to be(true)
    expect(player2.deck.cards.size).to eq(12)

  end

  it 'can handle a tie with war' do
    card1 = Card.new(:diamond, 'Two', 1)
    card2 = Card.new(:diamond, 'Three', 2)
    card3 = Card.new(:diamond, 'Four', 3)
    card4 = Card.new(:diamond, 'Five', 4)
    card5 = Card.new(:diamond, 'Six', 5)
    card6 = Card.new(:diamond, 'Seven', 6)
    card7 = Card.new(:diamond, 'Eight', 7)
    card8 = Card.new(:diamond, 'Nine', 8)
    card9 = Card.new(:diamond, 'Ten', 9)
    card10 = Card.new(:diamond, 'Jack', 10)
    card11 = Card.new(:diamond, 'Queen', 11)
    card12 = Card.new(:diamond, 'King', 12)
    card13 = Card.new(:diamond, 'Ace', 13)
    player1_deck = Deck.new([card1, card2, card3, card4, card5, card6])
    player2_deck = Deck.new([card8, card9, card10, card11, card12, card6])
    player1 = Player.new("Player 1", player1_deck)
    player2 = Player.new("Player 2", player2_deck)

    turn = Turn.new(player1, player2)
    turn.go

    expect(player1.has_lost?).to be(true)
    expect(player2.deck.cards.size).to eq(12)

  end

  it 'can handle M.A.D.' do
    card1 = Card.new(:diamond, 'Two', 1)
    card2 = Card.new(:diamond, 'Three', 2)
    card3 = Card.new(:diamond, 'Four', 3)
    card4 = Card.new(:diamond, 'Five', 4)
    card5 = Card.new(:diamond, 'Six', 5)
    card6 = Card.new(:diamond, 'Seven', 6)
    card7 = Card.new(:diamond, 'Eight', 7)
    card8 = Card.new(:diamond, 'Nine', 8)
    card9 = Card.new(:diamond, 'Ten', 9)
    card10 = Card.new(:diamond, 'Jack', 10)
    card11 = Card.new(:diamond, 'Queen', 11)
    card12 = Card.new(:diamond, 'King', 12)
    card13 = Card.new(:diamond, 'Ace', 13)
    player1_deck = Deck.new([card1, card2, card3, card4, card5, card6])
    player2_deck = Deck.new([card8, card9, card8, card4, card12, card6])

    # player1_deck = Deck.new([card1, card2, card4, card4, card5, card6])
    # player2_deck = Deck.new([card8, card9, card4, card9, card12, card6])

    player1 = Player.new("Player 1", player1_deck)
    player2 = Player.new("Player 2", player2_deck)

    turn = Turn.new(player1, player2)
    turn.go

    expect(player1.has_lost?).to be(true)
    expect(player2.deck.cards.size).to eq(6)

  end

  it 'can end in a tie after 1_000_000 turns' do
    card1 = Card.new(:diamond, 'Two', 1)
    card2 = Card.new(:diamond, 'Three', 2)
    card3 = Card.new(:diamond, 'Four', 3)
    card4 = Card.new(:diamond, 'Five', 4)
    card5 = Card.new(:diamond, 'Six', 5)
    card6 = Card.new(:diamond, 'Seven', 6)
    card7 = Card.new(:diamond, 'Eight', 7)
    card8 = Card.new(:diamond, 'Nine', 8)
    card9 = Card.new(:diamond, 'Ten', 9)
    card10 = Card.new(:diamond, 'Jack', 10)
    card11 = Card.new(:diamond, 'Queen', 11)
    card12 = Card.new(:diamond, 'King', 12)
    card13 = Card.new(:diamond, 'Ace', 13)
    player1_deck = Deck.new([card1, card2, card3, card4, card5, card6])
    player2_deck = Deck.new([card8, card9, card10, card11, card12, card13])
    player1 = Player.new("Player 1", player1_deck)
    player2 = Player.new("Player 2", player2_deck)


    turn = Turn.new(player1, player2)
    turn.turn=(999_998)
    binding.pry
    turn.go

    expect(player1.has_lost?).to be(false)
    expect(player2.has_lost?).to be(false)
  end

end

