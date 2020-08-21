defmodule Leaks.GenServer do
  use GenServer

  def start_link(_args) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  defp js_call() do
    NodeJS.call({"leaks", "foo"}, [], binary: true, timeout: 1_000)
  end

  @impl true
  def init(_) do
    Process.send(self(), :loop, [])

    {:ok, nil}
  end

  @impl true
  def handle_info(:loop, state) do
    IO.puts("before call")
    res = js_call()
    IO.puts("result")
    IO.inspect(res)
    IO.puts("after call")

    Process.send_after(self(), :loop, 2_000, [])

    {:noreply, state}
  end
end
