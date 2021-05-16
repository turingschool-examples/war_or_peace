handle = file.open(ARGV[0], "r")

incoming_text = handle.read

writer = file.open(ARGV[1],'w')

handle.write(cards.txt)

writer.close

 filename = "cards.txt"
require './lib/card_generator'
