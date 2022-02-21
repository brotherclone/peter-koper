module MemoriesHelper

    def display_fuzzy_date(date, fuzz)
      case fuzz
      when :decade
        year = date.strftime('%Y')
        year = year.to_int
        year = year -(year % 10)
        puts year
      when :year
        puts date.strftime('%Y')
      when :month
        puts date.strftime('%b%Y')
      when :regular
        puts date.strftime('%b%d%Y')
      else
        puts date.strftime('%m%d%Y')
      end
    end

end
