class StarWarsController
  def self.print_people(people)
    puts " "
    puts "Please select the number of a person that you would like to learn more about"
    people.each.with_index(1) do |person, index|
      puts "#{index}. #{person.name}"
    end
    puts " "
  end

  def self.display_selection(input)
    person = Person.all[input.to_i - 1]
    puts "Name: #{person.name}"
    puts "Gender: #{person.gender}"
    puts "Birth Year: #{person.birth_year}"
    puts "Height: #{person.height}"
    puts "Mass: #{person.mass}"
    puts "Hair Color: #{person.hair_color}"
    puts "Eye Color: #{person.eye_color}"
    puts "Skin Color: #{person.skin_color}"
  end
  #prompt user shoukd be a flexible method and give other instructions
  def self.prompt_user(input)
    puts " "
    puts "Would you like to make another selection, type 'yes' to make another selection or type 'exit' to exit the program"
    puts " "
  end
end
