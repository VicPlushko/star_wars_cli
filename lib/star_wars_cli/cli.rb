class Cli
    def run
        puts " "
        puts "Hello!! Welcome to my Star Wars app!!"
        puts " "
        Api.get_all_info
        StarWarsController.print_people(Person.all)
        input = gets.strip
        StarWarsController.display_selection(input)
        puts " "
        puts "Would you like to see information about someone else or see more selections?"
        puts " "
    end
end

##handles input FROM user and output TO user