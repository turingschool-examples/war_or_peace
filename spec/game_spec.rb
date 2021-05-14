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

    puts "\nTesting 'Game' 'happy path':\n"
    puts "-"*25
    expect(game.greet(player1, player2).to_s).to include('Welcome', 'Megan', 'Aurora')
    puts "\nTesting 'Game' 'sad path':\n"
    puts "-"*25
    expect(game.greet(player1_name, player2_name).to_s).to include('Error!')
  end
end
