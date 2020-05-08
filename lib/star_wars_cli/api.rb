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
        homeworld: person["homeworld"]
      )
    end
  end

  def self.get_all_species
    url = "https://swapi.dev/api/species/"
    response = Net::HTTP.get(URI(url))
    species = JSON.parse(response)["results"]
    species.each do |specie|
      Species.new(
        name: specie["name"],
        classification: specie["classification"],
        designation: specie["designation"],
        average_height: specie["average_height"],
        skin_colors: specie["skin_colors"],
        hair_colors: specie["hair_colors"],
        eye_colors: specie["eye_colors"],
        average_lifespan: specie["average_lifespan"],
        language: specie["language"]
      )
    end
  end

  def self.get_all_planets
    url = "https://swapi.dev/api/planets/"
    response = Net::HTTP.get(URI(url))
    planets = JSON.parse(response)["results"]
    planets.each do |planet|
      Planets.new(
        name: planet["name"],
        rotation_period: planet["rotation_period"],
        orbital_period: planet["orbital_period"],
        diameter: planet["diameter"],
        climate: planet["climate"],
        gravity: planet["gravity"],
        terrain: planet["terrain"],
        surface_water: planet["surface_water"],
        population: planet["population"]
      )
    end
  end

def self.get_all_starships
  url = "https://swapi.dev/api/starships/"
  response = Net::HTTP.get(URI(url))
  starships = JSON.parse(response)["results"]
  starships.each do |starship|
    Starship.new(
      name: starship["name"],
      model: starship["model"],
      manufacturer: starship["manufacturer"],
      cost_in_credits: starship["cost_in_credits"],
      length: starship["length"],
      max_atmosphering_speed: starship["max_atmosphering_speed"],
      crew: starship["crew"],
      passengers: starship["passengers"],
      cargo_capacity: starship["cargo_capacity"],
      consumables: starship["consumables"],
      hyperdrive_rating: starship["hyperdrive_rating"],
      starship_class: starship["starship_class"]
    )
  end
 end

 def self.get_all_vehicles
  url = "https://swapi.dev/api/vehicles/"
  response = Net::HTTP.get(URI(url))
  vehicles = JSON.parse(response)["results"]
  vehicles.each do |starship|
    Vehicle.new(
      name: starship["name"],
      model: starship["model"],
      manufacturer: starship["manufacturer"],
      cost_in_credits: starship["cost_in_credits"],
      length: starship["length"],
      max_atmosphering_speed: starship["max_atmosphering_speed"],
      crew: starship["crew"],
      passengers: starship["passengers"],
      cargo_capacity: starship["cargo_capacity"],
      consumables: starship["consumables"],
      vehicle_class: starship["vehicle_class"]
    )
  end
 end
end

##service file/class. responsible for communicating with the API.
##going out to the API and getting information and returning it.
