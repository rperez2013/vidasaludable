class AddBirthToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :birth, :date
  end
end
