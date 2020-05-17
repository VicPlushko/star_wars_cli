module GetCharacters
  def get_character_name(url)
    if character = @characters.find { |character| character.url == url }
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
      ["n/a"]
    else
      names = []
      urls.each.with_index do |url, index|
        printf("\rDownloading Characters: %d%%", get_download_percentage(index, urls.length))
        names << get_character_name(url)
      end
      names
    end
  end
end
