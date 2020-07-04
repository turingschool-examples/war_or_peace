# Needed a major break... concluded I can NUKE it
# Realized I should probably create the deck and shuffle in the test file
# This way, I can also practice SETUP method
# See old code waaay down below













































        # class Game
        #
        #   # Create a game with turns and a standard deck
        #   # can call upon other classes
        #   # Class cards = help with creation of cards
        #   # Class deck = help with creation of deck
        #   # Class player = help with creation of player
        #   # Class turn = help with creation of turns
        #
        #   # Hmmmm..... this isn't working...
        #   # What are the variables associated with a game
        #   # There are two players, lots of turns, a standard
        #   # deck, each players deck, etc...
        #   # Well... turns are dealt with as a class
        #   # the decks are also a class
        #   # players are a class...
        #   # so what does the Game Class actually need
        #   # Okay.. after researching what initialize does
        #   # figured out I don't want to initialize turn with a new instance of game
        #   # because we need the turns to apply to the game
        #   # Don't need to initialize a deck, same reason
        #   # I probably need to initialize two players
        #
        #
        #   # attr_accessor :turn, :standard_deck
        #   # def initialize(turn, standard_deck)
        #   #   @turn = turn
        #   #   @standard_deck = standard_deck
        #   # end
        #
        #   attr_accessor :player_1, :player_2, :deck_holder
        #
        #   def initialize(player_1, player_2)
        #     @player_1 = player_1
        #     @player_2 = player_2
        #     @deck_holder = []
        #   end
        #
        #   def standard_deck
        #     # Hmmm... how do I create a deck
        #     # I'm gonna want to use .times (or similar)
        #     # I can try and create a section for each suit
        #     # the integer cards can be .times
        #     # might have to create the royals (is there an easier way??)
        #     # RESEARCH!!
        #     # Let's also look at my own deck.rb file
        #     # My deck file doesn't harm or help my standard_deck method
        #     # Research tells me I can use .each
        #     # Read through deck building for ruby on Stack Overflow
        #     # Found something worth testing or trying
        #     # changed it and annoted it to match my files
        #     # testing
        #
        #     # created accumulator to hold array of cards created
        #     # created array of ranks
        #     # %w is a shortcut for for writing an array of strings seperated by space vs comma
        #     ranks = %w{Two Three Four Five Six Seven Eight Nine Ten Jack Queen King Ace}
        #     # created array of suits
        #     suits = %w{Clubs, Diamonds, Hearts, Spades}
        #     # called array suits and applied .each (block variable = suit)
        #     # .each will iterate through each suit
        #     suits.each do |suit|
        #       # called array ranks
        #       # .size returns the number of elements in the array
        #       # In this case the .size = 13
        #       # .times will repeat
        #       # So in combination, .size.times will now do this 13 times
        #       # Or, one for every element in the array!
        #       # block variable is integer (so will start at 0)
        #       ranks.size.times do |i|
        #         # my array will get added to by calling an instance of the Card Class
        #         # New card created from suits array, ranks array, and then adding two to the index value of the integer from do block
        #         deck_holder << Card.new(suit, ranks[i], i+2)
        #       end
        #     end
        #     deck_holder
        #   end
        #
        #   # Looking ahead at iteration 4... I'm unsure about the hard coded deck
        #   # I don't think mine is a hard-coded deck
        #   # Should I be adding that in?
        #   # Let's first get the game running before I research fully attaching
        #   # text file and how that might affect my standard_deck method
        #
        #   # How to randomize two decks?
        #   # Found .shuffle in Ruby Docs!!
        #
        #   # def shuffle
        #   #   deck_1 = []
        #   #   deck_2 = []
        #   #   standard_deck
        #   #   deck_holder.shuffle
        #   #   deck_1 << deck_holder[0..25]
        #   #   deck_2 << deck_holder[26..51]
        #   # end
        #
        #
        # end
