class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :played_count, default: 0
      t.references :album
      t.timestamps
    end
  end
end
