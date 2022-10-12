class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :company_domain
      t.string :email
      t.string :phone
      t.text :associated_accounts, array: true, default: []
    end
  end
end
