class CreateRepairstates < ActiveRecord::Migration
  def change
    create_table :repairstates do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
