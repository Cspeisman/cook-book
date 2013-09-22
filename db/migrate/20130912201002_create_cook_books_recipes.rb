class CreateCookBooksRecipes < ActiveRecord::Migration
  def change
  	create_table :cook_books_recipes do |t|
  		t.integer :cook_book_id
  		t.integer :recipe_id
  	end
  end
end
