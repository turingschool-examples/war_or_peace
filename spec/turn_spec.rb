require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require 'pry'

describe Turn do
  context Turn do
    it "is an instance of turn" do
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

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)

      players = Turn.new(@player1, @player2)

      expect(turn).to be_an_instance_of(Turn)
      expect(player1).to be_an_instance_of(Player)
      expect(deck1).to be_an_instance_of(Deck)
      expect(player2.name).to eq('Aurora')
      expect(players).to be_an_instance_of(Turn)
      expect(player1.deck).to eq(deck1)


    end

    it 'has turn types' do
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

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)


      expect(player1.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.type).to eq(:basic)

    end

    it 'determines the winner' do
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

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)
      # winner = turn.winner
      expect(turn.winner).to eq(player1)
      deck1.remove_card
      deck1.remove_card
      expect(turn.winner).to eq(player2)
    end

    it 'determines the winner' do
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

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)

      expect(turn.pile_cards).to eq([card1, card3])
    end

    it 'determines the winner' do
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

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)

      winner = turn.winner

      expect(turn.award_spoils(winner)).to eq(nil)
      turn.pile_cards
      turn.pile_cards
      expect(turn.award_spoils(winner).length).to eq(4)
    end
  end
end
