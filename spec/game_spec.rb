require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
  it "exists" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    deck1 = Deck.new([card1, card2])
    deck2 = Deck.new([card3, card4])
    player1 = Player.new("Schmendrick", deck1)
    player2 = Player.new("Lady Amalthea", deck2)
    turn = Turn.new(player1, player2)
    game = Game.new(player1, player2)
    expect(game).to be_an_instance_of(Game)
  end
  # 
  # describe '#start'
  #   it "starts the turn" do
  #   end

end
