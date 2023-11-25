defmodule Cli do

    def play() do
        TicTacToe.start(&Cli.handle/2)
    end

    def handle(%State{status: _initial}, :get_player) do
      IO.gets("Choose player one: x or o? ")
        |> String.trim()
        |> String.to_atom()
    end

    def handle(%State{status: :playing} = state, :request_move) do
      display_board(state.board)
      IO.puts("Player #{state.turn}, please enter a move (col, row): ")
      col = IO.gets("Col: ") |> String.trim() |> String.to_integer()
      row = IO.gets("Row: ") |> String.trim() |> String.to_integer()
      {col, row}
    end

    def show(board, c, r) do
      [item] = for {%{col: col, row: row}, v} <- board,
      col == c, row == r, do: v
      if item == :empty, do: " ", else: to_string(item)
    end

    def display_board(b) do
      IO.puts """
        #{show(b, 1, 1)} | #{show(b, 2, 1)} | #{show(b, 3, 1)}
        --+---+--
        #{show(b, 1, 2)} | #{show(b, 2, 2)} | #{show(b, 3, 2)}
        --+---+--
        #{show(b, 1, 3)} | #{show(b, 2, 3)} | #{show(b, 3, 3)}
      """
    end
end
