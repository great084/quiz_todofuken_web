class QuestionController < ApplicationController
  def index
  end

  def create
    puts params[:number_of_questions]
    # byebug
    quiz_order = (0..46).to_a.shuffle.slice(0..(params[:number_of_questions].to_i)-1)
    # byebug
    puts "問題番号は#{quiz_order}です。問題数は#{quiz_order.count}です。"
    @questions = Prefecture.where(id: quiz_order)
    # byebug
    render 'question/start'
  end
end
