class AddDescriptionToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :description, :text
    add_column :problems, :created_at, :datetime
    add_column :problems, :updated_at, :datetime
  end
end
