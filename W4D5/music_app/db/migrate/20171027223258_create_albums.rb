class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :title, null: false
      t.integer :year, null: false
      t.boolean :live, default: false, null: false

      t.timestamps
    end

    add_index :albums, %i(band_id title), unique: true
    add_index :bands, :name, unique: true
  end
end
