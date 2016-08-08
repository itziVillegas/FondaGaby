json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :nombre, :apellido_paterno, :apellido_materno, :telefono, :direccion, :usuario, :password
  json.url usuario_url(usuario, format: :json)
end
