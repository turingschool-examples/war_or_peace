require 'rspec'
require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/player'
require_relative '../lib/turn'
require_relative '../lib/game'

RSpec.describe Game do
  it 'creates 52 cards with 13 per suit' do
    game = Game.new
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
end
