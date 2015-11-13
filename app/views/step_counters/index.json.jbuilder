json.array!(@registrosbikecounts) do |registrosbikecount|
  json.extract! registrosbikecount, :id, :dia, :hora, :pedestre, :ciclista, :velocidade
  json.url registrosbikecount_url(registrosbikecount, format: :json)
end
