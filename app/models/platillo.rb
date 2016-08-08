class Platillo < ActiveRecord::Base
  validates :nombre , presence: { message: "El Nombre Del Platillo Es Requerido"},
            :length => { :minimum => 5, :maximum => 255, message: "El Nombre Del Platillo Debe Tener Mínimo 5 Letras" }

  validates :descripcion , presence: { message: "La Descripción Del Platillo Es Requerida"},
            :length => { :maximum => 255, message: "La Descripción Del Platillo Acepta MAximo 255 Caracteres" }

  validates :precio , presence: { message: "El Precio Del Platillo Es Requerido"},
            numericality: { only_float: true, message: "El Precio Del Platillo Acepta Unicamente Numeros" }
  validates_inclusion_of :precio, in: 1..99, message: 'El Precio Del Platillo Debe Ser Mayor a 0'

  validates :tamanio , presence: { message: "El Tamaño Del Platillo Es Requerido"}
end
