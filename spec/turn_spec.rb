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
     expect(turn.winner).to eq(player1)

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
     turn.pile_cards
     expect(turn.spoils_of_war).to eq([card1, card3])
     turn.award_spoils(player1)

     expect(player1.deck.cards).to eq([card2, card5, card8, card1, card3])
binding.pry
   end

end




# describe'winner'
#      it'has a winner' do
#
#      end
