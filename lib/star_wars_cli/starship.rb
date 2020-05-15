class Starship
    attr_accessor :name, :model, :manufacturer, :cost_in_credits, :length, :max_atmosphering_speed, :crew, :passengers, :cargo_capacity, :consumables, :hyperdrive_rating, :starship_class, :pilots_urls, :pilots, :films_urls, :films, :url

    @@all = []
    @@current_page = 1
    @@next_page_url = " "

    def initialize(name:, model:, manufacturer:, cost_in_credits:, length:, max_atmosphering_speed:, crew:, passengers:, cargo_capacity:, consumables:, hyperdrive_rating:, starship_class:, pilots_urls:, films_urls:, url:)
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

      def self.current_page
        @@current_page
      end
    
      def self.next_page_url
        @@next_page_url
      end
    
      def self.set_next_page_url(page)
        @@next_page_url = page
      end
    
      def self.get_starships_for_page
        self.all[get_offset..get_limit]
      end
    
      def self.get_offset
        @@current_page * 10 - 10
      end
    
      def self.get_limit 
        @@current_page * 10 -1
      end
    
      def self.increment_page_number
        @@current_page += 1
      end
    
      def self.decrement_page_number
        @@current_page -= 1
      end
    
      def get_download_percentage(index, total)
        (index.to_f/total.to_f*100).round()
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
          urls.each.with_index do |url, index|
            printf("\rDownloading Pilots: %d%%", get_download_percentage(index, urls.length))
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
          urls.each.with_index do |url, index|
            printf("\rDownloading Films: %d%%", get_download_percentage(index, urls.length))
            names << get_film_name(url)
          end
          names
        end
      end
end
