defmodule TicTacToe do
  @players {:x, :o}

  def check_player(player) do
    case player do
      :x -> {:ok, player}
      :o -> {:ok, player}
      _  -> {:error, :invalid_player}
    end
  end

  def place_piece(board, place, player) do
    case board[place] do
      nil    -> {:error, :invalid_place}
      :x     -> {:error, :place_taken}
      :o     -> {:error, :place_taken}
      :empty -> {:ok, %{board | place => player}}
    end
  end

  def play_at(board, col, row, player) do
    with {:ok, valid_player} <- check_player(player),
         {:ok, b}            <- Board.new(col, row),
         {:ok, new_board}    <- place_piece(board, b, valid_player),
    do: new_board
  end

  def new_board do
    for b <- boards(), into: %{}, do: {b, :empty}
  end

  def boards do
    for c <- 1..3, r <- 1..3, into: MapSet.new(), do: %Board{col: c, row: r}
  end
end
