require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    card_3 = Card.new(:heart, 'Nine', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:diamond, 'Queen', 12)
    card_7 = Card.new(:heart, 'Three', 3)
    card_8 = Card.new(:diamond, 'Two', 2)
    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_3, card_4, card_6, card_7])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)

    expect(turn).to be_an_instance_of(Turn)
  end

  it 'has readable attributes' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    card_3 = Card.new(:heart, 'Nine', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:diamond, 'Queen', 12)
    card_7 = Card.new(:heart, 'Three', 3)
    card_8 = Card.new(:diamond, 'Two', 2)
    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_3, card_4, card_6, card_7])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)

    expect(turn.player_one).to eq(player_1)
    expect(turn.player_two).to eq(player_2)
    expect(turn.spoils_of_war).to eq([])
  end

  it 'can have a basic turn' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    card_3 = Card.new(:heart, 'Nine', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:diamond, 'Queen', 12)
    card_7 = Card.new(:heart, 'Three', 3)
    card_8 = Card.new(:diamond, 'Two', 2)
    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_3, card_4, card_6, card_7])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)

    expect(turn.type).to eq(:basic)
  end

  it 'can have a winner in basic turn' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    card_3 = Card.new(:heart, 'Nine', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:diamond, 'Queen', 12)
    card_7 = Card.new(:heart, 'Three', 3)
    card_8 = Card.new(:diamond, 'Two', 2)
    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_3, card_4, card_6, card_7])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)

    turn.type
    expect(turn.winner).to eq(player_1)
  end

  it 'can pile_cards in basic turn' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    card_3 = Card.new(:heart, 'Nine', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:diamond, 'Queen', 12)
    card_7 = Card.new(:heart, 'Three', 3)
    card_8 = Card.new(:diamond, 'Two', 2)
    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_3, card_4, card_6, card_7])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)
    
    turn.type
    turn.pile_cards
    expect(turn.spoils_of_war).to eq([card_1, card_3])
  end

  # The way this check is written in the Interaction File
  # is player_1.deck eq deck_1. Which does pass as both are being
  # changed. However, to ensure the game is following intended logic
  # I changed it to see if intended cards in intended index location
  # would return.
  it 'can award_spoils in basic turn' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    card_3 = Card.new(:heart, 'Nine', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:diamond, 'Queen', 12)
    card_7 = Card.new(:heart, 'Three', 3)
    card_8 = Card.new(:diamond, 'Two', 2)
    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_3, card_4, card_6, card_7])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)
    
    turn.type
    turn.winner
    turn.pile_cards
    turn.spoils_of_war
    turn.award_spoils
    expect(turn.player_one.deck.card_list).to eq([card_2, card_5, card_8, card_1, card_3])
    expect(turn.player_two.deck.card_list).to eq([card_4, card_6, card_7])
  end

  it 'can have a war turn' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    card_3 = Card.new(:heart, 'Nine', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:diamond, 'Queen', 12)
    card_7 = Card.new(:heart, 'Three', 3)
    card_8 = Card.new(:diamond, 'Two', 2)
    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_4, card_3, card_6, card_7])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)

    expect(turn.type).to eq(:war)
  end

  it 'can have a winner in war turn' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    card_3 = Card.new(:heart, 'Nine', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:diamond, 'Queen', 12)
    card_7 = Card.new(:heart, 'Three', 3)
    card_8 = Card.new(:diamond, 'Two', 2)
    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_4, card_3, card_6, card_7])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)

    turn.type
    expect(turn.winner).to eq(player_2)
  end

  it 'can pile_cards in war turn' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    card_3 = Card.new(:heart, 'Nine', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:diamond, 'Queen', 12)
    card_7 = Card.new(:heart, 'Three', 3)
    card_8 = Card.new(:diamond, 'Two', 2)
    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_4, card_3, card_6, card_7])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)

    turn.type
    turn.pile_cards
    expect(turn.spoils_of_war).to eq([card_1, card_2, card_5, card_4, card_3, card_6])
  end

  # The way this check is written in the Interaction File
  # is player_1.deck eq deck_1. Which does pass as both are being
  # changed. However, to ensure the game is following intended logic
  # I changed it to see if intended cards in intended index location
  # would return.
  it 'can award_spoils in war turn' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    card_3 = Card.new(:heart, 'Nine', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:diamond, 'Queen', 12)
    card_7 = Card.new(:heart, 'Three', 3)
    card_8 = Card.new(:diamond, 'Two', 2)
    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_4, card_3, card_6, card_7])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)
    
    turn.type
    turn.winner
    turn.pile_cards
    turn.spoils_of_war
    turn.award_spoils
    expect(turn.player_one.deck.card_list).to eq([card_8])
    expect(turn.player_two.deck.card_list).to eq([card_7, card_1, card_2, card_5, card_4, card_3, card_6])
  end

  it 'can have a mutually_assured_destruction (MAD) turn' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    card_3 = Card.new(:heart, 'Nine', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:diamond, 'Eight', 8)
    card_7 = Card.new(:heart, 'Three', 3)
    card_8 = Card.new(:diamond, 'Two', 2)
    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_4, card_3, card_6, card_7])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)

    expect(turn.type).to eq(:mutually_assured_destruction)
  end
  
  it 'no winner in MAD turn' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    card_3 = Card.new(:heart, 'Nine', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:diamond, 'Eight', 8)
    card_7 = Card.new(:heart, 'Three', 3)
    card_8 = Card.new(:diamond, 'Two', 2)
    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_4, card_3, card_6, card_7])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)

    turn.type
    expect(turn.winner).to eq('No Winner')
  end

  it 'can pile_cards in MAD turn' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    card_3 = Card.new(:heart, 'Nine', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:diamond, 'Eight', 8)
    card_7 = Card.new(:heart, 'Three', 3)
    card_8 = Card.new(:diamond, 'Two', 2)
    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_4, card_3, card_6, card_7])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)

    turn.type
    turn.pile_cards
    expect(turn.spoils_of_war).to eq([])
    expect(turn.player_one.deck.card_list).to eq([card_8])
    expect(turn.player_two.deck.card_list).to eq([card_7])
  end  

end