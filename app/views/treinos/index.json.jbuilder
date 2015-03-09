json.array!(@treinos) do |treino|
  json.extract! treino, :id, :desc_treino, :user_id
  json.url treino_url(treino, format: :json)
end
