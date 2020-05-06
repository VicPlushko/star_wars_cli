class Cli
  def run
    puts " "
    puts "Hello!! Welcome to my Star Wars app!!"
    puts " "
    while @input != "exit"
      puts "--- inside main loop"
      show_menu
      @input = gets.strip

      if menu_valid_input?(@input)
        handle_user_input(@input)
      end
      if @input == "exit"
        puts "Thanks for using my app, bye!!"
        exit
      else
        puts "input is else"
        puts "Pleae make a valid selection"
      end
    end
  end

  def handle_user_input(input)
    case input
    when "1"
      puts "selected people"
      display_people_list
    when "2"
      puts "Not ready for this yet"
    when "3"
      puts "Not ready for this yet"
    when "4"
      puts "Not ready for this yet"
    when "5"
      puts "Not ready for this yet"
    end
  end

  def show_menu
    puts "inside menu"
    puts " "
    puts "Would you like to learn about"
    puts " "
    puts "1.People"
    puts "2.Species"
    puts "3.Planets"
    puts "4.Starships"
    puts "5.Vehicles"
    puts " "
    puts "Please select the number that corresponds with your selection"
  end

  def display_people_list
    puts "inside people "
    if Person.all.length == 0 # this is only a valid comparison when calling for first page
      Api.get_all_people
    end
    while @input != "exit" && @input != "menu"
      puts "inside people loop"
      StarWarsController.print_people(Person.all)
      @input = gets.strip
      if Person.validate_input?(@input)
        puts "people input valid"
        StarWarsController.display_selection(@input)
        prompt_user
        @input = gets.strip.downcase
        if @input != "yes" || @input != "menu"
          puts "invalid input"
          prompt_user
          @input = gets.strip.downcase
        end
      elsif @input == "exit"
        puts "people input exit"
        puts "Thank for using my app and May The Force Be With You!!"
        exit
      elsif @input == "menu"
        #puts "people input exit"
        #puts "Thank for using my app and May The Force Be With You!!"
      else
        puts "people input is else"
        puts "Please enter a valid selection"
      end
    end
  end


  def prompt_user
    puts "prompt user again"
    puts " "
    puts "Would you like to make another selection, type 'yes' to make another selection, type 'menu' to go back and choose another topic or type 'exit' to exit."
    puts " "
  end

  def menu_valid_input?(input)
    input.to_i.between?(1, 5)
  end
end

##handles input FROM user and output TO user
