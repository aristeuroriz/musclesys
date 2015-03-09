json.array!(@planos) do |plano|
  json.extract! plano, :id, :desc_plano, :valor_plano, :promo_id
  json.url plano_url(plano, format: :json)
end
