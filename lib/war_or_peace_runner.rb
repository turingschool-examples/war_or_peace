# # loop to create all cards
# i = 1
# d = 0
# h = 14
# s = 26
# c = 39

# 13.times do
#     i += 1
#     d += 1
#     h += 1
#     s += 1
#     c += 1
#     puts "fresh_pack << card#{d} = Card.new(:diamond, '#{i}', #{i})".gsub("'14'", "'Ace'").gsub("'13'", "'King'").gsub("'12'", "'Queen'").gsub("'11'", "'Jack'")
#     puts "fresh_pack << card#{h} = Card.new(:heart, '#{i}', #{i})".gsub("'14'", "'Ace'").gsub("'13'", "'King'").gsub("'12'", "'Queen'").gsub("'11'", "'Jack'")
#     puts "fresh_pack << card#{s} = Card.new(:spade, '#{i}', #{i})".gsub("'14'", "'Ace'").gsub("'13'", "'King'").gsub("'12'", "'Queen'").gsub("'11'", "'Jack'")
#     puts "fresh_pack << card#{c} = Card.new(:club, '#{i}', #{i})".gsub("'14'", "'Ace'").gsub("'13'", "'King'").gsub("'12'", "'Queen'").gsub("'11'", "'Jack'")
# end

require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

Game.deal

Game.start



player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

Game.new