defmodule FreelancerRates do
@daily_rate 8.0

  def daily_rate(hourly_rate) do
    case hourly_rate do
      50 ->
        50 * @daily_rate
      60 ->
        60 * @daily_rate
      55.1 ->
        55.1 * @daily_rate
    end
  end

  def apply_discount(before_discount, discount) do
    discount_price = before_discount - (before_discount * discount / 100)
    Float.round(discount_price, 6)
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate = hourly_rate * @daily_rate
    discount_price = apply_discount(daily_rate, discount)
    trunc(Float.ceil(discount_price * 22))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate = hourly_rate * @daily_rate
    discount_price = apply_discount(daily_rate, discount)
    Float.floor(budget / discount_price, 1)
  end
end
