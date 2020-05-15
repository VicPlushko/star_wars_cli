class Film
    attr_accessor :title, :episode_id, :opening_crawl, :director, :producer, :release_date, :characters_urls, :characters, :planets_urls, :planets, :starships_urls, :starships, :vehicles_urls, :vehicles, :species_urls, :species, :url

    @@all = []

    def initialize(title:, episode_id:, opening_crawl:, director:, producer:, release_date:, characters_urls:, planets_urls:, starships_urls:, vehicles_urls:, species_urls:, url:)
        @title = title
        @episode_id = episode_id
        @opening_crawl = opening_crawl
        @director = director
        @producer = producer
        @release_date = release_date
        @characters_urls = characters_urls
        @planets_urls = planets_urls
        @starships_urls = starships_urls
        @vehicles_urls = vehicles_urls
        @species_urls = species_urls
        @url = url
        @characters = []
        @planets = []
        @starships = []
        @vehicles = []
        @species = []
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

      def get_character_name(url)
        if character = @characters.find {|character| character.url == url}
        character.name
      elsif character = Person.find_by_url(url)
        @characters << character
        character.name
      else
        character = Api.get_specific_people(url)
        @characters << character
        character.name
        end
      end
    
      def get_character_names(urls)
        if urls.length == 0
          "n/a"
        else
          names = []
          urls.each.with_index do |url, index|
            printf("\rDownloading Characters: %d%%", get_download_percentage(index, urls.length))
            names << get_character_name(url)
          end
          names
        end
      end

      def get_download_percentage(index, total)
        (index.to_f/total.to_f*100).round()
      end



      def get_planet_name(url)
        if planet = @planets.find {|planet| planet.url == url}
        planet.name
      elsif planet = Planets.find_by_url(url)
        @planets << planet
        planet.name
      else
        planet = Api.get_specific_planet(url)
        @planets << planet
        planet.name
        end
      end
    
      def get_planet_names(urls)
        if urls.length == 0
          "n/a"
        else
          names = []
          urls.each do |url|
            names << get_planet_name(url)
          end
          names
        end
      end

      def get_starship_name(url)
        if starship = @starships.find {|starship| starship.url == url}
        starship.name
      elsif starship = Starship.find_by_url(url)
        @starships << starship
        starship.name
      else
        starship = Api.get_specific_starship(url)
        @starships << starship
        starship.name
        end
      end
    
      def get_starship_names(urls)
        if urls.length == 0
          "n/a"
        else
          names = []
          urls.each do |url|
            names << get_starship_name(url)
          end
          names
        end
      end

      def get_vehicle_name(url)
        if vehicle = @vehicles.find {|vehicle| vehicle.url == url}
        vehicle.name
      elsif vehicle = Vehicle.find_by_url(url)
        @vehicles << vehicle
        vehicle.name
      else
        vehicle = Api.get_specific_vehicle(url)
        @vehicles << vehicle
        vehicle.name
        end
      end
    
      def get_vehicle_names(urls)
        if urls.length == 0
          "n/a"
        else
          names = []
          urls.each do |url|
            names << get_vehicle_name(url)
          end
          names
        end
      end

      def get_species_name(url)
        if specie = @species.find {|specie| specie.url == url}
        specie.name
      elsif specie = Species.find_by_url(url)
        @species << specie
        specie.name
      else
        specie = Api.get_specific_species(url)
        @species << specie
        specie.name
        end
      end
    
      def get_species_names(urls)
        if urls.length == 0
          "n/a"
        else
          names = []
          urls.each do |url|
            names << get_species_name(url)
          end
          names
        end
      end
end