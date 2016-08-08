class PlatilloPedido < ActiveRecord::Base
  validates :cantidad, presence: { message: "La Cantidad Del Detalle De Pedido Es Requerido"},
            numericality: { only_integer: true, message: "La Cantidad Del Detalle De Pedido Acepta Unicamente Numeros" }
  validates_inclusion_of :cantidad, in: 1..100, message: 'La Cantidad Del Detalle De Pedido Debe Ser Mayor a 0'
end
