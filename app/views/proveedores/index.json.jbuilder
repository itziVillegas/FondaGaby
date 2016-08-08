json.array!(@proveedores) do |proveedore|
  json.extract! proveedore, :id, :rfc, :nombre, :direccion, :telefono, :correo
  json.url proveedore_url(proveedore, format: :json)
end
