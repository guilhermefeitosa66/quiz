class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy, :select_quiz, :clean]

  before_action :admin_permission, except: [:index, :answers, :answer]

  def index
    @quizzes = Quiz.all

    unless current_user.admin
      render 'quizzes/user_quiz'
    end
  end

  def select_quiz
    session[:quiz] = @quiz.id
    redirect_to quizzes_path
  end

  def deselect_quiz
    session[:quiz] = nil
    redirect_to quizzes_path
  end

  def answers
    user_quiz = UserQuiz.where(user_id: current_user.id, quiz_id: params[:id])
    
    if user_quiz.empty?
      user_quiz = UserQuiz.new(user_id: current_user.id, quiz_id: params[:id], current_question: 0)

      unless user_quiz.save
        redirect_to quizzes_url, notice: 'Ocorreu um problema ao selecionar o quiz, tente novamente!'
      end

      @user_quiz = user_quiz
      @question = user_quiz.quiz.find_question(user_quiz.current_question)
    else
      @user_quiz = user_quiz.first
      @question = @user_quiz.quiz.find_question(user_quiz.first.current_question)
    end

    if @question.nil?
      redirect_to quizzes_path, notice: 'No momento, não há mais questões pare serem respondidas!'
    end
  end

  def answer
    @user_quiz = UserQuiz.where(user_id: current_user.id, quiz_id: params[:id]).first
    @question = @user_quiz.quiz.find_question(@user_quiz.current_question)
    @choice = Choice.find(params[:user_choice][:choice_id])
    @user_quiz.user_choices.build(choice_id: params[:user_choice][:choice_id])
    @user_quiz.current_question += 1
    
    unless @user_quiz.save
      redirect_to answers_quiz_path(@user_quiz.quiz.id), notice: 'Ocorreu um erro ao responder, tente novamente!'
    end
  end

  def show
    @user_quizzes = UserQuiz.where(quiz_id: @quiz.id)
  end

  def clean
    @quiz.user_quizzes.destroy_all
    redirect_to @quiz
  end

  def new
    @quiz = Quiz.new
  end

  def edit
  end

  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    def quiz_params
      params.require(:quiz).permit(:name)
    end
end
