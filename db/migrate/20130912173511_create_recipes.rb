class CreateRecipes < ActiveRecord::Migration
  def change
  	create_table :recipes do |t|
  		t.string :name
  		t.string :ingredients
  		t.string :img_url
  	end
  end
end
