class AddAddressToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :address, :string
  end
end
