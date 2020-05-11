class Planets
    attr_accessor :name, :rotation_period, :orbital_period, :diameter, :climate, :gravity, :terrain, :surface_water, :population, :url #:resident_urls

    @@all = []

    def initialize(name:, rotation_period:, orbital_period:, diameter:, climate:, gravity:, terrain:, surface_water:, population:, url:) #resident_urls:)
        @name = name
        @rotation_period = rotation_period
        @orbital_period = orbital_period
        @diameter = diameter
        @climate = climate
        @gravity = gravity
        @terrain = terrain
        @surface_water = surface_water
        @population = population
        #@resident_urls = resident_urls
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
        self.all.find {|planet| planet.url == url}
      end
end