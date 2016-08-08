json.array!(@pedidos) do |pedido|
  json.extract! pedido, :id, :nombre_cliente, :apellido_paterno, :apellido_materno, :fecha, :hora, :direccion, :telefono, :usuario_fk
  json.url pedido_url(pedido, format: :json)
end
