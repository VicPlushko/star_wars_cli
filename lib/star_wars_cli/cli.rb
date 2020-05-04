class Cli
    def run
        puts " "
        puts "Hello!! Welcome to my Star Wars app!!"
        puts Api.get_all_info
        #puts " "
        #puts "Please select the corresponding number "
        #puts " "
        #@number = gets.strip.downcase 
    end
binding.pry
    def print_names
        people.each.with_index(1) do |person, index|
            puts "#{index}. #{person.name}"
        end
    end

end

##handles input FROM user and output TO user