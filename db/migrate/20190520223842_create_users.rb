class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :role
      t.boolean :active, default: true
      t.string :name

      t.timestamps
    end
  end
end
