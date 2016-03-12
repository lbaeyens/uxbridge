class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.references :machinetype, index: true, foreign_key: true
      t.references :brand, index: true, foreign_key: true
      t.string :model
      t.string :engine
      t.string :description
      t.decimal :purchaseprice
      t.decimal :unitprice
      t.decimal :vatrate
      t.decimal :currentstock
      t.decimal :minimalstock
      t.string :warehouselocation

      t.timestamps null: false
    end
  end
end
