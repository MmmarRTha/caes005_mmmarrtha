defmodule Math do
    def smallest_largest([head | tail]), do: smallest_largest(tail, head, head)
    def smallest_largest(_), do: {:error, "Input must be a non-empty list"}
    def smallest_largest([], smallest, largest), do: {smallest, largest}

    def smallest_largest([head | tail], smallest, largest) do
        new_smallest = if head < smallest, do: head, else: smallest
        new_largest = if head > largest, do: head, else: largest
        smallest_largest(tail, new_smallest, new_largest)
    end

end
