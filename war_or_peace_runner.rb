class Start
    attr_reader
    attr_accessor
   
    start = puts "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are Megan and Aurora.
    Type 'GO' to start the game!
    ------------------------------------------------------------------" 
    start = gets.chomp
        if start == 'GO'
            puts "Ok, let's boogie!"
        elsif start != 'GO'
            puts "I didn't understand your response. Please try again, capitilization counts!"
    end
end 

