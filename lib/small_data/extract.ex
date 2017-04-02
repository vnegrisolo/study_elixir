defmodule SmallData.Extract do
  def extract(path), do: "#{path}/*.lzo" |> Path.wildcard |> Enum.each(&extract_file/1)

  defp extract_file(file) do
    File.rm(String.slice(file, 0..-5))
    [cmd|args] = "lzop #{file} -d" |> String.split
    System.cmd(cmd, args)
    File.rm(file)
  end
end
