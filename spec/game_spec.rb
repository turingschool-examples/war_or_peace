require 'rspec'
require_relative 'spec_helper'

RSpec.describe Game do
  it 'initializes' do
    game = Game.new
    expect(game).to be_an_instance_of(Game)

    expect(game.cards.class).to eq(Array)
    expect(game.cards.length).to eq(0)

    expect(game.total_turn_counter).to eq(1)
    expect(game.basic_turn_counter).to eq(0)
    expect(game.war_turn_counter).to eq(0)
    expect(game.mas_turn_counter).to eq(0)
  end

  it 'has a built in card generator' do
    game = Game.new

    expected = game.shuffle_deck

    expect(expected.class).to eq(Array)
    expect(expected.length).to eq(52)

    clubs = expected.select { |card| card.suit == :club }
    hearts = expected.select { |card| card.suit == :heart }
    spades = expected.select { |card| card.suit == :spade }
    diamonds = expected.select { |card| card.suit == :diamond }

    expect(clubs.length).to eq(13)
    expect(hearts.length).to eq(13)
    expect(spades.length).to eq(13)
    expect(diamonds.length).to eq(13)

    ranks = expected.group_by { |card| card.rank }

    expect(ranks.length).to eq(13)
    ranks.each { |rank, cards| expect(cards.length).to eq(4) }

    expect(game.split_deck[0].length).to eq(26)
    expect(game.split_deck[1].length).to eq(26)
  end

  it 'can increment and reset turns' do
    game = Game.new

    expect(game.total_turn_counter).to eq(1)
    expect(game.basic_turn_counter).to eq(0)
    expect(game.war_turn_counter).to eq(0)
    expect(game.mas_turn_counter).to eq(0)

    3.times { game.increment_total_turns }
    3.times { game.increment_basic_turns }
    3.times { game.increment_war_turns }
    3.times { game.increment_mas_turns }

    expect(game.total_turn_counter).to eq(4)
    expect(game.basic_turn_counter).to eq(3)
    expect(game.war_turn_counter).to eq(3)
    expect(game.mas_turn_counter).to eq(3)

    game.reset_turns

    expect(game.total_turn_counter).to eq(1)
    expect(game.basic_turn_counter).to eq(0)
    expect(game.war_turn_counter).to eq(0)
    expect(game.mas_turn_counter).to eq(0)
  end

  it 'can greet players' do
    game = Game.new
    game.shuffle_deck

    player1 = Player.new('Megan', Deck.new(game.split_deck[0]))
    player2 = Player.new('Aurora', Deck.new(game.split_deck[1]))

    expect(player1.deck.cards.length).to eq(26)
    expect(player2.deck.cards.length).to eq(26)
    expect(player1.has_lost?).to be(false)
    expect(player2.has_lost?).to be(false)

    expected = [
      "\nWelcome to War! (or Peace) This game will be played with #{game.cards.length} cards.",
      "The players today are #{player1.name} and #{player2.name}.",
      "Type 'GO' to start the game!",
      "-"*50,
      " >"
    ]

    expect(game.greet(player1, player2)).to eq(expected)
    expect(game.greet('Megan', 'Aurora')).to eq(game.type_error)
  end

  it 'can print final results' do
    game = Game.new
    game.shuffle_deck

    player1 = Player.new('Megan', Deck.new(game.split_deck[0]))
    player2 = Player.new('Aurora', Deck.new(game.split_deck[1]))

    expected = [
      "\nFinal results:",
      "-"*20,
      "#{player1.name} has #{player1.deck.cards.length} cards.",
      "#{player2.name} has #{player2.deck.cards.length} cards.",
      "-"*20,
      "#{game.basic_turn_counter} total 'basic' turns.",
      "#{game.war_turn_counter} total 'war' turns.",
      "#{game.mas_turn_counter} total 'mutually assured destruction' turns."
    ]

    expect(game.print_results(player1, player2)).to eq(expected)
  end

  it "can start and end with player1's victory" do
    game = Game.new
    game.create_deck

    loaded_deck = [
      Deck.new([game.cards[0],game.cards[13],game.cards[26],game.cards[39]]),
      Deck.new([game.cards[1],game.cards[14],game.cards[27],game.cards[40]])
    ]

    player1 = Player.new('Megan', loaded_deck[0])
    player2 = Player.new('Aurora', loaded_deck[1])

    expect(player1.deck.cards.length).to eq(4)
    expect(player2.deck.cards.length).to eq(4)
    expect(player1.has_lost?).to be(false)
    expect(player2.has_lost?).to be(false)

    puts "\nTesting limited 'Game' run (player1 victory):\n"
    puts "-"*30
    game.start(player1, player2)

    expect(player1.deck.cards.length).to eq(8)
    expect(player1.has_lost?).to be(false)
    expect(player2.deck.cards.length).to eq(0)
    expect(player2.has_lost?).to be(true)
  end

  it "can start and end with player2's victory" do
    game = Game.new
    game.create_deck

    loaded_deck = [
      Deck.new([game.cards[0],game.cards[13],game.cards[26],game.cards[39]]),
      Deck.new([game.cards[1],game.cards[14],game.cards[27],game.cards[40]])
    ]

    player1 = Player.new('Megan', loaded_deck[1])
    player2 = Player.new('Aurora', loaded_deck[0])

    expect(player1.deck.cards.length).to eq(4)
    expect(player2.deck.cards.length).to eq(4)
    expect(player1.has_lost?).to be(false)
    expect(player2.has_lost?).to be(false)

    puts "\nTesting limited 'Game' run (player2 victory):\n"
    puts "-"*30
    game.start(player1, player2)

    expect(player1.deck.cards.length).to eq(0)
    expect(player1.has_lost?).to be(true)
    expect(player2.deck.cards.length).to eq(8)
    expect(player2.has_lost?).to be(false)
  end
end
