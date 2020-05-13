class Planets
    attr_accessor :name, :rotation_period, :orbital_period, :diameter, :climate, :gravity, :terrain, :surface_water, :population, :url, :residents_urls, :residents, :films_urls, :films, :species

    @@all = []

    def initialize(name:, rotation_period:, orbital_period:, diameter:, climate:, gravity:, terrain:, surface_water:, population:, url:, residents_urls:, films_urls:)
        @name = name
        @rotation_period = rotation_period
        @orbital_period = orbital_period
        @diameter = diameter
        @climate = climate
        @gravity = gravity
        @terrain = terrain
        @surface_water = surface_water
        @population = population
        @residents_urls = residents_urls
        @residents = []
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

      def get_resident_name(url)
        if resident = @residents.find {|resident| resident.url == url}
        resident.name
      elsif resident = Person.find_by_url(url)
        @residents << resident
        resident.name
      else
        resident = Api.get_specific_people(url)
        @residents << resident
        resident.name
        end
      end
    
      def get_resident_names(urls)
        if urls.length == 0
          "n/a"
        else
          names = []
          urls.each do |url|
            names << get_resident_name(url)
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