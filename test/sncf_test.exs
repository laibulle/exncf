defmodule ExncfTest do
  use ExUnit.Case
  doctest Exncf
  
  test "get journeys" do
    key = System.get_env("SNCF_KEY")
    Exncf.get_journeys key, "stop_area:OCE:SA:87286005", "stop_area:OCE:SA:87286146", "20170610T133000", 5
  end
end
