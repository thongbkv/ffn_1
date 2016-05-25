class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :name
      t.string :description
      t.string :start_date
      t.string :hour
      t.string :stadium
      t.references :season, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
