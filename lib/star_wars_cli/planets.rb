class Planets
  extend StarWarsModule::ClassMethods
  include StarWarsModule::InstanceMethods
  include GetFilm
  attr_accessor :name, :rotation_period, :orbital_period, :diameter, :climate, :gravity, :terrain, :surface_water, :population, :url, :residents_urls, :residents, :films_urls, :films, :species

  @@all = []
  @@current_page = 1
  @@next_page_url = " "

  def initialize(name:, rotation_period:, orbital_period:, diameter:, climate:, gravity:, terrain:, surface_water:, population:, url:, residents_urls:, films_urls:)
    @name = name
    @rotation_period = rotation_period
    @orbital_period = orbital_period
    @diameter = diameter
    @climate = climate
    @gravity = gravity
    @terrain = terrain
    @surface_water = surface_water
    @population = population
    @residents_urls = residents_urls
    @residents = []
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

  def get_resident_name(url)
    if resident = @residents.find { |resident| resident.url == url }
      resident.name
    elsif resident = Person.find_by_url(url)
      @residents << resident
      resident.name
    else
      resident = Api.get_specific_people(url)
      @residents << resident
      resident.name
    end
  end

  def get_resident_names(urls)
    if urls.length == 0
      ["n/a"]
    else
      names = []
      urls.each.with_index do |url, index|
        printf("\rDownloading Residents: %d%%", get_download_percentage(index, urls.length))
        names << get_resident_name(url)
      end
      names
    end
  end
end
