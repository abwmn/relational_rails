class CreateInhabitants < ActiveRecord::Migration[5.2]
  def change
    create_table :inhabitants do |t|
      t.string :name
      t.integer :age
      t.boolean :married
      t.boolean :has_children
      t.string :role
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
