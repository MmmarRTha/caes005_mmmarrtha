defmodule Mix.Tasks.Start do
    use Mix.Task

    def run(_), do: TicTacToe4.CLI.Main.start_game()
end
