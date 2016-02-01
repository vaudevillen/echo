class AddArtistAndTitleToPins < ActiveRecord::Migration
  def change
    add_column :pins, :song_artist, :string
    add_column :pins, :song_title, :string
  end
end
