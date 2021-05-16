require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Turn do
  # context 'type :basic' do
    before :each do
      # @cards =
      # @deck = Deck.new(@cards)
      # @standard_deck = Deck.new(@cards)
      @player1 = Player.new("Megan", @deck1)
      @player2 = Player.new("Aurora", @deck2)

      @turn = Turn.new(@player1, @player2)

      @game = Game.new(@standard_deck, @player1, @player2)
    end

    it "exists" do
      expect(@game).to be_an_instance_of(Game)
    end

    it "welcomes the user" do
      @game.welcome("GO")
      expect(@game.welcome).to eq("GO")
    end


  #   xit "starts the game" do
  #     @game.start("GO")
  #
  #     expect(@player1.cards.deck.count).to eq(26)
  #
  #     # expect(@game.start("GO")).to eq(@game.)
  #     # expect(@game.standard_deck.count).to eq(52)
  #   end
  #
  #   xit "shuffles and splits the cards between players" do
  #     @game.random
  #
  #     expect(@player1.deck.cards.count).to eq(26)
  #     expect(@player2.deck.cards.count).to eq(26)
  #   end
  # # end
end
