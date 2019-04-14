defmodule MicroServiceTest do
  use ExUnit.Case
  doctest MicroService

  test "greets the world" do
    assert MicroService.hello() == :world
  end
end
