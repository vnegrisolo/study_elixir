defmodule Table do
  import String, only: [pad_trailing: 2, pad_trailing: 3]

  def table(maps) do
    maps = maps |> Enum.map(&to_map/1)
    pads = padding(maps)
    bar = bar(pads)
    head = head(pads)
    rows = maps |> Enum.map(&row(pads, &1))

    [bar, head, bar, rows, bar, ""] |> List.flatten |> Enum.join("\n")
  end

  defp to_map(struct = %{__struct__: _}), do: struct |> Map.from_struct
  defp to_map(map), do: map

  defp padding(maps) do
    Enum.reduce(maps, %{}, &padding/2) |> Map.to_list
  end
  defp padding(map, pads) do
    Enum.reduce(Map.keys(map), pads, &padding(map, &1, &2))
  end
  defp padding(map, key, pads) do
    pad = max_length(key, map[key])
    Map.update(pads, key, pad, &Enum.max([&1, pad]))
  end

  defp bar(pads), do: pads |> Enum.map(&bar_col/1) |> line("+", "-")
  defp head(pads), do: pads |> Enum.map(&head_col/1) |> line
  defp row(pads, map), do: pads |> Enum.map(&row_col(&1, map)) |> line

  defp bar_col({_key, pad}), do: "-" |> pad_trailing(pad, "-")
  defp head_col({key, pad}), do: "#{key}" |> pad_trailing(pad)
  defp row_col({key, pad}, map), do: "#{map[key]}" |> pad_trailing(pad)

  defp line(row, border \\ "|", separator \\ " ") do
    ["", row, ""]
    |> List.flatten
    |> Enum.join(separator <> border <> separator)
    |> String.trim(separator)
  end

  defp max_length(x, y) do
    [x, y] |> Enum.map(&String.length("#{&1}")) |> Enum.max
  end
end
