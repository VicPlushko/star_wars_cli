class Person
  extend StarWarsModule::ClassMethods
  include StarWarsModule::InstanceMethods
  include GetFilm
  include GetVehiclesAndStarships
  attr_accessor :name, :height, :mass, :hair_color, :skin_color, :eye_color, :birth_year, :gender, :planet_url, :planet, :url, :starships_urls, :starships, :vehicles_urls, :vehicles, :films_urls, :films, :species_url, :species

  @@all = []
  @@current_page = 1
  @@next_page_url = " "

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

  def self.get_people_for_page
    self.all[get_offset..get_limit]
  end

  def get_planet_name
    if planet = @planet
      planet.name
    elsif planet = Planets.find_by_url(@planet_url)
      @planet = planet
      planet.name
    else
      planet = Api.get_specific_planet(@planet_url)
      @planet = planet
      planet.name
    end
  end

  def get_specie_name(url)
    if specie = @species.find { |specie| specie.url == url }
      specie.name
    elsif specie = Species.find_by_url(url)
      @species << specie
      specie.name
    else
      specie = Api.get_specific_species(url)
      @species << specie
      specie.name
    end
  end

  def get_specie_names(urls)
    if urls.length == 0
      ["n/a"]
    else
      names = []
      urls.each.with_index do |url, index|
        printf("\rDownloading Species: %d%%", get_download_percentage(index, urls.length))
        names << get_specie_name(url)
      end
      names
    end
  end
end
