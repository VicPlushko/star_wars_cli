class Species
  extend StarWarsModule::ClassMethods
  include StarWarsModule::InstanceMethods
  include GetFilm
  include GetCharacters
  attr_accessor :name, :classification, :designation, :average_height, :skin_colors, :hair_colors, :eye_colors, :average_lifespan, :language, :planet_url, :planet, :characters_urls, :characters, :films_urls, :films, :url

  @@all = []
  @@current_page = 1
  @@next_page_url = " "

  def initialize(name:, classification:, designation:, average_height:, skin_colors:, hair_colors:, eye_colors:, average_lifespan:, language:, planet_url:, characters_urls:, films_urls:, url:)
    @name = name
    @classification = classification
    @designation = designation
    @average_height = average_height
    @skin_colors = skin_colors
    @hair_colors = hair_colors
    @eye_colors = eye_colors
    @average_lifespan = average_lifespan
    @language = language
    @planet_url = planet_url
    @planet = planet
    @characters_urls = characters_urls
    @characters = []
    @films_urls = films_urls
    @films = []
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.get_species_for_page
    self.all[get_offset..get_limit]
  end

  def get_planet_name
    if planet = @planet
      planet.name
    elsif planet = Planets.find_by_url(@planet_url)
      @planet = planet
      planet.name
    elsif @planet_url == nil
      ["n/a"]
    else
      planet = Api.get_specific_planet(@planet_url)
      @planet = planet
      planet.name
    end
  end
end
