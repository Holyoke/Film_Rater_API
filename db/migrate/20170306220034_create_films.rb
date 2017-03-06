class CreateFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :films do |t|
      t.string :title, null: false
      t.text :description
      t.string :url_slug
      t.integer :year, limit: 2 # 2 byte integer

      t.timestamps
    end
  end
end
