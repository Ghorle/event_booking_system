class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :event_organizer, foreign_key: true
      t.string :name
      t.text :description
      t.datetime :date

      t.timestamps
    end
  end
end
