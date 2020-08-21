defmodule Leaks.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    children = [
      supervisor(NodeJS, [[path: "node_app", pool_size: 4]]),
      Leaks.GenServer
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
