class CreateSeasonTeams < ActiveRecord::Migration
  def change
    create_table :season_teams do |t|
      t.integer :rank
      
      t.references :team, index: true, foreign_key: true
      t.references :season, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
