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

  it "has players" do
    expect(turn.player1).to eq(player1 {@deck = [card1, card2, card5, card8], @name = "Megan"})
    expect(turn.player2).to eq(player2 {@deck = [card3, card4, card6, card7], @name = "Aurora"})
  end

  it "has spoils of war array" do
    expect(turn.spoils_of_war).to eq([])
  end

  it "can tell what type of turn is happening" do
    expect(turn.type).to eq(:basic)
  end

  it "can determine a basic turn winner" do
    expect(turn.winner).to eq(player1 {@deck = [card1, card2, card5, card8], @name = "Megan"})
  end

  it "cand etermine a war turn winner" do
    player2.deck.remove_card
    expect(turn.winner).to eq(player1 {@deck = [card2, card5, card8], @name = "Megan"})
  end

  it "cand etermine a mutually_assured_destruction turn winner" do
    player2.deck.remove_card
    player2.deck.remove_card
    player2.deck.remove_card
    player2.deck.remove_card
    player2.deck.add_card(card4)
    player2.deck.add_card(card6)
    player2.deck.add_card(card9)
    player2.deck.add_card(card2)
    expect(turn.winner).to eq("No Winner")

  end

  it "can send cards to spoils_of_war for basic turn" do
    turn.pile_cards

    expect(turn.spoils_of_war).to eq([card1, card3])
  end

  it "can award spoils" do
    turn.winner
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
    expect(player1.deck).to eq(player1.deck {@cards = [card2, card5, card8, card1, card3]})
    expect(player2.deck).to eq(player2.deck {@cards = [card4, card6, card7]})
  end
end
