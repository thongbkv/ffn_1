class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :status
      
      t.references :match, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
