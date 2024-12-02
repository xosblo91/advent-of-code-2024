defmodule AOC24Day2 do
  def part1 do
    s = read()

    result =
      Enum.reduce(s, 0, fn list, acc ->
        if safe(list) do
          acc + 1
        else
          acc
        end
      end)

    IO.inspect(result)
  end

  def part2 do
    s = read()

    result =
      Enum.reduce(s, 0, fn list, acc ->
        if safe(list) do
          acc + 1
        else
          if safe_with_one_removal(list) do
            acc + 1
          else
            acc
          end
        end
      end)

    IO.inspect(result)
  end

  def safe_with_one_removal(list) do
    Enum.any?(0..(length(list) - 1), fn idx ->
      updated_list = List.delete_at(list, idx)
      safe(updated_list)
    end)
  end

  def safe(list) do
    max_diff(list) and (decreasing(list) or increasing(list))
  end

  def max_diff(list) do
    Enum.chunk_every(list, 2, 1, :discard)
    |> Enum.all?(fn [a, b] -> abs(a - b) >= 1 and abs(a - b) <= 3 end)
  end

  def decreasing(list) do
    Enum.chunk_every(list, 2, 1, :discard)
    |> Enum.all?(fn [a, b] -> a > b end)
  end

  def increasing(list) do
    Enum.chunk_every(list, 2, 1, :discard)
    |> Enum.all?(fn [a, b] -> a < b end)
  end

  def read() do
    file_path = "input_day02.txt"

    File.read!(file_path)
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  defp parse_line(line) do
    line
    |> String.split(~r/\s+/, trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
