class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :date_of_birth
      t.string :position
      t.integer :jersey_number
      t.string :nationality
      t.string :image
      
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
