json.array!(@medidas) do |medida|
  json.extract! medida, :id, :data_medida, :peso, :torax, :ombro, :braco_d, :braco_e, :ante_braco_d, :ante_braco_e, :cintura, :quadril, :gluteo, :coxa_d, :coxa_e, :perna_d, :perna_e, :obs, :user_id
  json.url medida_url(medida, format: :json)
end
