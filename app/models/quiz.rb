class Quiz < ActiveRecord::Base
  has_many :user_quizzes
  has_many :questions

  def find_question(question_number)
    if question_number > self.questions.count || self.questions.count == 0
      return nil
    else
      return self.questions[question_number]
    end
  end
end
