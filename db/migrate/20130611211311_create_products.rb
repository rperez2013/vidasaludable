class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :codigo
      t.string :nombre
      t.string :categoria
      t.integer :precio
      t.string :extension

      t.timestamps
    end
  end
end
