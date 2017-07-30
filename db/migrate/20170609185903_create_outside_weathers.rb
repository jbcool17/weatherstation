class CreateOutsideWeathers < ActiveRecord::Migration[5.1]
  def change
    create_table :outside_weathers do |t|
      t.string :name
      t.float :temp
      t.float :humidity
      t.float :pressure
      t.string :description

      t.timestamps
    end
  end
end
