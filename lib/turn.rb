
class Turn
  attr_reader :player1, :player2, :spoils_of_war, :count
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @count = 0
    # require 'pry';binding.pry
  end


  def type

    if player1.deck[0].rank == player2.deck[0].rank && player1.deck[2].rank == player2.deck[2].rank
      @count += 1
      puts 'Turn #{@count}: *mutually assured destruction* 6 cards removed from play'
      :mutually_assured_destruction
    elsif player1.deck[0].rank == player2.deck[0].rank
      @count += 1
      puts "Turn #{@count}: WAR - #{@winner} won 6 cards"
      :war
    else
      @count += 1
      puts "Turn #{@count}: #{@winner} won 2 cards"
      :basic
    end
  end


  def winner
    if type == :basic
      if player1.deck[0].rank > player2.deck[0].rank
        return player1
      else
        return player2
      end
    elsif type == :war
      if player1.deck[2].rank > player2.deck[2].rank
        return player1
      else
        return player2
      end
    else
        'No Winner'
    end
  end


  def pile_cards
    if type == :war
      @spoils_of_war << player1.deck[0..2]
      @spoils_of_war << player2.deck[0..2]
      @spoils_of_war.flatten!
    elsif type == :basic
      @spoils_of_war << player1.deck[0]
      @spoils_of_war << player2.deck[0]
      @spoils_of_war.flatten!
    else
      player1.deck.shift(3)
      player2.deck.shift(3)
    end
  end


  def spoils_of_war
    return @spoils_of_war
  end


  def award_spoils
    if type == :basic
      winner.deck << @spoils_of_war
      winner.deck.flatten!
      player1.deck.shift
      player2.deck.shift
    elsif type == :war
      winner.deck << @spoils_of_war
      winner.deck.flatten!
      player1.deck.shift(3)
      player2.deck.shift(3)
    end
    player1.deck
    player2.deck
  end

  def start
    puts "Welcome to War!(or Peace)"
    puts "This game will be played with 52 cards."
    puts "The players today are #{player1.name} and #{player2.name}."
    puts  "Type 'GO' to start the game!"
    puts '------------------------------------------------------------------'
    go = gets.chomp
    if go == 'GO'

    end
    while go != 'GO'
      puts "Oops! Type 'GO' to start the game!"
      go = gets.chomp
    end
  end
end
