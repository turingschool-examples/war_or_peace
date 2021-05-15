require 'rspec'
require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/player'
require_relative '../lib/turn'
require_relative '../lib/game'

RSpec.describe Game do
  it 'has a built in card generator' do
    game = Game.new
    expect(game).to be_an_instance_of(Game)
    expect(game.cards.length).to eq(52)

    clubs = game.cards.select do |card|
      card.suit == :club
    end

    hearts = game.cards.select do |card|
      card.suit == :heart
    end

    spades = game.cards.select do |card|
      card.suit == :spade
    end

    diamonds = game.cards.select do |card|
      card.suit == :diamond
    end

    expect(clubs.length).to eq(13)
    expect(hearts.length).to eq(13)
    expect(spades.length).to eq(13)
    expect(diamonds.length).to eq(13)
  end

  it 'has all cards correctly ranked' do
    game = Game.new

    ranks = game.cards.group_by do |card|
      card.rank
    end

    expect(ranks.length).to eq(13)

    ranks.each do |rank, cards|
      expect(cards.length).to eq(4)
    end
  end

  it 'can greet the players' do
    game = Game.new

    shuffled_cards = game.cards
    split_deck = [
      Deck.new(shuffled_cards[0..25]),
      Deck.new(shuffled_cards[26..52])
    ]

    player1_name = 'Megan'
    player2_name = 'Aurora'

    player1 = Player.new(player1_name, split_deck[0])
    player2 = Player.new(player2_name, split_deck[1])

    expect(player1.deck.cards.length).to eq(26)
    expect(player2.deck.cards.length).to eq(26)
    expect(player1.has_lost?).to be(false)
    expect(player2.has_lost?).to be(false)

    puts "\nTesting 'Game' 'happy path':\n"
    puts "-"*30
    expect(game.greet(player1, player2).to_s).to include('Welcome', 'Megan', 'Aurora')

    puts "\nTesting 'Game' 'sad path':\n"
    puts "-"*30
    expect(game.greet(player1_name, player2_name).to_s).to include('Error!')
    2.times { puts "-"*40 }
  end

  it 'can start and end' do
    game = Game.new

    shuffled_cards = game.cards
    mini_split_deck = [
      Deck.new(shuffled_cards[0..3]),
      Deck.new(shuffled_cards[4..7])
    ]

    player1_name = 'Megan'
    player2_name = 'Aurora'

    player1 = Player.new(player1_name, mini_split_deck[0])
    player2 = Player.new(player2_name, mini_split_deck[1])

    expect(player1.deck.cards.length).to eq(4)
    expect(player2.deck.cards.length).to eq(4)
    expect(player1.has_lost?).to be(false)
    expect(player2.has_lost?).to be(false)

    puts "\nTesting limited 'Game' run:\n"
    puts "-"*30
    game.start(player1, player2)

    if player1.has_lost?
      expect(player2.deck.cards.length).to be > player1.deck.cards.length
      expect(player2.has_lost?).to be(false)
    elsif player2.has_lost?
      expect(player1.deck.cards.length).to be > player2.deck.cards.length
      expect(player1.has_lost?).to be(false)
    else
      expect(player1.deck.cards.length).to be > 0
      expect(player2.deck.cards.length).to be > 0
      expect(player1.has_lost?).to be(false)
      expect(player2.has_lost?).to be(false)
    end

  end
end
