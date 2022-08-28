require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  before do
    @card1 = Card.new(:foo, 'Bar', 1)
    @card2 = Card.new(:foo, 'Bar', 2)
    @card3 = Card.new(:foo, 'Bar', 3)
    @card4 = Card.new(:foo, 'Bar', 4)

    @basic_turn = Turn.new(Player.new('Player1', Deck.new([])), Player.new('Player2', Deck.new([])))
    @basic_turn.player1.deck.add_card_to_bottom(@card1)
    @basic_turn.player2.deck.add_card_to_bottom(@card2)

    @war_turn = Turn.new(Player.new('Player1', Deck.new([])), Player.new('Player2', Deck.new([])))
    @war_turn.player1.deck.add_card_to_bottom(@card1)
    @war_turn.player1.deck.add_card_to_bottom(@card2)
    @war_turn.player1.deck.add_card_to_bottom(@card3)
    @war_turn.player2.deck.add_card_to_bottom(@card1)
    @war_turn.player2.deck.add_card_to_bottom(@card2)
    @war_turn.player2.deck.add_card_to_bottom(@card4)

    @mad_turn = Turn.new(Player.new('Player1', Deck.new([])), Player.new('Player2', Deck.new([])))
    @mad_turn.player1.deck.add_card_to_bottom(@card1)
    @mad_turn.player1.deck.add_card_to_bottom(@card1)
    @mad_turn.player1.deck.add_card_to_bottom(@card1)
    @mad_turn.player2.deck.add_card_to_bottom(@card1)
    @mad_turn.player2.deck.add_card_to_bottom(@card1)
    @mad_turn.player2.deck.add_card_to_bottom(@card1)

    @war_turn_3v1 = Turn.new(Player.new('Player1', Deck.new([])), Player.new('Player2', Deck.new([])))
    @war_turn_3v1.player1.deck.add_card_to_bottom(@card1)
    @war_turn_3v1.player1.deck.add_card_to_bottom(@card1)
    @war_turn_3v1.player1.deck.add_card_to_bottom(@card1)
    @war_turn_3v1.player2.deck.add_card_to_bottom(@card1)
  end

  it 'initializes' do
    expect(@basic_turn).to be_an_instance_of(Turn)
  end

  it 'has readable attributes' do
    expect(@basic_turn.player1).to be_an_instance_of(Player)
    expect(@basic_turn.player2).to be_an_instance_of(Player)
    expect(@basic_turn.spoils_of_war).to be_an_instance_of(Array)
  end

  it 'determines turn type based on player\'s decks' do
    expect(@basic_turn.type).to eq(:basic)
    expect(@war_turn.type).to eq(:war)
    expect(@mad_turn.type).to eq(:mutually_assured_destruction)
    expect(@war_turn_3v1.type).to eq(:war)
  end

  it 'returns the winner of turn' do
    expect(@basic_turn.winner.name).to eq('Player2')
    expect(@war_turn.winner.name).to eq('Player2')
    expect(@mad_turn.winner).to eq('No Winner!')
    expect(@war_turn_3v1.winner.name).to eq('Player1')
  end

  it 'sends cards into spoils of war based on turn type' do
    basic_turn_pile_test = @basic_turn
    basic_turn_pile_test.pile_cards
    expect(basic_turn_pile_test.spoils_of_war.length).to eq(2)

    war_turn_pile_test = @war_turn
    # each player sends top 3 cards to spoils
    war_turn_pile_test.pile_cards
    expect(war_turn_pile_test.spoils_of_war.length).to eq(6)


    mad_turn_pile_test = @mad_turn
    # each player removes top 3 cards from game
    mad_turn_pile_test.pile_cards
    expect(mad_turn_pile_test.spoils_of_war.length).to eq(0)


    war_turn_3v1_pile_test = @war_turn_3v1
    # each player removes top 3 cards from play, or all of them if they have < 3
    war_turn_3v1_pile_test.pile_cards
    expect(war_turn_3v1_pile_test.spoils_of_war.length).to eq(4)
  end

  it 'awards spoils of war to the winning player' do
  end
end
