defmodule Sncf do

  @doc """
  Fetch n trips at a given time
  """
  @spec get_journeys(string, string, string, string, number) :: []
  def get_journeys(api_key, from, to, d, n) do
    url = "https://api.sncf.com/v1/coverage/sncf/journeys?to=#{to}&from=#{from}&datetime_represents=departure&datetime=#{d}"
    journey = get_result(api_key, url)
    get_journey(api_key, from, to, d, [journey], n)
  end

  defp get_journey(api_key, from, to, d, journeys, n) do
    if n > 0 do
      previous_journey = List.last(journeys)
      journey = get_result(api_key, Enum.at(previous_journey["links"], 0)["href"])
      get_journey(api_key, from, to, d, journeys ++ [journey], n - 1)
    else
      journeys      
    end
  end

  defp get_result(api_key, url) do
    %HTTPoison.Response{status_code: 200, body: body} = HTTPoison.get!(url, %{}, [hackney: [basic_auth: {api_key, ""}]])
    Poison.decode!(body)
  end
end