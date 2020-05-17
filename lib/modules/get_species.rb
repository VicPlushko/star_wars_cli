module GetSpecies
  def get_species_name(url)
    if specie = @species.find { |specie| specie.url == url }
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
      ["n/a"]
    else
      names = []
      urls.each.with_index do |url, index|
        printf("\rDownloading Species: %d%%", get_download_percentage(index, urls.length))
        names << get_species_name(url)
      end
      names
    end
  end
end
