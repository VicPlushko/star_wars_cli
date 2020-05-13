class Species
  attr_accessor :name, :classification, :designation, :average_height, :skin_colors, :hair_colors, :eye_colors, :average_lifespan, :language, :planet_url, :planet, :people_urls, :people, :url

  @@all = []

  def initialize(name:, classification:, designation:, average_height:, skin_colors:, hair_colors:, eye_colors:, average_lifespan:, language:, planet_url:, people_urls:, url:)
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
    @url = url.sub "http:", "https:"
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
      puts "there is a planet associated"
      planet.name
    elsif planet = Planets.find_by_url(@planet_url)
      puts "planet does exist"
      @planet = planet
      planet.name
    elsif @planet_url == nil
      "n/a"
    else
      puts "planet doesnt exist"
      puts "home world is #{@planet_url}"
      planet = Api.get_specific_planet(@planet_url)
      @planet = planet
      planet.name
    end
  end

  def get_person_name(url)
    if people.length == 0
      puts "there are no person"
      person = Api.get_specific_people(url)
      @people << person
      person.name
    elsif person = Person.find_by_url(url)
      puts "there is a person"
      @people << person
      person.name
    else
      puts "resident does not exist and needs to be made"
      person = Api.get_specific_people(url)
      @people << person
      person.name
    end
  end

  def get_people_names(urls)
    if urls.length == 0
      "N/A"
    else
      names = []
      urls.each do |url|
        names << get_person_name(url)
      end
      names
    end
  end
end