json.array!(@venta) do |ventum|
  json.extract! ventum, :id, :fecha, :hora, :total, :subtotal, :pedido_fk
  json.url ventum_url(ventum, format: :json)
end
