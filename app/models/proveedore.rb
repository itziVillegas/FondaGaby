class Proveedore < ActiveRecord::Base
  VALID_RFC_REGEX = /\A[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9]([A-Z0-9]{3})?\z/i
  validates :rfc , format: { :with => VALID_RFC_REGEX, message: "El formato del RFC es invalido, el formato correcto es el siguiente:
  Los 3 o 4 primeros digitos deben ser letras MAYUSCULAS, seguido de dos numeros entre 0 y 9, posteriormente un 0 o 1, despues un numero entre 0 y 9,
  luego un numero entre 0 y 3, enseguida un numero entre 0 y 9 y finalmente tres caracteres que pueden ser letras mayusculas o numeros " }

  validates :nombre, presence: { message: "El Nombre Del Proveedor Es Requerido"},
            :length => { :maximum => 255, message: "El Nombre Del Producto Debe Tener Maximo 255 Caracteres" }

  validates :direccion, presence: { message: "La Dirección Del Proveedor Es Requerido"},
            :length => { :maximum => 255, message: "El Nombre Del Producto Debe Tener Maximo 255 Caracteres" }

  validates :telefono, presence: { message: "El Teléfono Del Proveeddor Es Requerido"},
            numericality: { only_integer: true, message: "El Teléfono Del Proveedor Acepta Unicamente Numeros" },
            :length => { :minimum => 10, :maximum => 10, message: "El Teléfono Del Proveedor Debe Tener Mínimo 10 Numeros y Maximo 10 Numeros" }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :correo, presence: { message: "El Email Del Proveedor es requerido"},
            format: { :with => VALID_EMAIL_REGEX, message: "El Formato Del Correo Es Invalido" }
end