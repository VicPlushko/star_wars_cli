class Person
  attr_accessor :name, :height, :mass, :hair_color, :skin_color, :eye_color, :birth_year, :gender, :planet_url, :planet, :url, :starships_urls, :starships

  @@all = []

  def initialize(name:, height:, mass:, hair_color:, skin_color:, eye_color:, birth_year:, gender:, planet_url:, url:, starships_urls:)
    @name = name
    @height = height
    @mass = mass
    @hair_color = hair_color
    @skin_color = skin_color
    @eye_color = eye_color
    @birth_year = birth_year
    @gender = gender
    @planet_url = planet_url.sub "http:", "https:"
    @planet = nil
    @starships_urls = starships_urls
    @starships = []
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
    self.all.find { |x| x.url == url }
  end

  def get_planet_name
    if planet = @planet
      puts "there is a planet associated"
      planet.name
    elsif planet = Planets.find_by_url(@planet_url)
      puts "planet does exist"
      @planet = planet
      planet.name
    else
      puts "planet doesnt exist"
      puts "home world is #{@planet_url}"
      planet = Api.get_specific_planet(@planet_url)
      @planet = planet
      planet.name
    end
  end

  def get_starship_name(url)
    puts url
    if starships.length == 0
      puts "there are no starships"
      starship = Api.get_specific_starship(url)
      @starships << starship
      starship.name
    elsif starship = Starship.find_by_url(url)
      puts "there is a starship"
      @starships << starship
      starship.name
    else
      puts "starship does not exist and needs to be made"
      starship = Api.get_specific_starship(url)
      @starships << starship
      starship.name
    end
  end

  def get_starship_names(urls)
    names = []
    urls.each do |url|
      names << get_starship_name(url)
    end
    names
  end
end
