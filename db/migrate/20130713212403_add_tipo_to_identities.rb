class AddTipoToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :tipo, :string
  end
end
