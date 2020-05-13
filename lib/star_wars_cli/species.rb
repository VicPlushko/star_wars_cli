class Species
  attr_accessor :name, :classification, :designation, :average_height, :skin_colors, :hair_colors, :eye_colors, :average_lifespan, :language, :planet_url, :planet, :people_urls, :people, :films_urls, :films, :url

  @@all = []

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

  def self.validate_input?(input)
    input.to_i.between?(1, self.all.length)
  end

  def self.find_by_url(url)
    self.all.find {|x| x.url == url}
  end

  def get_planet_name
    if planet = @planet
      planet.name
    elsif planet = Planets.find_by_url(@planet_url)
      @planet = planet
      planet.name
    elsif @planet_url == nil
      "n/a"
    else
      planet = Api.get_specific_planet(@planet_url)
      @planet = planet
      planet.name
    end
  end

  def get_person_name(url)
    if person = @people.find {|person| person.url == url}
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
      "n/a"
    else
      names = []
      urls.each do |url|
        names << get_person_name(url)
      end
      names
    end
  end

  def get_film_name(url)
    if film = @films.find {|film| film.url == url}
        film.title
      elsif film = Film.find_by_url(url)
        @films << film
        film.title
      else
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
end