class Starship
  extend StarWarsModule::ClassMethods
  include StarWarsModule::InstanceMethods
  attr_accessor :name, :model, :manufacturer, :cost_in_credits, :length, :max_atmosphering_speed, :crew, :passengers, :cargo_capacity, :consumables, :hyperdrive_rating, :starship_class, :pilots_urls, :pilots, :films_urls, :films, :url

  @@all = []
  @@current_page = 1
  @@next_page_url = " "

  def initialize(name:, model:, manufacturer:, cost_in_credits:, length:, max_atmosphering_speed:, crew:, passengers:, cargo_capacity:, consumables:, hyperdrive_rating:, starship_class:, pilots_urls:, films_urls:, url:)
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
    @pilots_urls = pilots_urls
    @pilots = []
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

  def get_pilot_name(url)
    if pilot = @pilots.find { |pilot| pilot.url == url }
      pilot.name
    elsif pilot = Person.find_by_url(url)
      @pilots << pilot
      pilot.name
    else
      pilot = Api.get_specific_people(url)
      @pilots << pilot
      pilot.name
    end
  end

  def get_pilot_names(urls)
    if urls.length == 0
      ["n/a"]
    else
      names = []
      urls.each.with_index do |url, index|
        printf("\rDownloading Pilots: %d%%", get_download_percentage(index, urls.length))
        names << get_pilot_name(url)
      end
      names
    end
  end
end
