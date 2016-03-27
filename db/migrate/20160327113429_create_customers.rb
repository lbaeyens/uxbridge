class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :lastname
      t.string :name
      t.references :title, index: true, foreign_key: true
      t.string :address
      t.references :postalcode, index: true, foreign_key: true
      t.string :telephone
      t.string :mobilephone
      t.string :fax
      t.string :email
      t.string :contact
      t.string :vatnumber
      t.string :bankaccount
      t.text :remarks

      t.timestamps null: false
    end
  end
end
