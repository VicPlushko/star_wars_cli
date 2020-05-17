class Film
  extend StarWarsModule::ClassMethods
  include StarWarsModule::InstanceMethods
  include GetVehiclesAndStarships
  include GetCharacters
  include GetSpecies
  attr_accessor :title, :episode_id, :opening_crawl, :director, :producer, :release_date, :characters_urls, :characters, :planets_urls, :planets, :starships_urls, :starships, :vehicles_urls, :vehicles, :species_urls, :species, :url

  @@all = []
  @@current_page = 1
  @@next_page_url = " "

  def initialize(title:, episode_id:, opening_crawl:, director:, producer:, release_date:, characters_urls:, planets_urls:, starships_urls:, vehicles_urls:, species_urls:, url:)
    @title = title
    @episode_id = episode_id
    @opening_crawl = opening_crawl
    @director = director
    @producer = producer
    @release_date = release_date
    @characters_urls = characters_urls
    @planets_urls = planets_urls
    @starships_urls = starships_urls
    @vehicles_urls = vehicles_urls
    @species_urls = species_urls
    @url = url
    @characters = []
    @planets = []
    @starships = []
    @vehicles = []
    @species = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.get_films_for_page
    self.all[get_offset..get_limit]
  end

  def get_planet_name(url)
    if planet = @planets.find { |planet| planet.url == url }
      planet.name
    elsif planet = Planets.find_by_url(url)
      @planets << planet
      planet.name
    else
      planet = Api.get_specific_planet(url)
      @planets << planet
      planet.name
    end
  end

  def get_planet_names(urls)
    if urls.length == 0
      ["n/a"]
    else
      names = []
      urls.each.with_index do |url, index|
        printf("\rDownloading Planets: %d%%", get_download_percentage(index, urls.length))
        names << get_planet_name(url)
      end
      names
    end
  end
end
