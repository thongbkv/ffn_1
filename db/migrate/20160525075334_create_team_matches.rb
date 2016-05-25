class CreateTeamMatches < ActiveRecord::Migration
  def change
    create_table :team_matches do |t|
      t.integer :goals
      t.integer :points
      
      t.references :team, index: true, foreign_key: true
      t.references :match, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
