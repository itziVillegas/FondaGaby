class Ventum < ActiveRecord::Base

  validates :total, presence: { message: "El Total De La Venta Es Requerido"},
            numericality: { only_float: true, message: "El Total De La Venta Acepta Unicamente Numeros" }
  validates_inclusion_of :total, in: 1..1500, message: 'El Total De La Venta Debe Ser Mayor a 0'

  validates :subtotal, presence: { message: "El Subtotal De La Venta Es Requerido"},
            numericality: { only_float: true, message: "El Subtotal De La Venta Acepta Unicamente Numeros" }
  validates_inclusion_of :subtotal, in: 1..1500, message: 'El Subtotal De La Venta Debe Ser Mayor a 0'
end
