class Gameplay
  def start
    deck = Deck.new
    deck.create_cards
    deck.cards.shuffle!

    deck1 = Deck.new(deck.cards[0..25])
    deck2 = Deck.new(deck.cards[26..51])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)
    # binding.pry
    turn_counter = 0
    until player1.has_lost? == true || player2.has_lost? == true || turn_counter == 1000000 do

      turn_counter += 1
      turn.spoils_of_war.clear
      # binding.pry
      if turn.type == :mutually_assured_destruction && turn.type != :basic
        turn.pile_cards
        puts "kjhjbhfkhfjwefcjkhskfhkjefhkfkhsfkjsdkjhffskdksd"
      elsif turn.type == :war
        turn.winner
        turn.pile_cards
        puts "Turn #{turn_counter}: WAR - #{turn.winner.name} won #{turn.spoils_of_war.length} cards"
        turn.award_spoils
      elsif turn.type == :basic && turn.type != :mutually_assured_destruction
        turn.winner
        turn.pile_cards
        if turn.winner == player1
          puts "Turn #{turn_counter}: #{player1.name} won #{turn.spoils_of_war.length} cards"
        elsif turn.winner == player2
          puts "Turn #{turn_counter}: #{player2.name} won #{turn.spoils_of_war.length} cards"
        end
        turn.award_spoils
      end
      # turn.winner

    end
  end
end
