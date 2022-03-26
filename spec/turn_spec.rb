require 'rspec'
require './lib/deck.rb'
require './lib/card.rb'
require './lib/player.rb'
require './lib/turn.rb'
require 'pry'

RSpec.describe Turn do

  context "interraction pattern" do

    it "has two seperate decks" do
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

      expect(player1.deck).to eq(deck1)
      expect(player2.deck).to eq(deck2)
    end

    it "is contains a basic turn" do
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

      expect(player1.deck.rank_of_card_at(0)).to eq(11)
      expect(player2.deck.rank_of_card_at(0)).to eq(9)
      expect(turn.type).to eq(:basic)
    end

    it "can determine a winner of a turn type" do
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
      winner = turn.winner

      expect(turn.type).to eq(:basic)
      expect(turn.winner).to eq(player1)
    end

    it "can pile cards together from two decks" do
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
      winner = turn.winner


      expect(turn.type).to eq(:basic)
      turn.pile_cards
      expect(turn.player1.deck.cards).to eq([card2, card5, card8])
      expect(turn.spoils_of_war).to eq([card1, card3])
      turn.award_spoils(winner)
      expect(turn.player1.deck.cards).to eq([card2, card5, card8, card1, card3])
    end

    it "can pile cards together from two decks in a war and award them" do
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
      winner = turn.winner

      expect(turn.type).to eq(:war)
      turn.pile_cards
      expect(turn.player1.deck.cards).to eq([card8])
      expect(turn.player2.deck.cards).to eq([card7])
      expect(turn.spoils_of_war).to eq([card1, card4, card2, card3, card5, card6])
      turn.award_spoils(winner)
      expect(turn.player1.deck.cards).to eq([card8])
      expect(turn.player2.deck.cards).to eq([card7, card1, card4, card2, card3, card5, card6])
    end

    it "award spoils to the winner" do
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
      winner = turn.winner

      expect(turn.type).to eq(:basic)
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([card1, card3])
      turn.award_spoils(winner)
      # require "pry";binding.pry
      expect(turn.player1.deck.cards).to eq([card2, card5, card8, card1, card3])
    end

    it "can pile cards together from two decks in a war and award them" do
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

      expect(turn.type).to eq(:mutually_assured_destruction)
      turn.pile_cards
      expect(turn.player1.deck.cards).to eq([card8])
      expect(turn.player2.deck.cards).to eq([card7])
      expect(turn.spoils_of_war).to eq([])
      expect(turn.player1.deck.cards).to eq([card8])
      expect(turn.player2.deck.cards).to eq([card7])
    end
  end
end
