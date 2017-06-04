defmodule Conditional do
  @behaviour Benchmark
  @behaviour Profile
  @callback run(boolean) :: String.t

  @algorithms [
    Conditional.If.Block,
    Conditional.If.KeywordList,
    Conditional.Case,
    Conditional.Bool,
  ]

  @inputs %{
    truthy: true,
    falsy: false,
  }

  def benchmark, do: Benchmark.benchmark(@algorithms, @inputs)

  def profile, do: Profile.profile(@algorithms, @inputs.truthy)
end

defmodule Conditional.If.Block do
  @behaviour Conditional

  def run(input) do
    if input == true do
      "true"
    else
      "false"
    end
  end
end

defmodule Conditional.If.KeywordList do
  @behaviour Conditional

  def run(input) do
    if input == true, do: "true", else: "false"
  end
end

defmodule Conditional.Case do
  @behaviour Conditional

  def run(input) do
    case input do
      true -> "true"
      _    -> "false"
    end
  end
end

defmodule Conditional.Bool do
  @behaviour Conditional

  def run(input) do
    input == true && "true" || "false"
  end
end
