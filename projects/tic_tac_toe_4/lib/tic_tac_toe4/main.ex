defmodule TicTacToe4.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game() do
    Shell.info("Welcome to Tic Tac Toe 4!")
    type = ask_type_of_game()
    Shell.info("You chose to play #{type}!")
    play_game(type)
  end

  defp ask_type_of_game() do
    answer =
      Shell.prompt("Do you want to play against the computer? (yes/no)")
      |> String.trim()

    if answer == "yes" do
      Shell.info("You chose to play against the computer!")
      true
    else
      Shell.info("No random game for you!")
      false
    end
  end

  def play_game(random) do
    if random do
      :rand.seed(:exsss)
    else
      :rand.seed(:exsss, {100, 101, 102})
    end

    keep_playing(TicTacToe4.new_grid())
  end

  def parse_input(input) do
    input
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  defp keep_playing(grid) do
    show_grid(grid)

    case parse_input(choose_position()) do
      [-1] ->
        Shell.info("Bye!")

      [row, col] when row in 1..4 and col in 1..4 ->
        Shell.info("You chose row=#{row}, column=#{col}")
        apply_move(grid, row, col)

      _ ->
        Shell.info("Invalid input, Must be two numbers between 1 and 4!")
        keep_playing(grid)
    end
  end

  defp choose_position() do
    Shell.prompt("Choose a position (row column) or -1 to quit:")
    |> String.trim()
  end

  defp show_grid([m1, m2, m3, m4, m11, m12, m13, m14, m21, m22, m23, m24, m31, m32, m33, m34]) do
    Shell.info("Current grid:")
    Shell.info("#{m1} #{m2} #{m3} #{m4}")
    Shell.info("#{m11} #{m12} #{m13} #{m14}")
    Shell.info("#{m21} #{m22} #{m23} #{m24}")
    Shell.info("#{m31} #{m32} #{m33} #{m34}")
    Shell.info("")
  end

  defp apply_move(grid, row, col) do
    if TicTacToe4.next_turn?(grid, row, col) do
      grid_after_human_played = TicTacToe4.play(grid, 1, row, col)

      if winner?(grid_after_human_played) do
        show_grid(grid_after_human_played)
        Shell.info("You won! xD")
        start_game()
      else
        grid_after_computer_played = computer_plays(grid_after_human_played)

        if winner?(grid_after_computer_played) do
          show_grid(grid_after_computer_played)
          Shell.info("You lost! :(")
          start_game()
        else
          keep_playing(grid_after_computer_played)
        end
      end
    else
      Shell.info("Invalid move!")
      keep_playing(grid)
    end
  end

  defp winner?(grid) do
    {_, result} = TicTacToe4.finish?(grid)
    result
  end

  def computer_plays(grid) do
    TicTacToe4.play_random(grid, 2)
  end
end
