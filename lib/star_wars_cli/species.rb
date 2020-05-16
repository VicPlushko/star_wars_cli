class Species
  extend StarWarsModule::ClassMethods
  include StarWarsModule::InstanceMethods
  include GetFilm
  attr_accessor :name, :classification, :designation, :average_height, :skin_colors, :hair_colors, :eye_colors, :average_lifespan, :language, :planet_url, :planet, :people_urls, :people, :films_urls, :films, :url

  @@all = []
  @@current_page = 1
  @@next_page_url = " "

  def initialize(name:, classification:, designation:, average_height:, skin_colors:, hair_colors:, eye_colors:, average_lifespan:, language:, planet_url:, people_urls:, films_urls:, url:)
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
    @people_urls = people_urls
    @people = []
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

  def get_person_name(url)
    if person = @people.find { |person| person.url == url }
      person.name
    elsif person = Person.find_by_url(url)
      @people << person
      person.name
    else
      person = Api.get_specific_people(url)
      @people << person
      person.name
    end
  end

  def get_people_names(urls)
    if urls.length == 0
      ["n/a"]
    else
      names = []
      urls.each.with_index do |url, index|
        printf("\rDownloading People: %d%%", get_download_percentage(index, urls.length))
        names << get_person_name(url)
      end
      names
    end
  end
end
