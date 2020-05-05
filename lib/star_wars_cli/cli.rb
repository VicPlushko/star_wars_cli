class Cli
  def run
    puts " "
    puts "Hello!! Welcome to my Star Wars app!!"
    puts " "
    puts " "
    puts "Would you like to learn about"
    puts " "
    puts "1.People 
2.Species 
3.Planets 
4.Starships 
5.Vehicles"
    puts " "
    puts "Please select the number that corresponds with your selection"
    @input = gets.strip
      if menu_valid_input?(@input)
         #proceed with proper list
      elsif @input == "exit"
        puts "Thank you for using my app and May The Force Be With You!!"
      else
        puts "Please make a valid selection."
      end
        
    #  Api.get_all_people
    # while @input != "exit"
    #  StarWarsController.print_people(Person.all)
    #  @input = gets.strip
    #  if Person.validate_input?(@input)
    #       StarWarsController.display_selection(@input)
    #       elsif @input == "exit"
    #         puts "Thank for using my app and May The Force Be With You!!"
    #       else
    #         puts "Please enter a valid selection"      
    #  end
    #end
   end

   def menu_valid_input?(input)
    input.to_i.between?(1, 5)
   end
end

##handles input FROM user and output TO user
