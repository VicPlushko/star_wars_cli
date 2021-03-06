class Api
  def self.get_all_people(url = "https://swapi.dev/api/people/")
    response = Net::HTTP.get(URI(url.sub "http:", "https:"))
    people = JSON.parse(response)["results"]
    Person.set_next_page_url(JSON.parse(response)["next"])
    people.each do |person|
      if !Person.find_by_url(person["url"])
        Person.new(
          name: person["name"],
          height: person["height"],
          mass: person["mass"],
          hair_color: person["hair_color"],
          skin_color: person["skin_color"],
          eye_color: person["eye_color"],
          birth_year: person["birth_year"],
          gender: person["gender"],
          species_url: person["species"],
          planet_url: person["homeworld"],
          url: person["url"],
          starships_urls: person["starships"],
          vehicles_urls: person["vehicles"],
          films_urls: person["films"],
        )
      end
    end
  end

  def self.get_specific_people(url)
    response = Net::HTTP.get(URI(url.sub "http:", "https:"))
    json = JSON.parse(response)
    Person.new(
      name: json["name"],
      height: json["height"],
      mass: json["mass"],
      hair_color: json["hair_color"],
      skin_color: json["skin_color"],
      eye_color: json["eye_color"],
      birth_year: json["birth_year"],
      gender: json["gender"],
      species_url: json["species"],
      planet_url: json["homeworld"],
      url: json["url"],
      starships_urls: json["starships"],
      vehicles_urls: json["vehicles"],
      films_urls: json["films"],
    )
  end

  def self.get_all_species(url = "https://swapi.dev/api/species/")
    response = Net::HTTP.get(URI(url.sub "http:", "https:"))
    species = JSON.parse(response)["results"]
    Species.set_next_page_url(JSON.parse(response)["next"])
    species.each do |specie|
      if !Species.find_by_url(specie["url"])
        Species.new(
          name: specie["name"],
          classification: specie["classification"],
          designation: specie["designation"],
          average_height: specie["average_height"],
          skin_colors: specie["skin_colors"],
          hair_colors: specie["hair_colors"],
          eye_colors: specie["eye_colors"],
          average_lifespan: specie["average_lifespan"],
          language: specie["language"],
          planet_url: specie["homeworld"],
          characters_urls: specie["people"],
          films_urls: specie["films"],
          url: specie["url"],
        )
      end
    end
  end

  def self.get_specific_species(url)
    response = Net::HTTP.get(URI(url.sub "http:", "https:"))
    json = JSON.parse(response)
    Species.new(
      name: json["name"],
      classification: json["classification"],
      designation: json["designation"],
      average_height: json["average_height"],
      skin_colors: json["skin_colors"],
      hair_colors: json["hair_colors"],
      eye_colors: json["eye_colors"],
      average_lifespan: json["average_lifespan"],
      language: json["language"],
      planet_url: json["homeworld"],
      characters_urls: json["people"],
      films_urls: json["films"],
      url: json["url"],
    )
  end

  def self.get_all_planets(url = "https://swapi.dev/api/planets/")
    response = Net::HTTP.get(URI(url.sub "http:", "https:"))
    planets = JSON.parse(response)["results"]
    Planets.set_next_page_url(JSON.parse(response)["next"])
    planets.each do |planet|
      if !Planets.find_by_url(planet["url"])
        Planets.new(
          name: planet["name"],
          rotation_period: planet["rotation_period"],
          orbital_period: planet["orbital_period"],
          diameter: planet["diameter"],
          climate: planet["climate"],
          gravity: planet["gravity"],
          terrain: planet["terrain"],
          surface_water: planet["surface_water"],
          population: planet["population"],
          url: planet["url"],
          characters_urls: planet["residents"],
          films_urls: planet["films"],
        )
      end
    end
  end

  def self.get_specific_planet(url)
    response = Net::HTTP.get(URI(url.sub "http:", "https:"))
    json = JSON.parse(response)
    Planets.new(
      name: json["name"],
      rotation_period: json["rotation_period"],
      orbital_period: json["orbital_period"],
      diameter: json["diameter"],
      climate: json["climate"],
      gravity: json["gravity"],
      terrain: json["terrain"],
      surface_water: json["surface_water"],
      population: json["population"],
      url: json["url"],
      characters_urls: json["residents"],
      films_urls: json["films"],
    )
  end

  def self.get_all_starships(url = "https://swapi.dev/api/starships/")
    response = Net::HTTP.get(URI(url.sub "http:", "https:"))
    starships = JSON.parse(response)["results"]
    Starship.set_next_page_url(JSON.parse(response)["next"])
    starships.each do |starship|
      if !Starship.find_by_url(starship["url"])
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
          starship_class: starship["starship_class"],
          characters_urls: starship["pilots"],
          films_urls: starship["films"],
          url: starship["url"],
        )
      end
    end
  end

  def self.get_specific_starship(url)
    response = Net::HTTP.get(URI(url.sub "http:", "https:"))
    json = JSON.parse(response)
    Starship.new(
      name: json["name"],
      model: json["model"],
      manufacturer: json["manufacturer"],
      cost_in_credits: json["cost_in_credits"],
      length: json["length"],
      max_atmosphering_speed: json["max_atmosphering_speed"],
      crew: json["crew"],
      passengers: json["passengers"],
      cargo_capacity: json["cargo_capacity"],
      consumables: json["consumables"],
      hyperdrive_rating: json["hyperdrive_rating"],
      starship_class: json["starship_class"],
      characters_urls: json["pilots"],
      films_urls: json["films"],
      url: json["url"],
    )
  end

  def self.get_all_vehicles(url = "https://swapi.dev/api/vehicles/")
    response = Net::HTTP.get(URI(url.sub "http:", "https:"))
    vehicles = JSON.parse(response)["results"]
    Vehicle.set_next_page_url(JSON.parse(response)["next"])
    vehicles.each do |vehicle|
      if !Vehicle.find_by_url(vehicle["url"])
        Vehicle.new(
          name: vehicle["name"],
          model: vehicle["model"],
          manufacturer: vehicle["manufacturer"],
          cost_in_credits: vehicle["cost_in_credits"],
          length: vehicle["length"],
          max_atmosphering_speed: vehicle["max_atmosphering_speed"],
          crew: vehicle["crew"],
          passengers: vehicle["passengers"],
          cargo_capacity: vehicle["cargo_capacity"],
          consumables: vehicle["consumables"],
          vehicle_class: vehicle["vehicle_class"],
          characters_urls: vehicle["pilots"],
          films_urls: vehicle["films"],
          url: vehicle["url"],
        )
      end
    end
  end

  def self.get_specific_vehicle(url)
    response = Net::HTTP.get(URI(url.sub "http:", "https:"))
    json = JSON.parse(response)
    Vehicle.new(
      name: json["name"],
      model: json["model"],
      manufacturer: json["manufacturer"],
      cost_in_credits: json["cost_in_credits"],
      length: json["length"],
      max_atmosphering_speed: json["max_atmosphering_speed"],
      crew: json["crew"],
      passengers: json["passengers"],
      cargo_capacity: json["cargo_capacity"],
      consumables: json["consumables"],
      vehicle_class: json["vehicle_class"],
      characters_urls: json["pilots"],
      films_urls: json["films"],
      url: json["url"],
    )
  end

  def self.get_all_films(url = "https://swapi.dev/api/films/")
    response = Net::HTTP.get(URI(url.sub "http:", "https:"))
    films = JSON.parse(response)["results"]
    Film.set_next_page_url(JSON.parse(response)["next"])
    films.each do |film|
      if !Film.find_by_url(film["url"])
        Film.new(
          title: film["title"],
          episode_id: film["episode_id"],
          opening_crawl: film["opening_crawl"],
          director: film["director"],
          producer: film["producer"],
          release_date: film["release_date"],
          characters_urls: film["characters"],
          planets_urls: film["planets"],
          starships_urls: film["starships"],
          vehicles_urls: film["vehicles"],
          species_urls: film["species"],
          url: film["url"],
        )
      end
    end
  end

  def self.get_specific_film(url)
    response = Net::HTTP.get(URI(url.sub "http:", "https:"))
    json = JSON.parse(response)
    Film.new(
      title: json["title"],
      episode_id: json["episode_id"],
      opening_crawl: json["opening_crawl"],
      director: json["director"],
      producer: json["producer"],
      release_date: json["release_date"],
      characters_urls: json["characters"],
      planets_urls: json["planets"],
      starships_urls: json["starships"],
      vehicles_urls: json["vehicles"],
      species_urls: json["species"],
      url: json["url"],
    )
  end
end

##service file/class. responsible for communicating with the API.
##going out to the API and getting information and returning it.
