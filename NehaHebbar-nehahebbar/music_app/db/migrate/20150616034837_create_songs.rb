class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :year
      t.references :artist, index:true
    end
      add_foreign_key :songs, :artists
  end
end
