
# WHERE IS MY INFORMATION LIVING?
  # Where is the game being played?

# WHERE DO I INSTANTIATE A NEW TURN ???

# turn = Turn.new(p1, p2)

# start = Start.new(turn)
# start.method

# is this abstraction?

# need to know what class methods should be called in the interface
# the methods called should only query information
# it only returns information that is "useful"
  # what information is SEEN in the terminal?
  # the "turn number" aka "turn_n"
  # different lines for different turn.type
  # lines for if someone won OR if game ends in DRAW

  # ALL OF THE GAME MECHANIC LOGIC IS ENCAPSULATED IN THE TURN CLASS ???

# $ Turn 1: Megan won 2 cards

  # Retrieve values from turn class to print these messages?

  # Megan
    # turn.winner returns a player object
    # assign it to a variable
      # winner == turn.winner
      # should be an object
    # winner.name ??

  # won 2 cards
    # query turn.type == ___??
    # the retval is a symbol
    # look it up in a hash table
    # get a string value back
    # print it to the screen

      # OR

    # query turn.spoils_of_war.size
    # BEFORE turn.award_spoils(winner) ???
    # it will return an Integer
    # can interpolate into string
    # print it to the screen

# $ Turn 2: WAR - Aurora won 6 cards
# $ Turn 3: *mutually assured destruction* 6 cards removed from play

  # A hash table might be the call because the lookup is fast ??
  # the turn.type return value is a symbol


# loop for literally a million times?
# 10**6 == 1_000_000
# RUN until -- (player.has_lost? == true) OR (turn_n == 10**6)
# result = DRAW if (turn_10**6) AND (player.has_lost == false) OR player

# Turn 9324: Aurora won 2 cards
# *~*~*~* Aurora has won the game! *~*~*~*

# Turn 1000000: Aurora won 2 cards
# ---- DRAW ----



  # WHAT does start.rb need to do?
  # WHAT IF this is the class that passes information to the runner
  # Because then the runner only has to deal with ONE other class?
  # Does that mess up my require statements?

  # it can get information to the runner file?
  # it needs to return some values
  # is this the class that can call Turn methods ie. Turn.new?
  # does it know turn_n ?
    # who knows what?

  # Does the runner pass information to anybody?
    # it instantiates cards, decks, and players?
    # it PASSES ARGUMENTS to Class.new parameters

    # what would the runner pass to the start.rb ??

  # (LATER) the runner get.chomp to start the game?
    # any other interactions?

# possible data structure for command-line interface


# what is going on here
# next_turn = Start.new(turn)
#
# p next_turn.winner
#
# p deck1.cards.size == deck2.cards.size


# what is happening to the players' hands
# where does that happen???

# stat_hash ={  mutually_assured_destruction:
#                 "*mutually assured destruction* 6 cards removed from play",
#               war:
#                 "WAR - #{turn.winner.name} won 6 cards",
#               basic:
#                 "#{turn.winner.name} won 2 cards" }
#
# puts "Turn #{turn_n}: #{stat_hash[turn.type]}"
