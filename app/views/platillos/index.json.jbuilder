json.array!(@platillos) do |platillo|
  json.extract! platillo, :id, :nombre, :descripcion, :precio, :tamanio
  json.url platillo_url(platillo, format: :json)
end
