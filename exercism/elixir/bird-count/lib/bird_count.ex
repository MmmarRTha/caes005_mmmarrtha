defmodule BirdCount do

    def today([]), do: nil
    def today([list | _tail]), do: list

  def increment_day_count([list | tail]), do: [list + 1 | tail]
  def increment_day_count(_list), do: [1]

  def has_day_without_birds?([0 | _tail]), do: true
  def has_day_without_birds?([_list | tail]), do: has_day_without_birds?(tail)
  def has_day_without_birds?(_list), do: false

  def total([list | tail]) do
    list + total(tail)
  end

  def total(_list), do: 0

  def busy_days([list | tail]) when list >= 5, do: 1 + busy_days(tail)
  def busy_days([_list | tail]), do: busy_days(tail)
  def busy_days(_list), do: 0

end
