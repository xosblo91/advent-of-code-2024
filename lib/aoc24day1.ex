defmodule AOC24Day1 do
  def part1 do
    {list1, list2} = read()

    sorted_list1 = Enum.sort(list1)
    sorted_list2 = Enum.sort(list2)

    sum =
      Enum.zip(sorted_list1, sorted_list2)
      |> Enum.reduce(0, fn {val1, val2}, acc -> acc + abs(val1 - val2) end)

    IO.puts("sum: #{sum}")
  end

  def part2 do
    {list1, list2} = read()

    sum =
      Enum.reduce(list1, 0, fn num, acc ->
        count_in_list2 = Enum.count(list2, &(&1 == num))
        acc + num * count_in_list2
      end)

    IO.puts("sum: #{sum}")
  end

  def read do
    file_path = "input_day01.txt"

    {list1, list2} =
      File.read!(file_path)
      |> String.split("\n", trim: true)
      |> Enum.reduce({[], []}, fn line, {list1, list2} ->
        [left, right] = String.split(line, ~r/\s+/, trim: true)
        {list1 ++ [String.to_integer(left)], list2 ++ [String.to_integer(right)]}
      end)

    {list1, list2}
  end
end
