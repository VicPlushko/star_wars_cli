class Species
  attr_accessor :name, :classification, :designation, :average_height, :skin_colors, :hair_colors, :eye_colors, :average_lifespan, :language

  @@all = []

  def initialize(name:, classification:, designation:, average_height:, skin_colors:, hair_colors:, eye_colors:, average_lifespan:, language:)
    @name = name
    @classification = classification
    @designation = designation
    @average_height = average_height
    @skin_colors = skin_colors
    @hair_colors = hair_colors
    @eye_colors = eye_colors
    @average_lifespan = average_lifespan
    @language = language
    @@all << self
  end

  def self.all
    @@all
  end

  def self.validate_input?(input)
    input.to_i.between?(1, self.all.length)
  end
end