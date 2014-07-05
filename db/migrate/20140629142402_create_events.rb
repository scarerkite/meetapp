class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.text :address
      t.string :postcode
      t.date :date
      t.time :time
      t.integer :host_id

      t.timestamps
    end
  end
end
