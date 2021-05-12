require 'rspec'
require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/player'
require_relative '../lib/turn'

RSpec.describe Turn do
  it 'initializes correctly' do
    no_players = Turn.new
    expect(no_players.player1.deck.cards.length).to eq(0)
    expect(no_players.player2.deck.cards.length).to eq(0)

    still_no_players = Turn.new('player1', 'player2')
    expect(still_no_players.player1.deck.cards.length).to eq(0)
    expect(still_no_players.player2.deck.cards.length).to eq(0)

    still_no_players = Turn.new(Player.new, Player.new)
    expect(still_no_players.player1.deck.cards.length).to eq(0)
    expect(still_no_players.player2.deck.cards.length).to eq(0)


    deck1 = Deck.new([
      Card.new(:heart, 'Jack', 11),
      Card.new(:heart, '10', 10),
      Card.new(:heart, '8', 8),
      Card.new(:diamond, '2', 2)
    ])
    deck2 = Deck.new([
      Card.new(:heart, '9', 9),
      Card.new(:diamond, 'Jack', 11),
      Card.new(:diamond, 'Queen', 12),
      Card.new(:heart, '3', 3)
    ])
    players = Turn.new(Player.new('Megan', deck1), Player.new('Aurora', deck2))
    expect(players.spoils_of_war).to eq([])

    expect(players.player1.name).to eq('Megan')
    expect(players.player1.deck.cards.length).to eq(4)
    expect(players.player1.has_lost?).to be(false)
    expect(players.player1.deck.percent_high_ranking).to eq(25.0)

    expect(players.player2.name).to eq('Aurora')
    expect(players.player2.deck.cards.length).to eq(4)
    expect(players.player2.has_lost?).to be(false)
    expect(players.player2.deck.percent_high_ranking).to eq(50.0)
  end

  it 'can determine the winner of a basic turn' do
    deck1 = Deck.new([
      Card.new(:heart, 'Jack', 11),
      Card.new(:heart, '10', 10),
      Card.new(:heart, '8', 8),
      Card.new(:diamond, '2', 2)
    ])
    deck2 = Deck.new([
      Card.new(:heart, '9', 9),
      Card.new(:diamond, 'Jack', 11),
      Card.new(:diamond, 'Queen', 12),
      Card.new(:heart, '3', 3)
    ])
    turn = Turn.new(Player.new('Megan', deck1), Player.new('Aurora', deck2))

    expect(turn.spoils_of_war).to eq([])
    expect(turn.type).to eq(:basic)
    expect(turn.winner.name).to eq('Megan')

    turn.pile_cards
    expect(turn.spoils_of_war.length).to eq(2)

    turn.award_spoils(turn.winner)
    expect(turn.spoils_of_war.length).to eq(0)

    expect(turn.player1.deck.cards.length).to eq(5)
    expect(turn.player2.deck.cards.length).to eq(3)
  end

  xit 'can determine the winner of a war turn' do
    #stuff
  end

  xit 'can determine the winner of a mutually assured destruction turn' do
    #stuff
  end
end
