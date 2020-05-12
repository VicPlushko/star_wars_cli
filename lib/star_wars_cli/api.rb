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
        species_url: person["species"],
        planet_url: person["homeworld"],
        url: person["url"],
        starships_urls: person["starships"],
        vehicles_urls: person["vehicles"],
        films_urls: person["films"]
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
        language: specie["language"],
        url: specie["url"],
      )
    end
  end

  def self.get_specific_species(url)
    response = Net::HTTP.get(URI(url.sub "http:", "https:"))
    json = JSON.parse(response)
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
        url: specie["url"],
    )
  end

  def self.get_all_planets
    url = "https://swapi.dev/api/planets/"
    response = Net::HTTP.get(URI(url))
    planets = JSON.parse(response)["results"]
    planets.each do |planet|
      puts "json url value #{planet["url"]}"
      if !Planets.find_by_url(planet["url"].sub "http:", "https:")
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
          #resident_urls: planet["residents"]
        )
      end
    end
  end

  def self.get_specific_planet(url)
    response = Net::HTTP.get(URI(url))
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
      #resident_urls: json["residents"]
    )
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
        starship_class: starship["starship_class"],
        url: starship["url"],
      )
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
      url: json["url"],
    )
  end

  def self.get_all_vehicles
    url = "https://swapi.dev/api/vehicles/"
    response = Net::HTTP.get(URI(url))
    vehicles = JSON.parse(response)["results"]
    vehicles.each do |vehicle|
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
        url: vehicle["url"],
      )
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
      url: json["url"],
    )
  end

  def self.get_all_films
    url = "https://swapi.dev/api/films/"
    response = Net::HTTP.get(URI(url))
    films = JSON.parse(response)["results"]
    films.each do |film|
      Film.new(
        title: film["title"],
        episode_id: film["episode_id"],
        opening_crawl: film["opening_crawl"],
        director: film["director"],
        producer: film["producer"],
        release_date: film["release_date"],
        characters: film["characters"],
        planets: film["planets"],
        starships: film["starships"],
        vehicles: film["vehicles"],
        species: film["species"],
        url: film["url"],
      )
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
      characters: json["characters"],
      planets: json["planets"],
      starships: json["starships"],
      vehicles: json["vehicles"],
      species: json["species"],
      url: json["url"],
    )
  end
end

##service file/class. responsible for communicating with the API.
##going out to the API and getting information and returning it.
