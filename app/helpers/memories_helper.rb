module MemoriesHelper

    def display_fuzzy_date(date, fuzz)
      case fuzz
      when "decade"
        decade = date.year - (date.year % 10)
        decade.to_s + "s"
      when "year"
        date.strftime('%Y')
      when "month"
        date.strftime('%b %Y')
      when "regular"
        date.strftime('%b %d, %Y')
      else
        date.strftime('%m %d, %Y')
      end
    end

end
