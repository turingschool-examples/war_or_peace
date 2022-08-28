require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Deck do
  it 'initialize' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    # cards1= [card1, card2, card5, card8]
    # cards2 = [card3, card4, card6, card7]
    # deck1 = Deck.new(cards1)  
    # deck2 = Deck.new(cards2)  
    deck1 = Deck.new([card1, card2, card5, card8])  
    deck2 = Deck.new([card3, card4, card6, card7]) 
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    expect(player1.name).to eq('Megan')
        # require 'pry'; binding.pry 
    turn = Turn.new(player1, player2)     
        #  require 'pry'; binding.pry 
  end 
  it 'tests spoils of war' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    # cards1= [card1, card2, card5, card8]
    # cards2 = [card3, card4, card6, card7]
    # deck1 = Deck.new(cards1)  
    # deck2 = Deck.new(cards2) 
    deck1 = Deck.new([card1, card2, card5, card8])  
    deck2 = Deck.new([card3, card4, card6, card7])  
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2) 
    # both_players= [player1, player2]
    # require 'pry'; binding.pry 
    expect(turn.type).to eq(:basic)
  # require 'pry'; binding.pry 
    expect(turn.spoils_of_war).to eq(nil)
  
    # require 'pry'; binding.pry 
    expect(turn.winner).to eq(player1)
    turn.pile_cards
#  require 'pry'; binding.pry 
    expect(turn.spoils_of_war).to eq([card1, card3])
    # require 'pry'; binding.pry 
    winner = turn.winner
    turn.award_spoils(winner)

    # expect(turn.player1.deck.cards).to eq([card2, card5, card8])
    # expect(turn.player2.deck.cards).to eq([card4, card6, card7])

    expect(turn.player1.deck).to eq(deck1)
    expect(turn.player2.deck).to eq(deck2)
  




  end 

  it 'tests the war pattern' do 
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    # cards1= [card1, card2, card5, card8]
    # cards2 = [card3, card4, card6, card7]
    deck1 = Deck.new([card1, card2, card5, card8])  
    deck2 = Deck.new([card4, card3, card6, card7])  
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2) 
    # # winner= turn.winner 
    # turn.pile_cards
    # turn.spoils_of_war
    # require 'pry'; binding.pry 
    # turn.award_spoils(winner)

  end 

  it 'tests the MAD pattern' do 
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    # cards1= [card1, card2, card5, card8]
    # cards2 = [card3, card4, card6, card7]
    deck1 = Deck.new([card1, card2, card5, card8])  
    deck2 = Deck.new([card4, card3, card6, card7])  
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2) 
    # # winner= turn.winner 
    # turn.pile_cards
    # turn.spoils_of_war
    # require 'pry'; binding.pry 
    # turn.award_spoils(winner)

  end 
  it 'a turn' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    # cards1= [card1, card2, card5, card8]
    # cards2 = [card3, card4, card6, card7]
    deck1 = Deck.new([card1, card2, card5, card8])  
    deck2 = Deck.new([card4, card3, card6, card7])  
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    turn = Turn.new(player1, player2) 

    game1= Game.new(turn)
    
  end
end 

