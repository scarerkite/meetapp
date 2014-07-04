class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :event, index: true
      t.integer :host_id
      t.integer :invitee_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
