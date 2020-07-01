module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for el in self
          yield el
        end
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) { |acc, el| acc << yield(el) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |acc, el|
          acc << el unless el.nil?
          acc
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each { |el| acc = acc.nil? ? el : yield(acc, el) }
        acc
      end
    end
  end
end
