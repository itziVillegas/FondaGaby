class Producto < ActiveRecord::Base
  validates :nombre, presence: { message: "El Nombre Del Producto Es Requerido"},
            :length => { :minimum => 3, :maximum => 255, message: "El Nombre Del Producto Debe Tener Mínimo 3 Letras" }

  validates :stock, presence: { message: "El Stock Del Producto Es Requerido"},
            numericality: { only_float: true, message: "El Stock Del Producto Acepta Unicamente Numeros" }
  validates_inclusion_of :stock, in: 1..99, message: 'El Stock Del Producto Debe Ser Mayor a 0'

  validates :cantidad_maxima, presence: { message: "La Cantidad Maxima Del Producto Es Requerida"},
            numericality: { only_float: true, message: "La Cantidad Maxima Del Producto Acepta Unicamente Numeros" }
  validates_inclusion_of :cantidad_maxima, in: 1..99, message: 'La Cantidad Maxima Del Producto Debe Ser Mayor a 0'

  validates :categoria, presence: { message: "La Categoria Del Producto Es Requerida"}

  validates :unidad_medida, presence: { message: "La Unidad De Medida Del Producto Es Requerida"}
end