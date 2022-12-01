class Game
  attr_reader :start_text

  def initialize
    
  end

  def start
    puts "Welcome to War! (or Peace).\nThis game will be played with 52 cards.\nThe players today are Megan and Aurora.\nType 'GO' to start the game!\n------------------"

    choice = gets.chomp.to_s
    if choice.downcase == 'go'
      #loop throug turns until one deck is empty and declare the winner"
      p 'do some stuff'
    else
      start
    end
  end


end



