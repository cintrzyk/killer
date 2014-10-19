json.array!(@assassins) do |assassin|
  json.extract! assassin, :id, :name
  json.url assassin_url(assassin, format: :json)
end
