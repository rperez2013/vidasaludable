class AddLocationToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :location, :string
  end
end
