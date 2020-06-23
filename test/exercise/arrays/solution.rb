module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |el| el.positive? ? max : el }
      end

      def search(_array, _query)
        0
      end
    end
  end
end
