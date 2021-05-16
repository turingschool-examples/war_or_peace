require './lib/start'

start = Start.new
input = gets.chomp
input == 'go' || input == 'Go' || input == 'GO' ? (start.run) : (puts 'Invalid response - please try again')
