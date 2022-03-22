class Person
  def initialize(name_parameter)
    @name = name_parameter
  end
  def name
    @name
  end

end

person = Person.new("Jim")
puts person
puts person.name

require 'pry'; binding.pry
