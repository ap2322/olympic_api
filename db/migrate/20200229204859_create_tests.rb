class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :name
      t.string :sport
      t.string :sex
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :team
      t.string :games
      t.string :event
      t.string :medal

      t.timestamps
    end
  end
end
