class CreateMachinetypes < ActiveRecord::Migration
  def change
    create_table :machinetypes do |t|
      t.string :name
      t.references :machinegroup, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
