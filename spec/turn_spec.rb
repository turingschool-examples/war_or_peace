require 'rspec'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'

RSpec.describe Turn do

#use require thing that Dione showed us and organize it better
  it "has a name and all the bells and whistles" do

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
    expect(turn.spoils_of_war).to be_empty

  end

  xit "can determine the type of turn" do
    expect(turn.type).to be(:basic)
  end

  xit "can determine the winner" do
    expect(turn.winner).to be(player1)
  end

  xit "can move cards to spoils_of_war accordingly" do
    turn.pile_cards

    expect(turn.spoils_of_war).to be([card1, card3])
  end

  xit "can award_spoils to the winner" do
    winner = turn.winner

    turn.award_spoils(winner)

    expect(player1.deck.cards).to be([card2, card5, card8, card1, card3])
    expect(player2.deck.cards).to be([card4, card6, card7])
  end

end
