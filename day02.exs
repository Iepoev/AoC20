defmodule Day2 do
	def validate_pw1([min, max, char, pw]) do
		pw
		|> String.graphemes
		|> Enum.count(&(&1 == char))
		|> (&(&1 in String.to_integer(min)..String.to_integer(max))).()
	end

	def validate_pw2([i, j, char, pw]) do
		b1 = i
		|> String.to_integer
		|> on_index(char,pw)

		b2 = j
		|> String.to_integer
		|> on_index(char,pw)

		(b1 or b2) and not (b1 and b2)
	end

	defp on_index(idx, char, pw) do
		char == pw |> String.at(idx-1)
	end

	def solve({:ok, list}, ftion) do
		list
		|> String.split("\n")
		|> Enum.map(&(String.split(&1, ["-", " ", ": "])))
		|> Enum.map(ftion)
		|> Enum.count(&(&1))
	end
end

File.read("inputs/02")
#|> Day2.solve(&Day2.validate_pw1/1)
|> Day2.solve(&Day2.validate_pw2/1)
|> IO.inspect
