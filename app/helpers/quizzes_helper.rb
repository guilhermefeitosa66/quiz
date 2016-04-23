module QuizzesHelper
  def current_quiz
    Quiz.where(id: session[:quiz]).first
  end

  def current_quiz_id
    session[:quiz]
  end

  def has_quiz_selected?
    session[:quiz]
  end
end
