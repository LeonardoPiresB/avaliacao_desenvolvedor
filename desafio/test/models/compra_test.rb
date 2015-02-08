require 'test_helper'

class CompraTest < ActiveSupport::TestCase
	fixtures :compras
  
	def testar_compra
	
		[:primeiro, :segundo, :terceiro].each do |caso|
			compra = Compra.new(
				:comprador => compras(caso).comprador,
				:descricao => compras(caso).descricao,
				:preco => compras(caso).preco,
				:quantidade => compras(caso).preco,
				:endereco => compras(caso).enderenco,
				:fornecedor => compras(caso).fornecedor
				)
				
			msg = "A compra não foi salva."
			msg +="errors: #{compra.errors.inspect}"
			
			assert compra.save, msg
			
			compra_primeiro = Compra.find(compra.id)
			
			assert_equal compra.comprador, compra_primeiro.comprador
			
		end

	end
  
  
end
