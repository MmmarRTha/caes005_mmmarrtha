defmodule Secrets do
  def secret_add(secret) do
    fn (y) -> secret + y end
  end

  def secret_subtract(secret) do
    fn (y) -> y - secret end
  end

  def secret_multiply(secret) do
    fn (y) -> secret * y end
  end

  def secret_divide(secret) do
    fn (y) -> div(y, secret) end
  end

  def secret_and(secret) do
    fn (y) -> Bitwise.band(y, secret) end
  end

  def secret_xor(secret) do
    fn (y) -> Bitwise.bxor(y, secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn (y) -> secret_function2.(secret_function1.(y)) end
  end
end
