defmodule AOC24Day3 do
  def part1 do
    result =
      read1()
      |> Enum.map(fn {a, b} -> a * b end)
      |> Enum.sum()

    IO.inspect(result)
  end

  def part2 do
    input = read2()
    IO.inspect(input)

    {final_result, _} =
      Enum.reduce(input, {0, true}, fn instruction, {result, enabled} ->
        case instruction do
          ["mul(" <> args] ->
            if enabled do
              [a, b] =
                args
                |> String.trim_trailing(")")
                |> String.split(",")
                |> Enum.map(&String.to_integer/1)

              new_result = result + a * b
              IO.puts("mul")
              {new_result, enabled}
            else
              IO.puts("mul skipped (disabled)")
              {result, enabled}
            end

          ["do()"] ->
            IO.puts("do")
            {result, true}

          ["don't()"] ->
            IO.puts("don't")
            {result, false}
        end
      end)

    IO.puts("\nresult: #{final_result}")
  end

  def read1() do
    file_path = "input_day03.txt"
    {_, content} = File.read(file_path)

    regex = ~r/mul\((\d+),(\d+)\)/

    Regex.scan(regex, content)
    |> Enum.map(fn [_, a, b] -> {String.to_integer(a), String.to_integer(b)} end)
  end

  def read2() do
    file_path = "input_day03.txt"
    {_, content} = File.read(file_path)

    regex = ~r/mul\(\d+,\d+\)|don't\(\)|do\(\)/

    Regex.scan(regex, content)
  end
end
