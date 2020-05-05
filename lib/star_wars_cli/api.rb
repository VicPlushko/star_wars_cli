class Api
  def self.get_all_people
    url = "https://swapi.dev/api/people/"
    response = Net::HTTP.get(URI(url))
    people = JSON.parse(response)["results"]
    people.each do |person|
      Person.new(
        name: person["name"],
        height: person["height"],
        mass: person["mass"],
        hair_color: person["hair_color"],
        skin_color: person["skin_color"],
        eye_color: person["eye_color"],
        birth_year: person["birth_year"],
        gender: person["gender"],
      )
    end
  end

  def self.get_all_species
    url = "https://swapi.dev/api/species/"
    response = Net::HTTP.get(URI(url))
    species = JSON.parse(response)["results"]
  end
end

##service file/class. responsible for communicating with the API.
##going out to the API and getting information and returning it.
