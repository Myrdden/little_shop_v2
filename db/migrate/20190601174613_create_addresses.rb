class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :active, default: true

      t.timestamps
    end

    remove_column :users, :address, :string
    remove_column :users, :city, :string
    remove_column :users, :state, :string
    remove_column :users, :zip, :string
  end
end
