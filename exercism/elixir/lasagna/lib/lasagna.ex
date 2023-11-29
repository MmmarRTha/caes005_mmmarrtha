defmodule Lasagna do
  @minutes_in_oven 40
  @minutes_per_layer 2

  def expected_minutes_in_oven() do
    @minutes_in_oven
  end

  def remaining_minutes_in_oven(minutes) do
    expected_minutes_in_oven() - minutes
  end

  def preparation_time_in_minutes(layers), do: layers * @minutes_per_layer

  def total_time_in_minutes(layers, minutes_in_oven), do: preparation_time_in_minutes(layers) + minutes_in_oven

  def alarm(), do: "Ding!"

end
