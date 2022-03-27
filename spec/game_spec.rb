require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'
require './lib/game'
require 'pry'

RSpec.describe Game do
  before(:each) do
    file_name = './lib/cards.txt'
    generator = Card_Generator.new(file_name)
    @deck1 = Deck.new(generator.cards[0..25].shuffle)
    @deck2 = Deck.new(generator.cards[26..52].shuffle)
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
  end

  it "exists" do
    game = Game.new(@player1, @player2)
    expect(game).to be_an_instance_of(Game)
  end

  describe "#start" do
    it "start should run until player_lost? is fulfilled" do
      game = Game.new(@player1, @player2)
      game.start
      expect(@player1.deck.cards.length).to eq(0)
    end
  end
end
