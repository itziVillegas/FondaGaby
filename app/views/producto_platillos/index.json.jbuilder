json.array!(@producto_platillos) do |producto_platillo|
  json.extract! producto_platillo, :id, :id_pro_pla, :producto, :platillo, :cantidad, :unidad_medida
  json.url producto_platillo_url(producto_platillo, format: :json)
end
