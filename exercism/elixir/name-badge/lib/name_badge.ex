defmodule NameBadge do
    def print(id, name, department) do
        id_string = if id, do: "[#{id}] - ", else: nil

        dept_string = if department, do: " - #{String.upcase(department)}", else: " - OWNER"
        "#{id_string}#{name}#{dept_string}"
    end
end
