defmodule Board do
    @enforce_keys [:row, :col]
    defstruct [:row, :col]

    def new(col, row) when col in 1..3 and row in 1..3 do
      {:ok, %Board{row: row, col: col}}
    end

    def new(_col, _row), do: {:error, :invalid_position}
end
