



# require './lib/card_generator'
# filename = "cards.txt"





class Gameplay
  def start
    cards = CardGenerator.new('./cards.txt')
    cards.create_cards
    deck = Deck.new(cards)

    # binding.pry
    # deck.create_cards


    deck.cards.cards.shuffle!

    deck1 = Deck.new(deck.cards.cards[0..25])
    deck2 = Deck.new(deck.cards.cards[26..51])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)
    # binding.pry
    turn_counter = 0
    until player1.has_lost? == true || player2.has_lost? == true || turn_counter == 1000000 do


      turn_counter += 1
      # binding.pry
      if turn.type == :mutually_assured_destruction && turn.type != :basic
        turn.pile_cards
          puts "Turn #{turn_counter}: *mutually assured destruction* 6 cards removed from play"
          # sleep(0.02)
      elsif turn.type == :war
        turn.winner
        turn.pile_cards
        if turn.winner == player1
          puts "Turn #{turn_counter}: WAR - #{player1.name} won #{turn.spoils_of_war.length} cards"
        elsif turn.winner == player2
          puts "Turn #{turn_counter}: WAR - #{player2.name} won #{turn.spoils_of_war.length} cards"
        end
        turn.award_spoils
        # sleep(0.02)
      elsif turn.type == :basic && turn.type != :mutually_assured_destruction
        turn.winner
        turn.pile_cards
        if turn.winner == player1
          puts "Turn #{turn_counter}: #{player1.name} won #{turn.spoils_of_war.length} cards"
        elsif turn.winner == player2
          puts "Turn #{turn_counter}: #{player2.name} won #{turn.spoils_of_war.length} cards"
        end
        turn.award_spoils
        # sleep(0.02)
      end
    end


    if player1.has_lost?
      puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    else
      puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    end
  end
end
