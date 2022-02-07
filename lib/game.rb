#This class takes in two strings and will handle the higher level logic of the game, including creating and shuffling decks, and all visible outputs besides the opening.
class Game
    attr_reader :p1name, :p2name, :built_deck, :turn_count, :player1, :player2, :winner
    def initialize(p1name, p2name)
      @p1name = p1name
      @p2name = p2name
      @turn_count = 1
      @built_deck = []
      @player1 = nil
      @player2 = nil
      @winner = "DRAW"
    end
    #This method takes each suit, iterates over it for each rank, and creates a card in the built_deck array for it.
    def build_deck
        ranks = ["Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King", "Ace"]
        hearts_count = 0
        diamonds_count = 0
        clubs_count = 0
        spades_count = 0
            while hearts_count < 13
                built_deck.append(Card.new(:hearts, ranks[hearts_count], hearts_count + 2))
                hearts_count += 1
            end
            while diamonds_count < 13
                built_deck.append(Card.new(:diamonds, ranks[diamonds_count], diamonds_count + 2))
                diamonds_count += 1
            end
            while clubs_count < 13
                built_deck.append(Card.new(:clubs, ranks[clubs_count], clubs_count + 2))
                clubs_count += 1
            end
            while spades_count < 13
                built_deck.append(Card.new(:spades, ranks[spades_count], spades_count + 2))
                spades_count += 1
            end
        end
        #This method shuffles the built_deck twice, and creates the players using the provided strings and newly-shuffled decks.
        def assign_decks
            p1deck = Deck.new(built_deck.shuffle)
            p2deck = Deck.new(built_deck.shuffle)

            @player1 = Player.new(p1name, p1deck)
            @player2 = Player.new(p2name, p2deck)
        end
        #This method handles the higher-level game logic once the game is started.
        def start
            self.build_deck
            self.assign_decks
            # This line instatiates a new turn using the two players created above.
            turn = Turn.new(player1, player2)
            #This checks that the game hasn't gone over the valid turn count, and is guaranteed to end.
            while winner == "DRAW" && turn_count < 10001
                #This checks the turn type, and provides a text output based on the winner before resetting the turn.
                if turn.type == :basic
                    if turn.winner == player1.name
                        p "Turn #{turn_count}: #{player1.name} won 2 cards"
                    else
                        p "Turn #{turn_count}: #{player2.name} won 2 cards"
                    end
                    turn.pile_cards
                    turn.award_spoils
                elsif turn.type == :war
                    if turn.winner == player1.name
                        p "Turn #{turn_count}: WAR - #{player1.name} won 6 cards"
                    else
                        p "Turn #{turn_count}: WAR - #{player2.name} won 6 cards"
                    end
                    turn.pile_cards
                    turn.award_spoils
                elsif turn.type == :game_over
                    if player1.deck.cards.count < 3
                        p "Turn #{turn_count}: WAR - #{player1.name} doesn't have enough cards, and loses!"
                    else
                        p "Turn #{turn_count}: WAR - #{player2.name} doesn't have enough cards, and loses!"
                    end
                    turn.pile_cards
                else
                    p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
                    turn.pile_cards
                end
                #This if block checks if either player has lost after the turn's logic has played out, and either increments the turn count or assigns a player to winner.
                if player1.has_lost? == false
                   if player2.has_lost? == false
                    @turn_count += 1
                   else
                    @winner = player1.name
                   end
                else
                    @winner = player2.name
                end    
            end
            #This if block only triggers after the while statement returns false, and provides a text output based on the winner.
            if winner == "DRAW"
                p "---- DRAW ----"
            else
                p "*~*~*~* #{winner} has won the game! *~*~*~*"
            end
        end

end