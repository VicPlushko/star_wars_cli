class Starship
  extend StarWarsModule::ClassMethods
  include StarWarsModule::InstanceMethods
  include GetFilm
  include GetCharacters
  attr_accessor :name, :model, :manufacturer, :cost_in_credits, :length, :max_atmosphering_speed, :crew, :passengers, :cargo_capacity, :consumables, :hyperdrive_rating, :starship_class, :characters_urls, :characters, :films_urls, :films, :url

  @@all = []
  @@current_page = 1
  @@next_page_url = " "

  def initialize(name:, model:, manufacturer:, cost_in_credits:, length:, max_atmosphering_speed:, crew:, passengers:, cargo_capacity:, consumables:, hyperdrive_rating:, starship_class:, characters_urls:, films_urls:, url:)
    @name = name
    @model = model
    @manufacturer = manufacturer
    @cost_in_credits = cost_in_credits
    @length = length
    @max_atmosphering_speed = max_atmosphering_speed
    @crew = crew
    @passengers = passengers
    @cargo_capacity = cargo_capacity
    @consumables = consumables
    @hyperdrive_rating = hyperdrive_rating
    @starship_class = starship_class
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

  def self.get_starships_for_page
    self.all[get_offset..get_limit]
  end
end
