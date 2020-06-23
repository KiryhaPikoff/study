module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |el| el.positive? ? max : el }
      end

      def search(_array, _query)
        len = _array.length
        med = len / 2

        return -1 if _array.empty?
        return med if _array[med] == _query

        if _query < _array[med]
          search(_array[0..med - 1], _query)
        elsif _query > _array[med]
          found = search(_array[med + 1..len], _query)
          found == -1 ? -1 : (med + 1) + found
        end
      end
    end
  end
end
