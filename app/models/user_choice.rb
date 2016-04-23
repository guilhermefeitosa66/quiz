class UserChoice < ActiveRecord::Base
  belongs_to :user_quiz
  belongs_to :choice
end
