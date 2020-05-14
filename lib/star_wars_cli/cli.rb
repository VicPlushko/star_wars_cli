class Cli
  def run
    puts " "
    puts "Hello!! Welcome to my Star Wars app!!"
    puts " "
    while @input != "exit"
      show_menu
      @input = gets.strip
      if menu_valid_input?(@input)
        handle_user_input(@input)
      end
      if @input == "exit"
        puts "Thank you for using my app and May The Force Be With You!!"
        exit
      else
        puts "input is else"
        puts "Please make a valid selection"
      end
    end
  end

  def handle_user_input(input)
    case input
    when "1"
      puts "selected people"
      display_people_list
    when "2"
      puts "selected species"
      display_species_list
    when "3"
      puts "selected planets"
      display_planets_list
    when "4"
      puts "selected starships"
      display_starships_list
    when "5"
      puts "selected vehicles"
      display_vehicles_list
    when "6"
      puts "selected films"
      display_films_list
    end
  end

  def show_menu
    puts " "
    puts "Would you like to learn about"
    puts " "
    puts "1.People"
    puts "2.Species"
    puts "3.Planets"
    puts "4.Starships"
    puts "5.Vehicles"
    puts "6.Films"
    puts " "
    puts "Please select the number that corresponds with your selection"
  end

  def display_people_list
      Api.get_all_people
    while @input != "exit" && @input != "menu"
      puts Person.current_page
      #update print_people based on current page vs hard coded array
      StarWarsController.print_people(Person.all[0..9])
      @input = gets.strip.downcase
      if Person.validate_input?(@input)
        StarWarsController.display_people_selection(@input)
        prompt_user
        @input = gets.strip.downcase
        if @input != "yes" && @input != "menu" && @input != "exit"
          prompt_user
          @input = gets.strip.downcase
        end
      elsif @input == "next"
        Person.next_page
        puts Person.next_page
        #make api call to get next page
        puts "moving to the next page #{Person.current_page}"
      elsif @input == "exit"
        puts "Thank you for using my app and May The Force Be With You!!"
        exit
      else
        puts "Please enter a valid selection"
      end
    end
  end

  def display_species_list
      Api.get_all_species
    while @input != "exit" && @input != "menu"
      StarWarsController.print_species(Species.all[0..9])
      @input = gets.strip.downcase
      if Species.validate_input?(@input)
        StarWarsController.display_species_selection(@input)
        prompt_user
        @input = gets.strip.downcase
        if @input != "yes" && @input != "menu" && @input != "exit"
          prompt_user
          @input = gets.strip.downcase
        end
      elsif @input == "exit"
        puts "Thank you for using my app and May The Force Be With You!!"
        exit
      else
        puts "Please enter a valid selection"
      end
    end
  end

  def display_planets_list
      Api.get_all_planets
    while @input != "exit" && @input != "menu"
      StarWarsController.print_planets(Planets.all[0..9])
      @input = gets.strip.downcase
      if Planets.validate_input?(@input)
        StarWarsController.display_planets_selection(@input)
        prompt_user
        @input = gets.strip.downcase
        if @input != "yes" && @input != "menu" && @input != "exit"
          prompt_user
          @input = gets.strip.downcase
        end
      elsif @input == "exit"
        puts "Thank you for using my app and May The Force Be With You!!"
        exit
      else
        puts "Please enter a valid selection"
      end
    end
  end

  def display_starships_list
      Api.get_all_starships
    while @input != "exit" && @input != "menu"
      StarWarsController.print_starships(Starship.all[0..9])
      @input = gets.strip.downcase
      if Starship.validate_input?(@input)
        StarWarsController.display_starships_selection(@input)
        prompt_user
        @input = gets.strip.downcase
        if @input != "yes" && @input != "menu" && @input != "exit"
          prompt_user
          @input = gets.strip.downcase
        end
      elsif @input == "exit"
        puts "Thank you for using my app and May The Force Be With You!!"
        exit
      else
        puts "Please enter a valid selection"
      end
    end
  end

  def display_vehicles_list
      Api.get_all_vehicles
    while @input != "exit" && @input != "menu"
      StarWarsController.print_vehicles(Vehicle.all[0..9])
      @input = gets.strip.downcase
      if Vehicle.validate_input?(@input)
        StarWarsController.display_vehicles_selection(@input)
        prompt_user
        @input = gets.strip.downcase
        if @input != "yes" && @input != "menu" && @input != "exit"
          prompt_user
          @input = gets.strip.downcase
        end
      elsif @input == "exit"
        puts "Thank you for using my app and May The Force Be With You!!"
        exit
      else
        puts "Please enter a valid selection"
      end
    end
  end

  def display_films_list
      Api.get_all_films
    while @input != "exit" && @input != "menu"
      StarWarsController.print_films(Film.all)
      @input = gets.strip.downcase
      if Film.validate_input?(@input)
        StarWarsController.display_film_selection(@input)
        prompt_user
        @input = gets.strip.downcase
        if @input != "yes" && @input != "menu" && @input != "exit"
          prompt_user
          @input = gets.strip.downcase
        end
      elsif @input == "exit"
        puts "Thank you for using my app and May The Force Be With You!!"
        exit
      else
        puts "Please enter a valid selection"
      end
    end
  end


  def prompt_user
     puts " "
    puts "Would you like to make another selection, type 'yes' to make another selection, type 'menu' to go back and choose another topic or type 'exit' to exit."
    puts " "
  end

  def menu_valid_input?(input)
    input.to_i.between?(1, 6)
  end

end

##handles input FROM user and output TO user
