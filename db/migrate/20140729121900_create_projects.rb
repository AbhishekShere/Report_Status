class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :projectname
      t.string :clientname
      t.time :workinghours
      t.string :taskdo
      t.integer :user_id
      t.timestamps
    end
  end
end
