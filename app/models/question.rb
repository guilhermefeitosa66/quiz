class Question < ActiveRecord::Base
  include Bootsy::Container
  
  belongs_to :quiz
  has_many :choices, dependent: :destroy

  accepts_nested_attributes_for :choices

  def statistics
    corrects = 0
    wrongs = 0

    self.choices.each do |choice|
      choice.user_choices.each do |uc|
        if choice.correct
          corrects += 1
        else
          wrongs += 1
        end
      end
    end

    participant_count = self.quiz.user_quizzes.count
    percent_correct = 0
    percent_wrong = 0

    if participant_count > 0
      percent_correct = corrects * 100 / participant_count
      percent_wrong = wrongs * 100 / participant_count
    end

    return { corrects: corrects, wrongs: wrongs, percent_correct: percent_correct, percent_wrong: percent_wrong }
  end
end
