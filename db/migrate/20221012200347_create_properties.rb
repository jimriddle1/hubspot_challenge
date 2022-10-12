class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.references :user, foreign_key: true
      t.string :street_address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :status
    end
  end
end
