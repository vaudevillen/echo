class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.references :user
      t.string :song_id
      t.text :comment
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps null: false
    end
  end
end
