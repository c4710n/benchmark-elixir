list = Enum.to_list(1..10_000)
maps = Enum.map(list, fn i -> %{name: "name#{i}", count: i} end)

defmodule Teo do
  def rename_key1(enumerable, {key, new_key}) do
    Enum.map(enumerable, fn map ->
      value = Map.get(map, key)

      map
      |> Map.delete(key)
      |> Map.put(new_key, value)
    end)
  end

  def rename_key2(enumerable, {key, new_key}) do
    Enum.map(enumerable, fn map ->
      {v, m} = Map.pop(map, key)
      Map.put(m, new_key, v)
    end)
  end

  def rename_key3(enumerable, {key, new_key}) do
    Enum.map(
      enumerable,
      &Map.new(&1, fn
        {key, sum} -> {new_key, sum}
        other -> other
      end)
    )
  end
end

Benchee.run(%{
  "Map.delete & Map.put" => fn ->
    Teo.rename_key1(maps, {:count, :sum})
  end,
  "Map.pop & Map.put" => fn ->
    Teo.rename_key2(maps, {:count, :sum})
  end,
  "Map.new" => fn ->
    Teo.rename_key3(maps, {:count, :sum})
  end
})
