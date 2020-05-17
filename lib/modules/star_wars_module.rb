module StarWarsModule
  module ClassMethods
    @@current_page = 1
    @@next_page_url = " "

    def validate_input?(input)
      input.to_i.between?(1, self.get_limit + 1)
    end

    def find_by_url(url)
      self.all.find { |x| x.url == url }
    end

    def reset_current_page
      @@current_page = 1
    end

    def current_page
      @@current_page
    end

    def next_page_url
      @@next_page_url
    end

    def set_next_page_url(page)
      @@next_page_url = page
    end

    def get_offset
      @@current_page * 10 - 10
    end

    def get_limit
      @@current_page * 10 - 1
    end

    def increment_page_number
      @@current_page += 1
    end

    def decrement_page_number
      @@current_page -= 1
    end
  end

  module InstanceMethods
    def get_download_percentage(index, total)
      (index.to_f / total.to_f * 100).round()
    end
  end
end
