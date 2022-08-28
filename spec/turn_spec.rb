require 'pry'
require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do

  it "exists" do
 # before (:each) do
   card1 = Card.new(:heart, 'Jack', 11)
   card2 = Card.new(:heart, '10', 10)
   card3 = Card.new(:heart, '9', 9)
   card4 = Card.new(:diamond, 'Jack', 11)
   card5 = Card.new(:heart, '8', 8)
   card6 = Card.new(:diamond, 'Queen', 12)
   card7 = Card.new(:heart, '3', 3)
   card8 = Card.new(:diamond, '2', 2)

   cards = [card1, card2, card5, card8, card3, card4, card6, card7]

   deck1 = Deck.new([card1, card2, card5, card8])
   deck2 = Deck.new([card3, card4, card6, card7])

   player1 = Player.new("Megan", deck1)
   player2 = Player.new("Aurora", deck2)

   turn = Turn.new(player1, player2)
   expect(turn).to be_an_instance_of(Turn)
   end

      it 'has readable attributes'do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      cards = [card1, card2, card5, card8, card3, card4, card6, card7]

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)
 # describe 'turn' do
   it 'has turn type basic and a winner' do
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

     expect(turn.type).to eq(:basic)


    end
    it 'basic turn sends the top card to the spoils_of_war'do
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
    expect(turn.type).to eq(:basic)
    turn.pile_cards
    expect(turn.spoils_of_war).to eq([card1, card3])
    expect(player1.deck.cards).to eq([card2, card5, card8])
    expect(player2.deck.cards).to eq([card4, card6, card7])

    end


   it 'award_spoils to the winner on basic'do
     card1 = Card.new(:heart, 'Jack', 11)
     card2 = Card.new(:heart, '10', 10)
     card3 = Card.new(:heart, '9', 9)
     card4 = Card.new(:diamond, 'Jack', 11)
     card5 = Card.new(:heart, '8', 8)
     card6 = Card.new(:diamond, 'Queen', 12)
     card7 = Card.new(:heart, '3', 3)
     card8 = Card.new(:diamond, '2', 2)
     cards1 = [card1, card2, card5, card8]
     deck1 = Deck.new(cards1)
     cards2 = [card3, card4, card6, card7]
     deck2 = Deck.new(cards2)

     player1 = Player.new("Megan", deck1)
     player2 = Player.new("Aurora", deck2)

     turn = Turn.new(player1, player2)
     expect(turn.type).to eq(:basic)
     turn.pile_cards
     turn.award_spoils(player1)
     expect(turn.spoils_of_war).to eq([card1, card3])



     expect(turn.spoils_of_war).to eq([card1, card3])

    end

     it"has a turn type war and a winner"do

     card1 = Card.new(:heart, 'Jack', 11)
     card2 = Card.new(:heart, '10', 10)
     card3 = Card.new(:heart, '9', 9)
     card4 = Card.new(:diamond, 'Jack', 11)
     card5 = Card.new(:heart, '8', 8)
     card6 = Card.new(:diamond, 'Queen', 12)
     card7 = Card.new(:heart, '3', 3)
     card8 = Card.new(:diamond, '2', 2)
     cards1 = [card1, card2, card5, card8]
     deck1 = Deck.new(cards1)
     cards2 = [card4, card3, card6, card7]
     deck2 = Deck.new(cards2)

     player1 = Player.new("Megan", deck1)
     player2 = Player.new("Aurora", deck2)

     turn = Turn.new(player1, player2)

     expect(turn.type).to eq(:war)
     turn.pile_cards
     expect(turn.spoils_of_war).to eq([card1, card4, card2, card3, card5, card6])
     turn.award_spoils(player2)
     expect(player2.deck.cards).to eq([card7, card1, card4, card2, card3, card5, card6,])

      end

     it "has a type mutually_assured_destruction with no winner"do
     card1 = Card.new(:heart, 'Jack', 11)
     card2 = Card.new(:heart, '10', 10)
     card3 = Card.new(:heart, '9', 9)
     card4 = Card.new(:diamond, 'Jack', 11)
     card5 = Card.new(:heart, '8', 8)
     card6 = Card.new(:diamond, '8', 8)
     card7 = Card.new(:heart, '3', 3)
     card8 = Card.new(:diamond, '2', 2)
     cards1 = [card1, card2, card5, card8]
     deck1 = Deck.new(cards1)
     cards2 = [card4, card3, card6, card7]
     deck2 = Deck.new(cards2)

     player1 = Player.new("Megan", deck1)
     player2 = Player.new("Aurora", deck2)

     turn = Turn.new(player1, player2)

     expect(turn.type).to eq(:mutually_assured_destruction)
     expect(turn.winner).to eq("No Winner")
     turn.pile_cards
     expect(turn.spoils_of_war).to eq([])
     # expect(player1.deck.cards).to eq([card8])
     # expect(player2.deck.cards).to eq([card7])
     end


  end
end
