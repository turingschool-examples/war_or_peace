require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require 'pry'

RSpec.describe Turn do
  it 'Is an instance of Turn' do
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
    
    expect(turn).to be_an_instance_of(Turn)
    expect(turn.player1).to eq(player1)
    expect(turn.player2).to eq(player2)
    expect(turn.spoils_of_war).to eq([])
  end
  
  it 'decides the winner' do
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

    turn.pile_cards
    expect(turn.spoils_of_war).to eq([card1, card3])

    turn.award_spoils(winner)
    expect(player1.deck.cards).to eq([card2, card5, card8, card1, card3])
    expect(player2.deck.cards).to eq([card4, card6, card7])
  end
end

# A :war turn occurs when both players’ rank_of_card_at(0) are the same.

# :mutually_assured_destruction occurs when both players’ rank_of_card_at(0) AND rank_of_card_at(2) are the same.

# winner: this method will determine the winner of the turn.

  # if the turn has a type of :war the winner will be whichever player has a higher rank_of_card_at(2)

  # if the turn has a type of :mutually_assured_destruction the method will return No Winner.

# pile_cards: when this method is called, cards will be sent from the players’ decks into the @spoils_of_war based on these rules

  # for a :war turn, each player will send three cards (the top three cards) to the spoils pile

  # for a :mutually_assured_destruction turn, each player will remove three cards from play (the top three cards in their deck). These cards are not sent to the spoils pile, they are simply removed from each players’ deck.

# award_spoils: this method will add each of the cards in the @spoils_of_war array to the winner of the turn.
