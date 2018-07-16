defmodule Exncf do
  @endpoint "https://api.sncf.com"
  defp headers() do
    [
      Authorization: Application.get_env(:exncf, :key, System.get_env("EXNCF_KEY"))
    ]
  end

  def journeys(from, to) do
    HTTPoison.get!(
      @endpoint <> "/v1/coverage/sncf/journeys",
      headers(),
      params: %{from: from, to: to}
    ).body
    |> Poison.decode(keys: :atoms)
  end

  def places(search) do
    HTTPoison.get!(@endpoint <> "/v1/coverage/sncf/places", headers(), params: %{q: search}).body
    |> Poison.decode(keys: :atoms)
  end
end
