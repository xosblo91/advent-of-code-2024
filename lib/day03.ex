defmodule AOC24Day3 do
  def part1 do
    result =
      read()
      |> Enum.map(fn {a, b} -> a * b end)
      |> Enum.sum()

    IO.inspect(result)
  end

  def part2 do
  end

  def read() do
    file_path = "input_day03.txt"
    {_, content} = File.read(file_path)

    regex = ~r/mul\((\d+),(\d+)\)/

    Regex.scan(regex, content)
    |> Enum.map(fn [_, a, b] -> {String.to_integer(a), String.to_integer(b)} end)
  end
end
