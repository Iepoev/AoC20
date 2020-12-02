{:ok, list} = File.read("inputs/01")

list = list
|> String.split("\n")
|> Enum.map(&(String.to_integer/1))


for i <- list do
	for j <- list do
		for k <- list do
			if (i+j+k == 2020) do
				IO.inspect(i*j*k)
			end	
		end
	end
end