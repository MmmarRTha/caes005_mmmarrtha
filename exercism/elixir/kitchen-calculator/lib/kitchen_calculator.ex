defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair) do
    case elem(volume_pair, 0) do
      :milliliter -> {:milliliter, get_volume(volume_pair) * 1}
      :cup -> {:milliliter, get_volume(volume_pair) * 240}
      :fluid_ounce -> {:milliliter, get_volume(volume_pair) * 30}
      :teaspoon -> {:milliliter, get_volume(volume_pair) * 5}
      :tablespoon -> {:milliliter, get_volume(volume_pair) * 15}
    end
  end

  def from_milliliter(volume_pair, unit) do
    case unit do
      :milliliter -> {:milliliter, get_volume(volume_pair) * 1}
      :cup -> {:cup, get_volume(volume_pair) / 240}
      :fluid_ounce -> {:fluid_ounce, get_volume(volume_pair) / 30}
      :teaspoon -> {:teaspoon, get_volume(volume_pair) / 5}
      :tablespoon -> {:tablespoon, get_volume(volume_pair) / 15}
    end
  end

  # given a volume pair tuple and desired unit, convert to that unit
  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter
    |> from_milliliter(unit)
  end
end
