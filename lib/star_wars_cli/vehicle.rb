class Vehicle
    attr_accessor :name, :model, :manufacturer, :cost_in_credits, :length, :max_atmosphering_speed, :crew, :passengers, :cargo_capacity, :consumables, :vehicle_class, :pilots_urls, :pilots, :films_urls, :films, :url

    @@all = []

    def initialize(name:, model:, manufacturer:, cost_in_credits:, length:, max_atmosphering_speed:, crew:, passengers:, cargo_capacity:, consumables:, vehicle_class:, pilots_urls:, films_urls:, url:)
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
        @pilots_urls = pilots_urls
        @pilots = []
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

      def get_pilot_name(url)
        if pilot = @pilots.find {|pilot| pilot.url == url}
        pilot.name
      elsif pilot = Person.find_by_url(url)
        @pilots << pilot
        pilot.name
      else
        pilot = Api.get_specific_people(url)
        @pilots << pilot
        pilot.name
        end
      end
    
      def get_pilot_names(urls)
        if urls.length == 0
          "n/a"
        else
          names = []
          urls.each do |url|
            names << get_pilot_name(url)
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
