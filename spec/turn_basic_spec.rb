require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

describe Turn do
  let(:card1){Card.new(:heart, 'Jack', 11)}
  let(:card2){Card.new(:heart, '10', 10)}
  let(:card3){Card.new(:heart, '9', 9)}
  let(:card4){Card.new(:diamond, 'Jack', 11)}
  let(:card5){Card.new(:heart, '8', 8)}
  let(:card6){Card.new(:diamond, 'Queen', 12)}
  let(:card7){Card.new(:heart, '3', 3)}
  let(:card8){Card.new(:diamond, '2', 2)}
  let(:card9){Card.new(:diamond, '8', 8)}
  let(:deck1){Deck.new([card1, card2, card5, card8])}
  let(:deck2){Deck.new([card3, card4, card6, card7])}
  let(:player1){Player.new("Megan", deck1)}
  let(:player2){Player.new("Aurora", deck2)}
  let(:turn){Turn.new(player1, player2)}

  it "can run a basic turn" do
    turn.player1
    turn.player2
    turn.spoils_of_war
    turn.type
    turn.winner
    turn.pile_cards
    turn.spoils_of_war
    turn.award_spoils(player1)
    expect(player1.deck).to eq(player1.deck {@cards = [card2, card5, card8, card1, card3]})
    expect(player2.deck).to eq(player2.deck {@cards = [card4, card6, card7]})
  end
end
