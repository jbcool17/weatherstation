class CreateSensors < ActiveRecord::Migration[5.1]
  def change
    create_table :sensors do |t|
      t.string :name
      t.string :location
      t.string :api_key

      t.timestamps
    end
  end
end
