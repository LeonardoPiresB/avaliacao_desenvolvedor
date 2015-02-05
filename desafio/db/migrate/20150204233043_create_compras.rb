class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.string :comprador
      t.string :descricao
      t.float :preco
      t.integer :quantidade
      t.string :endereco
      t.string :fornecedor

      t.timestamps
    end
  end
end
