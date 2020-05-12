class Person
  attr_accessor :name, :height, :mass, :hair_color, :skin_color, :eye_color, :birth_year, :gender, :homeworld, :planet, :url

  @@all = []

  def initialize(name:, height:, mass:, hair_color:, skin_color:, eye_color:, birth_year:, gender:, homeworld:, url:)
    @name = name
    @height = height
    @mass = mass
    @hair_color = hair_color
    @skin_color = skin_color
    @eye_color = eye_color
    @birth_year = birth_year
    @gender = gender
    @homeworld = homeworld.sub 'http:', 'https:'
    @planet = nil
    @url = url.sub 'http:', 'https:'
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
      
    elsif planet = Planets.find_by_url(@homeworld)
      puts "planet does exist"
      @planet = planet
      planet.name
    else
     puts "planet doesnt exist"
     puts "home world is #{@homeworld}"
     planet = Api.get_specific_planet(@homeworld)
     @planet = planet
     planet.name
    end
  end
    if planet = @planet
      puts "there is a planet associated"
      planet.name
      
    elsif planet = Planets.find_by_url(@homeworld)
      puts "planet does exist"
      @planet = planet
      planet.name
    else
     puts "planet doesnt exist"
     puts "home world is #{@homeworld}"
     planet = Api.get_specific_planet(@homeworld)
     @planet = planet
     planet.name
    end
  end
 
end


