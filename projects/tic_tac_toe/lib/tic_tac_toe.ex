defmodule TicTacToe do

  def check_player(player) do
    case player do
      :x -> {:ok, player}
      :o -> {:ok, player}
      _ -> {:error, :invalid_player}
    end
  end

  def place_piece(board, place, player) do
    case board[place] do
      nil -> {:error, :invalid_place}
      :x -> {:error, :place_taken}
      :o -> {:error, :place_taken}
      :empty -> {:ok, %{board | place => player}}
    end
  end

  def play_at(board, col, row, player) do
    with {:ok, valid_player} <- check_player(player),
         {:ok, b} <- Board.new(col, row),
         {:ok, new_board} <- place_piece(board, b, valid_player),
         do: new_board
  end
end
