class QuestionController < ApplicationController
  def index
  end

  def create
    puts params[:number_of_questions]
    # byebug
    quiz_order = (0..46).to_a.shuffle.slice(0..(params[:number_of_questions].to_i)-1)
    # byebug
    puts "問題番号は#{quiz_order}です。問題数は#{quiz_order.count}です。"
    # @prefectures = Prefecture.where(id: quiz_order)
    # 都道府県と県庁所在地の組み合わせデータをすべて読み込み
    prefectures = Prefecture.all
    pref_data = []
    prefectures.each do |pref|
      pref_data << [pref.prefecture_name, pref.capital]
    end
    
    # 四択問題にするために、[問題、正解、誤解1、誤解2,誤解3]の配列を出題数分作成する
    questions = []
    slide_num = rand(1..47)
    if params[:question_type] == "city"
      # byebug
      quiz_order.each do |num|
        questions <<
          [ pref_data[num][0],                        # 県名
            pref_data[num][1],                        # 都市名の正解
            pref_data[(num + slide_num * 1) % 47][1], # 都市名の誤解１
            pref_data[(num + slide_num * 2) % 47][1], # 都市名の誤解２
            pref_data[(num + slide_num * 3) % 47][1]  # 都市名の誤解３
          ] 
      end
      # byebug
    else
    end
    gon.quiz_data = questions
    render 'question/start'
  end
end
