class AddForeignKeytoProducts < ActiveRecord::Migration

  def change
  	add_index :products , :user_id
  end
end
