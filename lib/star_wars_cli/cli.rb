class Cli
    def run
        puts " "
        puts "Hello!! Welcome to my Star Wars app!!"
        puts " "
        Api.get_all_info
        while @input != "exit"
        StarWarsController.print_people(Person.all)
        @input = gets.strip
        StarWarsController.display_selection(@input)
        StarWarsController.prompt_user(@input)
        @input = gets.strip.downcase
        end

    end
end

##handles input FROM user and output TO user