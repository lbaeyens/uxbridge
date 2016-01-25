class CreateMachinegroups < ActiveRecord::Migration
  def change
    create_table :machinegroups do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
