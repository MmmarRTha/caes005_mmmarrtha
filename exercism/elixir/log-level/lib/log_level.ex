defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level == 0 and legacy? -> :unknown
      level == 0 -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 and legacy? -> :unknown
      level == 5 -> :fatal
      level == 6 -> :unknown
      level == -1 -> :unknown
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label in [:fatal, :error] -> :ops
      label == :unknown and legacy? -> :dev1
      label == :unknown -> :dev2
      true -> false
    end
  end

end
