class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
    	t.string :projectname
      t.string :clientname
      t.float :pworkinghours
      t.string :taskdo
      t.timestamps
    end
  end
end
