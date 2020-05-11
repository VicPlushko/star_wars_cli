class Film
    attr_accessor :title, :episode_id, :opening_crawl, :director, :producer, :release_date, :characters, :planets, :starships, :vehicles, :species, :url

    @@all = []

    def initialize(title:, episode_id:, opening_crawl:, director:, producer:, release_date:, characters:, planets:, starships:, vehicles:, species:, url:)
        @title = title
        @episode_id = episode_id
        @opening_crawl = opening_crawl
        @director = director
        @producer = producer
        @release_date = release_date
        @characters = characters
        @planets = planets
        @starships = starships
        @vehicles = vehicles
        @species = species
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