json.array!(@compras) do |compra|
  json.extract! compra, :id, :comprador, :descricao, :preco, :quantidade, :endereco, :fornecedor
  json.url compra_url(compra, format: :json)
end
