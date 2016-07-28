class Category < ActiveRecord::Base
  has_many :problem_categories
  has_many :problems, through: :problem_categories
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name

end