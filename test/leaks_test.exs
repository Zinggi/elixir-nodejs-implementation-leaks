defmodule LeaksTest do
  use ExUnit.Case
  doctest Leaks

  test "greets the world" do
    assert Leaks.hello() == :world
  end
end
