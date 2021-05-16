class Game
  attr_reader :full_deck

  def initialize(player1, player2, turn)
    @full_deck = []
    @player1 = player1
    @player2 = player2
    @turn = turn
  end

  def start
    count = 0
    until count == 1000000
      count += 1
      if @player1.deck.cards.nil? == true
        puts "#{@player1.name} wins!"
      elsif @player2.deck.cards.nil? == true
        puts "#{@player2.name} wins!"
      elsif if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
        winner_1 = @turn.winner
        @turn.pile_cards
        @turn.award_spoils(winner_1)
        puts "Turn #{count}: #{winner_1} won #{@turn.spoils_of_war.length} cards"
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
        winner_1 = @turn.winner
        @turn.pile_cards
        @turn.award_spoils(winner_1)
        puts "Turn #{count}: WAR - #{winner_1} won #{@turn.spoils_of_war.length} cards"
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        puts "Turn #{count}: *mutually assured destruction* 6 cards removed from play"
      end
    end
  end
  end

  def user_input
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    p '----------------------------------------------------------------'
    input = gets.chomp
    if input != 'GO'
      puts "Invalid input. Try again."
      user_input
    else
      start
    end
  end
end
