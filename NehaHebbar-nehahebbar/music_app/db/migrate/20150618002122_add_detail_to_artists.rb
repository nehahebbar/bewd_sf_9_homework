class AddDetailToArtists < ActiveRecord::Migration
  def change
    add_reference :artists, :recordlabel, index: true, foreign_key: true
  end
end
