class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :user_id
      t.string :subject
      t.time :intime
      t.time :outtime
      t.time :breaktime
      t.time :meetingtime
			t.time :workinghours
      t.string :coordinate
      t.text :text

      t.timestamps
    end
  end
end
