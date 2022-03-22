class Person
  def initialize(name)
    @name = name
  end
  def name
    @name
  end

end

person = Person.new("Jim")
puts person
puts person.name
