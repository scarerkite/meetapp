class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.text :address
      t.text :postcode
      t.string :date
      t.references :user, index: true

      t.timestamps
    end
  end
end
