require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require 'pry'

RSpec.describe Card do
  
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)  
    card4 = Card.new(:diamond, 'Jack', 11) 
    deck1 = Deck.new([card1, card2])
    deck2 = Deck.new([card3, card4])
    player1 = Player.new('V', deck1)
    player2 = Player.new('Michelle', deck2)
    turn = Turn.new(player1, player2) 

    expect(turn).to be_an_instance_of(Turn)
  end

  it "has readable attributes" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)  
    card4 = Card.new(:diamond, 'Jack', 11) 
    deck1 = Deck.new([card1, card2])
    deck2 = Deck.new([card3, card4])
    player1 = Player.new('V', deck1)
    player2 = Player.new('Michelle', deck2)
    turn = Turn.new(player1, player2) 

    expect(turn.player1.name).to eq('V')
    expect(turn.player2.name).to eq('Michelle')
    expect(turn.spoils_of_war).to eq([])
  end

  it "has types" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)  
    card4 = Card.new(:diamond, 'Jack', 11) 
    card5 = Card.new(:heart, '8', 8)  
    card6 = Card.new(:diamond, 'Queen', 12) 
    card7 = Card.new(:heart, '3', 3) 
    card8 = Card.new(:diamond, '2', 2)    
    deck1 = Deck.new([card1, card2, card5,])
    deck2 = Deck.new([card4, card6, card7])
    player1 = Player.new('V', deck1)
    player2 = Player.new('Michelle', deck2)
    turn1 = Turn.new(player1, player2) 
    expect(turn1.type).to eq(:basic)

    deck3 = Deck.new([card1, card2, card5,])
    deck4 = Deck.new([card6, card4, card7])
    player3 = Player.new('V', deck3)
    player4 = Player.new('Michelle', deck4)
    turn2 = Turn.new(player3, player4) 
    expect(turn2.type).to eq(:war)
    
    deck5 = Deck.new([card1, card5, card2,])
    deck6 = Deck.new([card6, card4, card7])
    player5 = Player.new('V', deck5)
    player6 = Player.new('Michelle', deck6)
    turn3 = Turn.new(player5, player6) 

    expect(turn3.type).to eq(:mutually_assured_destruction)

    # expect(turn.type).to eq(:basic)
    # player2.deck.cards.delete_at(0)
    # player2.deck.cards.delete_at(0)
    # expect(turn.type).to eq(:war)
    # player2.deck.add_card(card2)
    # player1.deck.cards.delete_at(-1)
    # player1.deck.add_card(card2)
    # player1.deck.cards.delete_at(-2)
    # expect(turn.type).to eq(:mutually_assured_destruction)
  end

  it 'has a winner' do
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
    expect(turn.spoils_of_war).to eq([])
    expect(turn.winner).to eq(player1)
  end 
  it 'pile the cards' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)  
    card4 = Card.new(:diamond, 'Jack', 11) 
    card5 = Card.new(:heart, '8', 8)  
    card6 = Card.new(:diamond, 'Queen', 12) 
    card7 = Card.new(:heart, '3', 3) 
    card8 = Card.new(:diamond, '2', 2)    
    deck1 = Deck.new([card1, card2, card5,])
    deck2 = Deck.new([card4, card6, card7])
    player1 = Player.new('V', deck1)
    player2 = Player.new('Michelle', deck2)
    turn1 = Turn.new(player1, player2) 
    deck3 = Deck.new([card1, card2, card5,])
    deck4 = Deck.new([card6, card4, card7])
    player3 = Player.new('V', deck3)
    player4 = Player.new('Michelle', deck4)
    turn2 = Turn.new(player3, player4)  
    deck5 = Deck.new([card1, card5, card2,])
    deck6 = Deck.new([card6, card4, card7])
    player5 = Player.new('V', deck5)
    player6 = Player.new('Michelle', deck6)
    turn3 = Turn.new(player5, player6) 
    turn1.pile_cards
    expect(turn1.spoils_of_war).to eq([card1, card4])  
    turn2.pile_cards
    expect(turn2.spoils_of_war).to eq([card1, card2, card5, card6, card4, card7])
    turn3.pile_cards
    expect(turn3.player1.deck.cards).to eq([])
    expect(turn3.player2.deck.cards).to eq([])
  end 

  it 'award spoils' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)  
    card4 = Card.new(:diamond, 'Jack', 11) 
    card5 = Card.new(:heart, '8', 8)  
    card6 = Card.new(:club, 'Queen', 12) 
    card7 = Card.new(:heart, '3', 3) 
    card8 = Card.new(:diamond, '2', 2)    
    deck1 = Deck.new([card1, card2, card5])
    deck2 = Deck.new([card4, card6, card7])
    deck3 = Deck.new([card1, card2, card5])
    deck4 = Deck.new([card6, card4, card7])
    deck5 = Deck.new([card1, card5, card2])
    deck6 = Deck.new([card6, card4, card7])
    player1 = Player.new('V', deck1)
    player2 = Player.new('Michelle', deck2)
    player3 = Player.new('V', deck3)
    player4 = Player.new('Michelle', deck4)
    player5 = Player.new('V', deck5)
    player6 = Player.new('Michelle', deck6)
    turn1 = Turn.new(player1, player2) 
    turn2 = Turn.new(player3, player4)  
    turn3 = Turn.new(player5, player6) 

    turn1.pile_cards
    turn2.pile_cards
    turn3.pile_cards

    turn1.award_spoils(turn1.winner)
    turn2.award_spoils(turn2.winner)
    turn3.award_spoils(turn3.winner)

    expect(player1.deck.cards.include?(card4)).to eq(true)
    expect(turn2.spoils_of_war.include?(card1)).to eq(true)
    expect(turn2.spoils_of_war.include?(card2)).to eq(true)
    expect(turn2.spoils_of_war.include?(card3)).to eq(false)
    expect(turn2.spoils_of_war.include?(card4)).to eq(true)
    expect(turn2.spoils_of_war.include?(card5)).to eq(true)
    expect(turn2.spoils_of_war.include?(card6)).to eq(true)
    expect(turn2.spoils_of_war.include?(card7)).to eq(true)
    expect(player4.deck.cards.include?(card1)).to eq(false)
    expect(player4.deck.cards.include?(card2)).to eq(false)
    expect(player4.deck.cards.include?(card5)).to eq(false)
    expect(player5.deck.cards.include?(card6)).to eq(false)
    expect(player5.deck.cards.include?(card4)).to eq(false)
    expect(player5.deck.cards.include?(card7)).to eq(false)
  end 
end 