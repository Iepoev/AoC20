defmodule Day2 do
	def parse_input(string) do
		[config,pw] = String.split(string, ": ")
		[minmax, char] = String.split(config, " ")
		[min, max] = String.split(minmax, "-")
		{String.to_integer(min), String.to_integer(max), char, pw}
	end

	def validate_pw1({min, max, char, pw}) do
		pw
		|> String.graphemes
		|> Enum.count(&(&1 == char))
		|> (&(&1 in min..max)).()
	end

	def validate_pw2({i, j, char, pw}) do
		xor(on_index(i, char, pw),on_index(j, char, pw))
	end

	def on_index(idx, char, pw) do
		char == pw |> String.at(idx-1)
	end

	def xor(b1, b2) do
		(b1 or b2) and not (b1 and b2)
	end
end

{:ok, list} = File.read("inputs/02")

list
|> String.split("\n")
|> Enum.map(&Day2.parse_input/1)
|> Enum.map(&Day2.validate_pw1/1)
|> Enum.count(&(&1))
|> IO.inspect

list
|> String.split("\n")
|> Enum.map(&Day2.parse_input/1)
|> Enum.map(&Day2.validate_pw2/1)
|> Enum.count(&(&1))
|> IO.inspect