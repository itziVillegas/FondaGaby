class Usuario < ActiveRecord::Base
  validates :nombre, presence: { message: "El Nombre Del Empleado Es Requerido"},
            :length => { :minimum => 3, message: "El Nombre Del Empleado Debe Tener Minimo 3 Letras" }

  validates :apellido_paterno, presence: { message: "El Apellido Paterno Del Empleado Es Requerido"},
            :length => { :minimum => 4, message: "El Apellido Paterno Del Empleado Debe Tener Minimo 4 Letras" }

  validates :apellido_materno, presence: { message: "El Apellido Materno Del Empleado Es Requerido"},
            :length => { :minimum => 4, message: "El Apellido Materno Del Empleado Debe Tener Minimo 4 Letras" }

  validates :telefono, presence: { message: "El Teléfono Del Empleado Es Requerido"},
            numericality: { only_integer: true, message: "El Teléfono Del Proveedor Acepta Unicamente Numeros" },
            :length => { :minimum => 10, :maximum => 10, message: "El Teléfono Del Empleado Debe Tener Mínimo 10 Numeros y Maximo 10 Numeros" }

  validates :direccion, presence: { message: "La Dirección Del Empleado Es Requerido"},
            :length => { :maximum => 255, message: "La Dirección Del Empleado Debe Tener Maximo 255 Caracteres" }
end