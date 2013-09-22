class CreateCookBooks < ActiveRecord::Migration
  def change
  	create_table :cook_books do |t|
  		t.integer :user_id
  	end
  end
end
