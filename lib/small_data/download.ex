defmodule SmallData.Download do
  @s3_uri "s3://uri"

  def download(date, path) do
    [cmd|args] = "aws s3 cp --recursive #{@s3_uri}/#{date}/transactions/ #{path}" |> String.split
    System.cmd(cmd, args)
  end
end
