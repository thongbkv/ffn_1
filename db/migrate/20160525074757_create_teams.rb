class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :logo
      t.string :coach
      t.string :country

      t.timestamps null: false
    end
  end
end
