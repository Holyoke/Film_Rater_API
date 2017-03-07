class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :film
      t.integer :score, limit: 1, null: false

      t.timestamps
    end
  end
end
