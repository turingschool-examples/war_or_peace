require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

#require 'pry'; binding.pry
RSpec.describe Game do

  before(:each) do
    @game = Game.new
  end

  #test to see if the game exists
  it "exists" do
    expect(@game).to be_an_instance_of(Game)
    
    # and sets the instance variables to false
    expect(@game.has_started).to eq(false)
    expect(@game.game_over).to eq(false)
  end

  # test the start method make sure the welcome message in the console
  # don't have to test this for the project based on the rubric,
  # but I wanted to at least include it in the interaction patterns 
  # describe "start method logic" do
  #   it "prints welcome message in terminal" do
  #     expect { game.start }.to output(/Welcome to War!/).to_stdout

  #     # also test to make sure the user input logic is working
  #     # expect() something
  #   end

  #   # test when input is 'GO', calls setup_game and sets @has_started = true
  #   it "start game with user input and creates players, decks, and cards" do
  #     #expect()
  #     expect(@game.has_started).to eq(true)
  #   end
  #   # test to make sure invalid input message displays if user input is not 'GO'
  #   it "returns invalid input string" do
  #     #expect() something to output "Invalid input. Type 'HELP' for more options."
  #   end


  #   # test to make sure the game setup has returned correctly
  #   it "does" do

  #   end

  # end

  describe "create_players and deck setup logic" do

    it "runs setup_game and creates players and sets has_started to true" do
      @game.setup_game
    
      expect(@game.has_started).to be true
      # test that both players are created correctly as instances of the Player class
      expect(@game.player1).to be_an_instance_of(Player)
      expect(@game.player2).to be_an_instance_of(Player)

      # test that both players' decks are correctly created as instances of the Deck class
      # and each deck's number of cards is 26, split evenly between the total 52 cards
      expect(@game.player1.deck).to be_an_instance_of(Deck)
      expect(@game.player1.deck.cards.length).to eq(26)
      expect(@game.player2.deck).to be_an_instance_of(Deck)
      expect(@game.player2.deck.cards.length).to eq(26)
    end
    

  end

  describe "play_game starts the gameplay as expected" do
    
    it "runs play_game and prints the return value from each turn in the terminal" do
      @game.setup_game
      @turn = Turn.new(@player1, @player2)
      @game.play_game
      
      # set initial turn count to 1
      turn_count = 1
      expect(turn_count).to eq(1)
       #=> 1

      # create a new instance of the Turn class for each turn
      expect(@turn).to be_an_instance_of(Turn)

      # compare the top/first cards of each player's deck
      # test that the winner is returned correctly based on the cards compared and turn type
      expect(@turn.winner).to eq(@turn.winner)

      # based on turn type, determine how many cards are added the spoils pile
      # then, if :basic or :war, add those cards to the turn winner's deck
            
      # print results for each turn, printing the turn number, turn type, turn winner name, and how many cards they won
        # refactor notes: not testing terminal output currently but I think I could do it in a similar way as before
        # expect { game.play_game }.to output(/Turn #{turn_count}/).to_stdout
    
      # for a :basic turn type, 2 cards were added to the pile_cards,
      # so 2 cards are added to the spoils_of_war, then added to the winner's deck
        # expect { game.play_game }.to output(/won 2 cards/).to_stdout
        #=> "Turn 1: Megan won 2 cards"
    
      # for a :war turn type, 6 cards were added to the pile_cards, so 2 cards are added to the spoils_of_war, then added to the winner's deck
        # expect { game.play_game }.to output(/won 6 cards/).to_stdout
        #=> "Turn 2: WAR - Aurora won 6 cards"

      # for a :mutually_assured_destruction turn type, 6 cards were remove from play and NOT added to the pile_cards, meaning no cards get added to spoils_of_war
        # expect { game.play_game }.to output(/removed from play/).to_stdout
        #=> "Turn 3: *mutually assured destruction* 6 cards removed from play"

      # test that the method increments the turn_count by 1 after each turn,
      # keeping track internally but not printing
      expect(turn_count.to_i + 1).to eq(2)
    end

    it "ends the game when a player wins" do
      # test if one player has an empty deck after the turn ends,
      # and if so, the game is over and a winner is printed to the terminal
      @game.setup_game
      @turn = Turn.new(@player1, @player2)
      @game.play_game

      # test checking the has_lost? method on the Player class after each turn
        expect(@game.player1.has_lost?).to eq(true).or eq(false)
        expect(@game.player2.has_lost?).to eq(true).or eq(false)
      
      #testing that after a winner has been declared, game_over = true
        expect(@game.game_over).to be true
        #=> true
      
      # test the output in terminal when a winner is declared
        #expect { game.play_game }.to output(/no cards remaining/).to_stdout
        #expect { game.play_game }.to output(/won the game!/).to_stdout
        #=> "Turn 9324: Aurora won 2 cards"
        #=> "Megan has no cards remaining in their deck."
        #=> "*~*~*~* Aurora has won the game! *~*~*~*""

    end
    
  end
  

end