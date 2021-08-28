require 'rspec'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'

## figure out the diff btw eq and be
RSpec.describe Turn do

#use require thing that Dione showed us and organize it better
  xit "returns player's name, player's deck and spoils_of_war" do

    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    expect(turn.player1).to be(player1)
    expect(turn.player2).to be(player2)
    expect(turn.player1.name).to eq("Megan")
    expect(turn.player2.name).to eq("Aurora")
    expect(turn.player1.deck).to eq(deck1)
    expect(turn.player1.deck).to_not eq(deck2)

    expect(turn.spoils_of_war).to be_empty


  end
##envelop tests in a block as :basic once it runs properly
## error.works on pry
  xit "can determine the type of turn" do
    turn_first = turn.type
    expect(turn_first).to eq(:basic)
  end
## ^ same error
  xit "can determine the winner" do
    expect(turn.winner).to eq(player1)
  end
## same error
  xit "can move cards to spoils_of_war accordingly" do
    turn.pile_cards

    expect(turn.spoils_of_war).to be([card1, card3])
  end
## same error.  ALSO NOT WORKING ON PRY
  it "can award_spoils to the winner" do

    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    expect(turn.player1).to be(player1)
    expect(turn.player2).to be(player2)
    expect(turn.player1.name).to eq("Megan")
    expect(turn.player2.name).to eq("Aurora")

    expect(turn.spoils_of_war).to be_empty
    expect(turn.type).to eq(:basic)

    winner = turn.winner
    turn.pile_cards

    expect(turn.spoils_of_war).to eq([card1, card3])



    turn.award_spoils(winner)

    expect(player1.deck.cards).to eq([card2, card5, card8, card1, card3])
    expect(player2.deck.cards).to eq([card4, card6, card7])
  end
##  KEEP IN MIND - once pile_cards runs, it basically goes to the next turn.

end
