defmodule TicTacToe4 do
  @moduledoc """
  Documentation for `TicTacToe4`.
  """
  @empty "_"

  @spec new_grid :: list

  def new_grid(), do: List.duplicate(@empty, 16)

  @spec play(list, 1..2, 1..4, 1..4) :: list
  def play(grid, player, row, col)
      when row >= 1 and row <= 4 and col >= 1 and col <= 4 do
    if Enum.at(grid, position(row, col)) == @empty do
      List.replace_at(grid, position(row, col), player_mark(player))
    end
  end

  @spec next_turn?(list, 1..4, 1..4) :: boolean()
  def next_turn?(grid, row, col) do
    Enum.at(grid, position(row, col)) == @empty
  end

  defp position(row, col), do: (row - 1) * 4 + col - 1

  defp row_col_position(position) when position in 0..13 do
    {div(position, 4) + 1, rem(position, 4) + 1}
  end

  defp empty_positions(grid) do
    Enum.with_index(grid)
    |> Enum.filter(fn {mark, _position} -> mark == @empty end)
    |> Enum.map(fn {_mark, position} -> position end)
    |> Enum.map(&row_col_position/1)
  end

  @spec empty_mark :: String.t()
  def empty_mark(), do: @empty

  @spec player_mark(1..2) :: String.t()
  def player_mark(1), do: "X"
  def player_mark(2), do: "O"

  @spec winner?(list) :: {String.t() | nil, boolean()}
  def winner?([m, _, _, _, m, _, _, _, m, _, _, _, m, _, _, _]) when m != @empty, do: {m, true}
  def winner?([_, m, _, _, _, m, _, _, _, m, _, _, _, m, _, _]) when m != @empty, do: {m, true}
  def winner?([_, _, m, _, _, _, m, _, m, _, _, _, m, _, _, _]) when m != @empty, do: {m, true}
  def winner?([_, _, _, m, _, _, _, m, _, _, _, m, _, _, _, m]) when m != @empty, do: {m, true}
  def winner?([m, m, m, m, _, _, _, _, _, _, _, _, _, _, _, _]) when m != @empty, do: {m, true}
  def winner?([_, _, _, _, m, m, m, m, _, _, _, _, _, _, _, _]) when m != @empty, do: {m, true}
  def winner?([_, _, _, _, _, _, _, _, m, m, m, m, _, _, _, _]) when m != @empty, do: {m, true}
  def winner?([_, _, _, _, _, _, _, _, _, _, _, _, m, m, m, m]) when m != @empty, do: {m, true}
  def winner?([m, _, _, _, _, _, _, m, m, _, _, _, _, _, _, m]) when m != @empty, do: {m, true}
  def winner?([_, _, _, m, _, _, m, _, _, m, _, _, m, _, _, _]) when m != @empty, do: {m, true}

  def winner?(list) do
    {nil, not Enum.any?(list, fn s -> s == @empty end)}
  end

  @spec play_random(list, 1 | 2) :: list
  def play_random(grid, player) do
    {row, col} =
      grid
      |> empty_positions()
      |> Enum.random()

    TicTacToe4.play(grid, player, row, col)
  end
end
