class Quiz < ActiveRecord::Base
  has_many :user_quizzes, dependent: :destroy
  has_many :questions, dependent: :destroy

  def find_question(question_number)
    if question_number > self.questions.count || self.questions.count == 0
      return nil
    else
      q = self.questions.order(:id)
      return q[question_number]
    end
  end
end
