module GetFilm
  def get_film_name(url)
    if film = @films.find { |film| film.url == url }
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
      ["n/a"]
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
