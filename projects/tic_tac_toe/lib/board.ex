defmodule Board do
  @enforce_keys [:row, :col]
  defstruct [:row, :col]

  @board_size 1..3

  def new(col, row) when col in @board_size and row in @board_size do
    {:ok, %Board{row: row, col: col}}
  end

  def new(_col, _row), do: {:error, :invalid_position}

  def new_board do
    for b <- boards(), into: %{}, do: {b, :empty}
  end

  def boards do
    for c <- @board_size, r <- @board_size, into: MapSet.new(), do: %Board{col: c, row: r}
  end
end
