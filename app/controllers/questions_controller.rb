class QuestionsController < ApplicationController
  include QuizzesHelper

  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :admin_permission, except: []

  before_filter except: [] do
    unless has_quiz_selected?
      redirect_to quizzes_path, alert: 'Selecione um Quiz antes!'
    end
  end

  def index
    @questions = Question.where(quiz_id: current_quiz_id).order(:id)
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @question.quiz_id = current_quiz_id

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:description, :explanation, :bootsy_image_gallery_id, choices_attributes: [:id, :description, :correct])
    end
end
