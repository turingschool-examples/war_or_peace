require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './war_or_peace_runner'

describe Game do
  before :each do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)

    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])

    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)
  end
  it 'exists' do
    war = Game.new
    expect(war).to be_an_instance_of(Game)
  end
  describe '#populate_deck' do
    it 'generates 52 cards' do
      war = Game.new
      war.populate_deck
      expect(war.all_cards.count).to eq(52)
    end
  end
  describe 'deal' do
    it 'splits all_cards into 2 decks' do
      war = Game.new
      war.populate_deck
      war.deal

      expect(war.deck1.cards.count).to eq(26)
      expect(war.deck2.cards.count).to eq(26)
      expect(war.deck1).to be_an_instance_of(Deck)
      expect(war.deck2).to be_an_instance_of(Deck)
      expect(war.all_cards.count).to eq(0)
    end
    it 'shuffles the cards' do
      war = Game.new
      war.populate_deck
      war.deal

      do_you_wanna_play_a = Game.new
      do_you_wanna_play_a.populate_deck
      do_you_wanna_play_a.deal

      expect(war.deck1 != do_you_wanna_play_a.deck1).to eq(true)
      expect(war.deck2 != do_you_wanna_play_a.deck2).to eq(true)
    end
  end
  describe '#create_players' do
    it 'Generates players with names and decks' do
      war = Game.new
      war.populate_deck
      war.deal
      war.create_players

      expect(war.player1.name).to eq('Megan')
      expect(war.player2.name).to eq('Aurora')
      expect(war.player1.deck.cards.length).to eq(26)
      expect(war.player2.deck.cards.length).to eq(26)
      expect(war.player1.deck).to be_an_instance_of(Deck)
      expect(war.player2.deck).to be_an_instance_of(Deck)
    end
  end
  describe '#next_turn?' do
    it "return false if either player has lost" do
      war = Game.new
      deck1 = Deck.new([@card1, @card2, @card5, @card8])
      deck2 = Deck.new([@card3, @card4, @card6, @card7])
      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)
      war.player1 = player1
      war.player2 = player2

      expect(war.next_turn?).to eq(true)

      deck1 = Deck.new([]) #Refactor, make losing deck? @?
      player1 = Player.new('Megan', deck1)
      war.player1 = player1
      war.player2 = player2

      expect(war.next_turn?).to eq(false)

      deck1 = Deck.new([@card1, @card2, @card5, @card8])
      deck2 = Deck.new([])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)
      war.player1 = player1
      war.player2 = player2

      expect(war.next_turn?).to eq(false)
    end
  end
  describe '#match' do
    it 'ends if turn count is 1mil or more' do
      war = Game.new
      deck1 = Deck.new([@card1, @card2, @card5, @card8])
      deck2 = Deck.new([@card3, @card4, @card6, @card7])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)
      war.player1 = player1
      war.player2 = player2

      turn_count = 1000001
      war.turn_count = turn_count

      expect(war.match).to eq(puts '----DRAW----')
    end
    it 'displays correct winning player' do
      war = Game.new
      deck1 = Deck.new([])
      deck2 = Deck.new([@card3, @card4, @card6, @card7])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)
      war.player1 = player1
      war.player2 = player2

      expect(war.match).to eq(puts "#{@player2.name} has won the game!")
      deck1 = Deck.new([])
      deck2 = Deck.new([@card3, @card4, @card6, @card7])

      player1 = Player.new('Megan', deck2)
      player2 = Player.new('Aurora', deck1) #Refactor swapped decks
      war.player1 = player1
      war.player2 = player2
      expect(war.match).to eq(puts "#{@player1.name} has won the game!")
    end
  end
end
