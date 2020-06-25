class QuizController < ApplicationController

  CATEGORY_PREFECTURE = 1

  def new
  end

  def create
    @quiz_type = params[:quiz_type]
    @quiz_numbers = params[:quiz_numbers].to_i

    quiz = Quiz.new(CATEGORY_PREFECTURE, @quiz_type, @quiz_numbers)
    gon.quiz_data = quiz.create
    gon.quiz_type = @quiz_type
    render 'question'
  end
end
