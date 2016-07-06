class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :title
    end
  end
end
