module GetVehiclesAndStarships
    def get_starship_name(url)
        if starship = @starships.find { |starship| starship.url == url }
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
          ["n/a"]
        else
          names = []
          urls.each.with_index do |url, index|
            printf("\rDownloading Starships: %d%%", get_download_percentage(index, urls.length))
            names << get_starship_name(url)
          end
          names
        end
      end
    
      def get_vehicle_name(url)
        if vehicle = @vehicles.find { |vehicle| vehicle.url == url }
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
          ["n/a"]
        else
          names = []
          urls.each.with_index do |url, index|
            printf("\rDownloading Vehicles: %d%%", get_download_percentage(index, urls.length))
            names << get_vehicle_name(url)
          end
          names
        end
      end
end