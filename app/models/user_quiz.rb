class UserQuiz < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz
  has_many :user_choices

  def total_questions
    return self.quiz.questions.count
  end

  def total_correct
    total = 0

    choices = self.user_choices
    
    choices.each do |uc|
      if uc.choice.correct
        total += 1
      end
    end

    return total
  end

  def total_wrong
    total = 0

    choices = self.user_choices
    
    choices.each do |uc|
      unless uc.choice.correct
        total += 1
      end
    end

    return total
  end

  def percent_correct
    if total_questions == 0
      return 0
    else
      return total_correct * 100 / total_questions
    end
  end

  def percent_wrong
    if total_questions == 0
      return 0
    else
      return total_wrong * 100 / total_questions
    end
  end

  def percent_answered
    if total_questions == 0
      return 0
    else
      return current_question * 100 / total_questions
    end
  end
end
