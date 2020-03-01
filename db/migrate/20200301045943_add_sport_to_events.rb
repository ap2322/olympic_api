class AddSportToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :sport_id, :integer
    add_foreign_key :events, :sports
  end
end
