class Api
    def self.get_all_info
        url = "https://swapi.dev/api/people/"
        responce = Net::HTTP.get(URI(url))
        people = JSON.parse(responce)["results"]
        binding.pry
        ##how do I make person, ship, or planet objects 
    end   
end


##service file/class. responsible for communicating with the API.
##going out to the API and getting information and returning it.