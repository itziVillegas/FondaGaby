json.array!(@platillo_pedidos) do |platillo_pedido|
  json.extract! platillo_pedido, :id, :id_pla_ped, :platillo, :pedido, :cantidad
  json.url platillo_pedido_url(platillo_pedido, format: :json)
end
