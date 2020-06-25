module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.reduce(array[0]) { |max_el, el| el > max_el ? el : max_el }
        array.map { |el| el.positive? ? max : el }
      end

      def search(array, query)
        len = array.length
        med = len / 2

        return -1 if array.empty?
        return med if array[med] == query

        if query < array[med]
          search(array[0..med - 1], query)
        elsif query > array[med]
          found = search(array[med + 1..len], query)
          found == -1 ? -1 : (med + 1) + found
        end
      end
    end
  end
end
