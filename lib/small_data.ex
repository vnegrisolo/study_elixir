defmodule SmallData do
  @data_dir "data/download"

  import SmallData.Download, only: [download: 2]
  import SmallData.Extract, only: [extract: 1]
  import SmallData.Map, only: [map: 1]

  def run(date \\ '20170401') do
    dir = recreate_dir(date)

    time_in_sec("download", fn -> download(date, dir) end)
    time_in_sec("extract", fn -> extract(dir) end)
    time_in_sec("map", fn -> map(dir) end)
  end

  defp recreate_dir(date) do
    dir = "#{@data_dir}/#{date}"
    File.rm_rf(dir)
    File.mkdir_p(dir)
    dir
  end

  defp time(function), do: function |> :timer.tc |> elem(0)
  defp time_in_sec(name, function) do
    IO.puts "name=#{name}, time=#{time(function) / 1_000_000}"
  end
end
