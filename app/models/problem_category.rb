class ProblemCategory < ActiveRecord::Base
  belongs_to :problem
  belongs_to :category
end