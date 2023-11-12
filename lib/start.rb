def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are Megan and Aurora"
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"

    response = gets.chomp
    if response == "GO"
        start_game
    else puts "Wrong command. Try typing GO"
    end   
end

def start_game
    loop do
        
    end
end