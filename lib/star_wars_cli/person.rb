class Person
  attr_accessor :name, :height, :mass, :hair_color, :skin_color, :eye_color, :birth_year, :gender, :planet_url, :planet, :url, :starships_urls, :starships, :vehicles_urls, :vehicles, :films_urls, :films, :species_url, :species

  @@all = []

  def initialize(name:, height:, mass:, hair_color:, skin_color:, eye_color:, birth_year:, gender:, planet_url:, url:, starships_urls:, vehicles_urls:, films_urls:, species_url:)
    @name = name
    @height = height
    @mass = mass
    @hair_color = hair_color
    @skin_color = skin_color
    @eye_color = eye_color
    @birth_year = birth_year
    @gender = gender
    @species_url = species_url
    @species = []
    @planet_url = planet_url
    @planet = nil
    @starships_urls = starships_urls
    @starships = []
    @vehicles_urls = vehicles_urls
    @vehicles = []
    @films_urls = films_urls
    @films = []
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.validate_input?(input)
    input.to_i.between?(1, self.all.length)
  end

  def self.find_by_url(url)
    self.all.find { |x| x.url == url }
  end

  def get_planet_name
    if planet = @planet
      puts "there is a planet associated"
      planet.name
    elsif planet = Planets.find_by_url(@planet_url)
      puts "planet does exist"
      @planet = planet
      planet.name
    else
      puts "planet doesnt exist"
      puts "home world is #{@planet_url}"
      planet = Api.get_specific_planet(@planet_url)
      @planet = planet
      planet.name
    end
  end

  def get_starship_name(url)
    if starship = @starships.find {|starship| starship.url == url}
        puts "found starship in starships"
        starship.name
      elsif starship = Starship.find_by_url(url)
        puts "there is a starship"
        @starships << starship
        starship.name
      else
        puts "starship does not exist and needs to be made"
        starship = Api.get_specific_starship(url)
        @starships << starship
        starship.name
    end
  end

  def get_starship_names(urls)
    if urls.length == 0
      "n/a"
    else
      names = []
      urls.each do |url|
        names << get_starship_name(url)
      end
      names
    end
  end

  def get_vehicle_name(url)
    if vehicle = @vehicles.find {|vehicle| vehicle.url == url}
        puts "found vehicle in vehicles"
        vehicle.name
      elsif vehicle = Vehicle.find_by_url(url)
        puts "there is a vehicle"
        @vehicles << vehicle
        vehicle.name
      else
        puts "vehicle does not exist and needs to be made"
        vehicle = Api.get_specific_vehicle(url)
        @vehicles << vehicle
        vehicle.name
    end
  end

  def get_vehicle_names(urls)
    if urls.length == 0
      "n/a"
    else
      names = []
      urls.each do |url|
        names << get_vehicle_name(url)
      end
      names
    end
  end

  def get_film_name(url)
    if film = @films.find {|film| film.url == url}
        puts "found film in films"
        film.title
      elsif film = Film.find_by_url(url)
        puts "there is a film"
        @films << film
        film.title
      else
        puts "film does not exist and needs to be made"
        film = Api.get_specific_film(url)
        @films << film
        film.title
    end
  end

  def get_film_names(urls)
    if urls.length == 0
      "n/a"
    else
      names = []
      urls.each do |url|
        names << get_film_name(url)
      end
      names
    end
  end

  def get_specie_name(url)
    if specie = @species.find {|specie| specie.url == url}
        puts "found specie in species"
        specie.name
      elsif specie = Species.find_by_url(url)
        puts "there is a specie"
        @species << specie
        specie.name
      else
        puts "specie does not exist and needs to be made"
        specie = Api.get_specific_species(url)
        @species << specie
        specie.name
    end
  end

  def get_specie_names(urls)
    if urls.length == 0
      "n/a"
    else
      names = []
      urls.each do |url|
        names << get_specie_name(url)
      end
      names
    end
  end
end
