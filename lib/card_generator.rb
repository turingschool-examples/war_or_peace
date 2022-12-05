class CardGenerator
    
attr_reader :file 

    def initialize(file)
        # Mr. Ruby makes what was input as the argument into CardGenerator this as a local variable: File.read('./lib/cards.txt'). 
        # I then make it an instance variable, so it's available to all methods within this instance of the object "FileGenerator"
       @file = file 
 
    end

    def create_cards
        generatedcards = []
        stringarrays = []
        (@file.split("\n")).each do |cardstring|
            stringarrays << cardstring.split(",")
        end
        # @file above is the original file that was passed into the argument of CardGenerator.new
        stringarrays.each do |a|
            (a[0], a[1] = a[1], a[0]) 
        end 
        # We have split up the text file into an arrayofstrings-- but we need Card objects. 
        stringarrays.each do |array|
            generatedcards << Card.new(array[0], array[1], array[2])
            generatedcards.shuffle!
        end
        return generatedcards
        # Above here, I've extracted the information from the text file and I'm using that string information to iterate onto Card.new class and create multiple new instances/objects of Card.new, then piling it into the generatedcards array. 
        # Then I return the generatedcards array. And it is now the variable cards in the def initialize of Start. 
        
   
        # Then I am passing the array, into the Deck class, and the Card Objects are the argument. So they are then input into the Deck class. 
    end 

end 
 