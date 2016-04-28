class StaticsController < ApplicationController
  before_action :choose_index, only: [:home_page]
  
  def home_page
    render 'statics/index'
  end

  private
    def choose_index
      redirect_to quizzes_path if user_signed_in?
    end
end
