class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :population
      t.integer :technological_level
      t.boolean :inhabited
      t.references :world, foreign_key: true

      t.timestamps
    end
  end
end
