module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        ratings =
          array.select { |film| !film['country'].nil? && film['country'].split(',').length >= 2 }
               .map    { |film| film['rating_kinopoisk'].to_f }
               .select { |rating| !rating.nil? && !rating.zero? }

        ratings.reduce { |sum, rating| sum + rating } / ratings.size
      end

      def chars_count(films, threshold)
        film_names =
          films.reject { |film| film['rating_kinopoisk'].nil? }
               .select { |film| film['rating_kinopoisk'].to_f >= threshold }
               .map    { |film| film['name'] }

        film_names.reduce(0) { |count, name| count + name.count('и') }
      end
    end
  end
end
