class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end

    remove_column :users, :address
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :zip
  end
end
