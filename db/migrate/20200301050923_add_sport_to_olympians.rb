class AddSportToOlympians < ActiveRecord::Migration[5.2]
  def change
    change_table :olympians do |t|
      t.references :sport, foreign_key: true
      t.references :country, foreign_key: true
    end
  end
end
