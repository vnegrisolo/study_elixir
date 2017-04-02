defmodule SmallData.Map do
  def map(path), do: "#{path}/*.csv" |> Path.wildcard |> Enum.each(&map_file/1)

  defp map_file(file) do
    file
    |> File.stream!
    |> Stream.map(&extract_id/1)
    |> Stream.map(&add_new_line/1)
    |> Stream.into(File.stream!("#{file}.ids"))
    |> Stream.run

    File.rm(file)
  end

  defp extract_id(line), do: line |> String.split(",") |> List.first()
  defp add_new_line(id), do: "#{id}\n"
end
