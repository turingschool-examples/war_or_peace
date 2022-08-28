class Start
    attr_reader
    attr_accessor
   
    def start_game
        puts "Welcome to War! (or Peace) This game will be played with 52 cards."
        puts "The players today are Megan and Aurora"
        puts "Type 'GO' to start the game!"
        puts "------------------------------------------------------------------" 
    end
    
    start_game = gets.chomp
end

