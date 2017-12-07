class CreateCustomerMachines < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_machines do |t|
      t.references :customer, foreign_key: true
      t.references :brand, foreign_key: true
      t.string :machinemodel
      t.string :vin
      t.string :engine
      t.string :engineserialnumber
      t.datetime :datesold
      t.text :remarks

      t.timestamps
    end
  end
end
