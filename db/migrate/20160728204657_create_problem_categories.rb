class CreateProblemCategories < ActiveRecord::Migration
  def change
    create_table :problem_categories do |t|
      t.integer :problem_id
      t.integer :category_id
    end
  end
end
