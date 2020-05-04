class Cli
    def run
        puts " "
        puts "Hello!! Welcome to my Star Wars app!!"
        puts " "
        puts Api.get_all_info
        print_people(Person.all)
        @number = gets.strip.downcase 
    end
    def print_people(people)
        puts " "
        puts "Please select a person that you would like to learn more about"
        people.each.with_index(1) do |person, index|
            puts "#{index}. #{person.name}"
        end
        puts " "
    end

end

##handles input FROM user and output TO user