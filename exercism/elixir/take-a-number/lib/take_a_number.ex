defmodule TakeANumber do
  def start() do
    spawn(fn -> loop(0) end)
  end

  defp loop(state) do
    receive do
        {:report_state, sender} ->
            send(sender, state)
            |> loop
        {:take_a_number, sender} ->
            send(sender, state + 1)
            |> loop

        :stop -> nil
        _ -> loop(state)
    end
  end

end
