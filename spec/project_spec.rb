require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe "Full flow iteration example interactions" do

  it "iteration 2 of player" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)

      expect(player).to be_an_instance_of(Player)
      expect(player.name).to eq "Clarisa"
      expect(player.deck).to be_an_instance_of(Deck)
      expect(player.has_lost?).to eq false
      expect(player.deck.remove_card).to eq card1
      expect(player.has_lost?).to eq false
      expect(player.deck.remove_card).to eq card2
      expect(player.has_lost?).to eq false
      expect(player.deck.remove_card).to eq card3
      expect(player.has_lost?).to eq true
      expect(player.deck.cards).to eq []
  end

  it "runs iteration 2 for turn with :basic type play" do
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
# binding.pry
    expect(turn).to be_an_instance_of(Turn)
    expect(turn.player1).to eq player1
    expect(turn.player2).to eq player2
    expect(turn.spoils_of_war).to eq []
    expect(turn.type).to eq :basic
    winner = turn.winner
    expect(turn.winner).to eq player1
    turn.pile_cards
    expect(turn.spoils_of_war).to eq [card1, card3]
    turn.award_spoils(winner)
    expect(player1.deck).to eq (deck1)
    expect(player2.deck).to eq (deck2)

  end

  it "runs iteration 2 for turn with :war type play" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    winner = turn.winner
    expect(turn.winner).to eq player2
    turn.pile_cards
    expect(turn.spoils_of_war).to eq [card1, card4, card2, card3, card5, card6]
    turn.award_spoils(winner)
    player1.deck
    player2.deck

  end

  it "runs iteration 2 for turn with :war type play" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    winner = turn.winner
    turn.pile_cards
    turn.spoils_of_war
    player1.deck
    player2.deck
  end
end
