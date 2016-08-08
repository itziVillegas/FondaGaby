class Pedido < ActiveRecord::Base

  validates :nombre_cliente, presence: { message: "El Nombre Del Cliente Es Requerido"},
            :length => { :minimum => 3, :maximum => 255, message: "El Nombre Del Cliente Debe Tener Mínimo 3 Letras" }

  validates :apellido_paterno, presence: { message: "El Apellido Paterno Del Cliente Es Requerido"},
            :length => { :minimum => 4, :maximum => 10, message: "El Apellido Paterno del Cliente Debe Tener Mínimo 4 Letras" }

  validates :apellido_materno, presence: { message: "El Apellido Materno Del Cliente Es Requerido"},
            :length => { :minimum => 4, :maximum => 255, message: "El Apellido Materno Del Cliente Debe Tener Mínimo 4 Letras" }

  validates :direccion, presence: { message: "La Dirección Del Cliente Es Requerido"},
            :length => { :maximum => 255, message: "La Dirección Del Cliente Acepta MAximo 255 Caracteres" }

  validates :telefono, presence: { message: "El Teléfono Del Cliente Es Requerido"},
            :length => { :minimum => 10, :maximum => 10, message: "El Teléfono Del Cliente Debe Tener Mínimo 10 Numeros y No Puede Tener Mas De 10 Numeros" },
            numericality: { only_integer: true, message: "El Teléfono Acepta Unicamente Numeros" }
end