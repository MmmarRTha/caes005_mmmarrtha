defmodule Fibonacci do
    # def calc(0), do: 0
    # def calc(1), do: 1
    # def calc(n) when n > 1 do
    #     calc(n - 1) + calc(n - 2)
    # end

    def find(nth) do
      list = [1, 1]
      fib(list, nth)
    end

    defp fib(list, 2) do
      Enum.reverse(list)
    end

    defp fib(list, n) do
      [first_element, second_element | _rest] = list
      fib([first_element + second_element | list], n - 1)
    end

end
