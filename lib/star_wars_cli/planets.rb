class Planets
  extend StarWarsModule::ClassMethods
  include StarWarsModule::InstanceMethods
  include GetFilm
  include GetCharacters
  attr_accessor :name, :rotation_period, :orbital_period, :diameter, :climate, :gravity, :terrain, :surface_water, :population, :url, :characters_urls, :characters, :films_urls, :films, :species

  @@all = []
  @@current_page = 1
  @@next_page_url = " "

  def initialize(name:, rotation_period:, orbital_period:, diameter:, climate:, gravity:, terrain:, surface_water:, population:, url:, characters_urls:, films_urls:)
    @name = name
    @rotation_period = rotation_period
    @orbital_period = orbital_period
    @diameter = diameter
    @climate = climate
    @gravity = gravity
    @terrain = terrain
    @surface_water = surface_water
    @population = population
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

  def self.get_planets_for_page
    self.all[get_offset..get_limit]
  end
end
