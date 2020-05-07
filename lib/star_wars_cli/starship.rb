class Starship
    attr_accessor :name, :model, :manufacturer, :cost_in_credits, :length, :max_atmosphering_speed, :crew, :passengers, :cargo_capacity, :consumables, :hyperdrive_rating, :starship_class

    @@all = []

    def initialize(name:, model:, manufacturer:, cost_in_credits:, length:, max_atmosphering_speed:, crew:, passengers:, cargo_capacity:, consumables:, hyperdrive_rating:, starship_class:)
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
        @@all << self
      end
    
      def self.all
        @@all
      end
    
      def self.validate_input?(input)
        input.to_i.between?(1, self.all.length)
      end
end
