require_relative 'spec_helper'

RSpec.describe Game do
  before :each do
    @card1 = Card.new(:heart, '3', 3)
    @card2 = Card.new(:heart, '4', 4)
    @card3 = Card.new(:heart, '5', 5)
    @card4 = Card.new(:heart, '6', 6)
    @card5 = Card.new(:heart, '7', 7)
    @card6 = Card.new(:heart, '8', 8)
    @card7 = Card.new(:heart, '9', 9)
    @card8 = Card.new(:heart, '10', 10)

    @deck1 = [@card1, @card3, @card5, @card7]
    @deck2 = [@card2, @card4, @card6, @card8]

    @player1 = Player.new('Billy', @deck1)
    @player2 = Player.new('Lauren', @deck2)
    @turn = Turn.new(@player1, @player2)
    @game = Game.new(@turn)
  end

  it 'exists' do
    expect(@game).to be_an_instance_of(Game)
  end

  it 'has players' do
    expect(@game.turn.player1).to be_an_instance_of(Player)
    expect(@turn.player1.name).to eq("Billy")
  end
end
