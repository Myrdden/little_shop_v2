class CreateCoupon < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :code
      t.boolean :active, default: true
      t.integer :amount
      t.boolean :percent
    end
  end
end
