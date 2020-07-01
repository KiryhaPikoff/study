module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.reduce(array[0]) { |max_el, el| el > max_el ? el : max_el }
        array.map { |el| el.positive? ? max : el }
      end

      def search(array, query)
        find = ->(start, finish) do
          len = finish - start + 1
          med = len / 2 + start

          return -1 if len == 0
          return med if array[med] == query

          query < array[med] ? find.call(start, med - 1) : find.call(med + 1, finish)
        end

        last_index = array.length - 1
        find.call(0, last_index)
      end
    end
  end
end
