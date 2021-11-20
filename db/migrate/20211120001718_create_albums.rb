class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.boolean :released, default: false
      t.datetime :released_at
      t.string :cover_art_url
      t.string :kind
      t.time :length

      t.timestamps
    end
  end
end
