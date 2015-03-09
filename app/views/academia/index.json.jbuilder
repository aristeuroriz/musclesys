json.array!(@academia) do |academium|
  json.extract! academium, :id, :nome_acad, :localidade, :instrutor
  json.url academium_url(academium, format: :json)
end
