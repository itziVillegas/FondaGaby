class ProductoPlatillo < ActiveRecord::Base
  validates :cantidad, presence: { message: "La Cantidad Del Detalle Del Platillo Es Requerido"},
            numericality: { only_float: true, message: "La Cantidad Del Detalle Del Platillo Acepta Unicamente Numeros" }
  validates_inclusion_of :cantidad, in: 1..100, message: 'La Cantidad Del Detalle Del Platillo Debe Ser Mayor a 0'

  validates :unidad_medida, presence: { message: "La Unidad De Medida Del Detalle Del Platillo Es Requerido"}
end
