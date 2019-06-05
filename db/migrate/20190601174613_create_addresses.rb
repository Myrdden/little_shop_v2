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
  end
end
