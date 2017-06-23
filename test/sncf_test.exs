defmodule SncfTest do
  use ExUnit.Case
  doctest Sncf
  
  test "get journeys" do
    key = System.get_env("SNCF_KEY")
    Sncf.get_journeys key, "stop_area:OCE:SA:87286005", "stop_area:OCE:SA:87286146", "20170610T133000", 5
  end
end
