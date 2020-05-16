class StarWarsController
  def self.print_people(people)
    puts " "
    puts "Please select the number of a person that you would like to learn more about"
    if Person.next_page_url != nil
      puts "Type 'next' to go to the next page"
    end
    if Person.current_page > 1
      puts "Type 'previous' to go to the previous page"
    end
    people.each.with_index(Person.get_offset + 1) do |person, index|
      puts "#{index}. #{person.name}"
    end
    puts " "
  end

  def self.print_species(species)
    puts " "
    puts "Please select the number of a species that you would like to learn more about"
    if Species.next_page_url != nil
      puts "Type 'next' to go to the next page"
    end
    if Species.current_page > 1
      puts "Type 'previous' to go to the previous page"
    end
    species.each.with_index(Species.get_offset + 1) do |specie, index|
      puts "#{index}. #{specie.name}"
    end
    puts " "
  end

  def self.print_planets(planets)
    puts " "
    puts "Please select the number of a planet that you would like to learn more about"
    if Planets.next_page_url != nil
      puts "Type 'next' to go to the next page"
    end
    if Planets.current_page > 1
      puts "Type 'previous' to go to the previous page"
    end
    planets.each.with_index(Planets.get_offset + 1) do |planet, index|
      puts "#{index}. #{planet.name}"
    end
    puts " "
  end

  def self.print_starships(starships)
    puts " "
    puts "Please select the number of a starship that you would like to learn more about"
    if Starship.next_page_url != nil
      puts "Type 'next' to go to the next page"
    end
    if Starship.current_page > 1
      puts "Type 'previous' to go to the previous page"
    end
    starships.each.with_index(Starship.get_offset + 1) do |starship, index|
      puts "#{index}. #{starship.name}"
    end
    puts " "
  end

  def self.print_vehicles(vehicles)
    puts " "
    puts "Please select the number of a vehicle that you would like to learn more about"
    if Vehicle.next_page_url != nil
      puts "Type 'next' to go to the next page"
    end
    if Vehicle.current_page > 1
      puts "Type 'previous' to go to the previous page"
    end
    vehicles.each.with_index(Vehicle.get_offset + 1) do |vehicle, index|
      puts "#{index}. #{vehicle.name}"
    end
    puts " "
  end

  def self.print_films(films)
    puts " "
    puts "Please select the number of a film that you would like to learn more about"
    if Film.next_page_url != nil
      puts "Type 'next' to go to the next page"
    end
    if Film.current_page > 1
      puts "Type 'previous' to go to the previous page"
    end
    films.each.with_index(Film.get_offset + 1) do |film, index|
      puts "#{index}. #{film.title}"
    end
    puts " "
  end

  def self.clear_and_format(title, array)
    "\r\033[K" + title + ": " + array.join(", \n\t")
  end

  def self.display_people_selection(input)
    person = Person.all[input.to_i - 1]
    puts "Name: #{person.name}"
    puts "Gender: #{person.gender}"
    puts "Birth Year: #{person.birth_year}"
    puts "Height: #{person.height}"
    puts "Mass: #{person.mass}"
    puts "Hair Color: #{person.hair_color}"
    puts "Eye Color: #{person.eye_color}"
    puts "Skin Color: #{person.skin_color}"
    puts clear_and_format("Species", person.get_specie_names(person.species_url))
    puts "Homeworld: #{person.get_planet_name}"
    puts " "
    puts clear_and_format("Starships", person.get_starship_names(person.starships_urls))
    puts " "
    puts clear_and_format("Vehicles", person.get_vehicle_names(person.vehicles_urls))
    puts " "
    puts clear_and_format("Films", person.get_film_names(person.films_urls))
  end

 

  def self.display_species_selection(input)
    species = Species.all[input.to_i - 1]
    puts "Name: #{species.name}"
    puts "Classification: #{species.classification}"
    puts "Designation: #{species.designation}"
    puts "Average Height: #{species.average_height}"
    puts "Skin Colors: #{species.skin_colors}"
    puts "Hair Colors: #{species.hair_colors}"
    puts "Eye Colors: #{species.eye_colors}"
    puts "Average Lifespan: #{species.average_lifespan}"
    puts "Language: #{species.language}"
    puts "Homeworld: #{species.get_planet_name}"
    puts " "
    puts clear_and_format("People", species.get_people_names(species.people_urls))
    puts " "
    puts clear_and_format("Films", species.get_film_names(species.films_urls))
  end

  def self.display_planets_selection(input)
    planets = Planets.all[input.to_i - 1]
    puts "Name: #{planets.name}"
    puts "Rotation Period: #{planets.rotation_period}"
    puts "Orbital Period: #{planets.orbital_period}"
    puts "Diameter: #{planets.diameter}"
    puts "Climate: #{planets.climate}"
    puts "Gravity: #{planets.gravity}"
    puts "Terrain: #{planets.terrain}"
    puts "Surface Water: #{planets.surface_water}"
    puts "Population: #{planets.population}"
    puts " "
    puts clear_and_format("Residents", planets.get_resident_names(planets.residents_urls))
    puts " "
    puts clear_and_format("Films", planets.get_film_names(planets.films_urls))
  end

  def self.display_starships_selection(input)
    starship = Starship.all[input.to_i - 1]
    puts "Name: #{starship.name}"
    puts "Model: #{starship.model}"
    puts "Manufacturer: #{starship.manufacturer}"
    puts "Cost In Credits: #{starship.cost_in_credits}"
    puts "Length: #{starship.length}"
    puts "Max Atmosphering speed: #{starship.max_atmosphering_speed}"
    puts "Crew: #{starship.crew}"
    puts "Passengers: #{starship.passengers}"
    puts "Cargo Capacity: #{starship.cargo_capacity}"
    puts "Consumables: #{starship.consumables}"
    puts "Hyperdrive Rating: #{starship.hyperdrive_rating}"
    puts "Starship Class: #{starship.starship_class}"
    puts " "
    puts clear_and_format("Pilots", starship.get_pilot_names(starship.pilots_urls))
    puts " "
    puts clear_and_format("Films", starship.get_film_names(starship.films_urls))
  end

  def self.display_vehicles_selection(input)
    vehicle = Vehicle.all[input.to_i - 1]
    puts "Name: #{vehicle.name}"
    puts "Model: #{vehicle.model}"
    puts "Manufacturer: #{vehicle.manufacturer}"
    puts "Cost In Credits: #{vehicle.cost_in_credits}"
    puts "Length: #{vehicle.length}"
    puts "Max Atmosphering speed: #{vehicle.max_atmosphering_speed}"
    puts "Crew: #{vehicle.crew}"
    puts "Passengers: #{vehicle.passengers}"
    puts "Cargo Capacity: #{vehicle.cargo_capacity}"
    puts "Consumables: #{vehicle.consumables}"
    puts "Vehicle Class: #{vehicle.vehicle_class}"
    puts " "
    puts clear_and_format("Pilots", vehicle.get_pilot_names(vehicle.pilots_urls))
    puts " "
    puts clear_and_format("Films", vehicle.get_film_names(vehicle.films_urls))
  end

  def self.display_film_selection(input)
    films = Film.all[input.to_i - 1]
    puts "Title: #{films.title}"
    puts "Epsisode Number: #{films.episode_id}"
    puts "Opening Crawl: #{films.opening_crawl}"
    puts " "
    puts "Director: #{films.director}"
    puts "Producer: #{films.producer}"
    puts "Release Date: #{films.release_date}"
    puts " "
    puts clear_and_format("Characters", films.get_character_names(films.characters_urls))
    puts " "
    puts clear_and_format("Planets", films.get_planet_names(films.planets_urls))
    puts " "
    puts clear_and_format("Starships", films.get_starship_names(films.starships_urls))
    puts " "
    puts clear_and_format("Vehicles", films.get_vehicle_names(films.vehicles_urls))
    puts " "
    puts clear_and_format("Species", films.get_species_names(films.species_urls))
  end
end
