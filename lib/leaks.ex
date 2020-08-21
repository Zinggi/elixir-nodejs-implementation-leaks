defmodule Leaks do
  use Application

  @impl true
  def start(_type, _args) do
    Leaks.Supervisor.start_link(name: Leaks.Supervisor)
  end
end
