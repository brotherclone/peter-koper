module MemoriesHelper

    def display_fuzzy_date(date, fuzz, with_dash)
      case fuzz
      when "decade"
        decade = date.year - (date.year % 10)
        fuzzy_date = decade.to_s + "s"
      when "year"
        fuzzy_date = date.strftime('%Y')
      when "month"
        fuzzy_date = date.strftime('%b %Y')
      when "regular"
        fuzzy_date = date.strftime('%b %d, %Y')
      else
        fuzzy_date = nil
      end
      if fuzzy_date
        if with_dash
          "- "+fuzzy_date
        else
          fuzzy_date
        end
      end
    end

    def comma_pal(name, group_length, index)
      if group_length > 1
        if index < group_length
          name+ ", "
        else
          name
        end
      else
        name
      end
    end

end
