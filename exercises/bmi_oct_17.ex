defmodule BMI do
    # def bmi(height, weight) do
    #     weight / (height * height)
    # end

    def compute({height, :meters}, {weight, :kilograms}) do
        weight / (height * height)
    end

    def compute({height, :centimeters}, {weight, :kilograms}) do
        weight / ((height / 100) * (height / 100))
    end

end
