json.array!(@productos) do |producto|
  json.extract! producto, :id, :nombre, :fecha_caducidad, :stock, :cantidad_maxima, :categoria, :unidad_medida, :proveedor_fk
  json.url producto_url(producto, format: :json)
end
