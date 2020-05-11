class Vehicle
    attr_accessor :name, :model, :manufacturer, :cost_in_credits, :length, :max_atmosphering_speed, :crew, :passengers, :cargo_capacity, :consumables, :vehicle_class, :url

    @@all = []

    def initialize(name:, model:, manufacturer:, cost_in_credits:, length:, max_atmosphering_speed:, crew:, passengers:, cargo_capacity:, consumables:, vehicle_class:, url:)
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
        @vehicle_class = vehicle_class
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
