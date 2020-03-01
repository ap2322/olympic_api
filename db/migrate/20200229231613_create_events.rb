class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event
      t.string :games, :default => "2016 Summer"

      t.timestamps
    end
  end
end
