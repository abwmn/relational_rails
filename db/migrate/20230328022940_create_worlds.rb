class CreateWorlds < ActiveRecord::Migration[5.2]
  def change
    create_table :worlds do |t|
      t.string :name
      t.integer :number_of_continents
      t.string :climate
      t.boolean :inhabitable

      t.timestamps
    end
  end
end
