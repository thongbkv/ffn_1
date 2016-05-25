class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :name
      t.string :description
      t.integer :number_of_team
      t.integer :number_of_match

      t.timestamps null: false
    end
  end
end
