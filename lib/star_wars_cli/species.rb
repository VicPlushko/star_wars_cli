class Species
  attr_accessor :name, :classification, :designation, :average_height, :skin_colors, :hair_colors, :eye_colors, :average_lifespan, :language, :url

  @@all = []

  def initialize(name:, classification:, designation:, average_height:, skin_colors:, hair_colors:, eye_colors:, average_lifespan:, language:, url:)
    @name = name
    @classification = classification
    @designation = designation
    @average_height = average_height
    @skin_colors = skin_colors
    @hair_colors = hair_colors
    @eye_colors = eye_colors
    @average_lifespan = average_lifespan
    @language = language
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
end