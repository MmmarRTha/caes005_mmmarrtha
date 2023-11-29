defmodule GuessingGame do
    def compare(secret_number, guess \\ " ") do
        case guess do
            _ when guess == " " -> "Make a guess"
            _ when guess == :no_guess -> "Make a guess"
            _ when guess == secret_number -> "Correct"
            _ when guess == secret_number + 1 or guess == secret_number - 1 -> "So close"
            _ when guess < secret_number -> "Too low"
            _ when guess > secret_number -> "Too high"
          end
    end
end
