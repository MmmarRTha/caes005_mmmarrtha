defmodule TicTacToe do

def start(ui) do
  with {:ok, game} <- State.new(ui),
       player      <- ui.(game, :get_player),
       {:ok, game} <- State.event(game, {:choose_pl, player}),
  do: handle(game), else: (error -> error)
end

  def check_player(player) do
    case player do
      :x -> {:ok, player}
      :o -> {:ok, player}
      _ -> {:error, :invalid_player}
    end
  end

  def handle(%{status: :playing} = game) do
    with {col, row} <- game.ui.(game, :request_move),
    {:ok, board} <- play_at(game.board, col, row, game.turn),
    {:ok, game} <- State.event(%{game | board: board}, {:play, game.turn}),
    do: handle(game), else: (error -> error)
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
         {:ok, square}       <- Square.new(col, row),
         {:ok, new_board}    <- place_piece(board, square, valid_player),
         do: new_board
  end
end
