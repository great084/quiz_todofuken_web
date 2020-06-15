class QuizController < ApplicationController

  def new
  end

  def create
    @quiz_type = params[:quiz_type]
    @quiz_numbers = params[:quiz_numbers].to_i
    # byebug
    # 出題する問題のデータ番号をランダムに設定する
    quiz_order = (0..46).to_a.shuffle.slice(0..(@quiz_numbers)-1)
    # 都道府県と県庁所在地の組み合わせデータをすべて読み込み
    # prefectures = Prefecture.all
    pref_data = []
    Prefecture.all.each do |pref|
      pref_data << [pref.prefecture_name, pref.capital]
    end
    
    # 四択問題にするために、[問題、正解、誤解1、誤解2,誤解3]の配列を出題数分作成する
    quiz_data = []
    slide_num = rand(1..47)
    if @quiz_type == "capital"
      quiz_order.each do |num|
        quiz_data <<
          [ pref_data[num][0],                        # 県名
            pref_data[num][1],                        # 都市名の正解
            pref_data[(num + slide_num * 1) % 47][1], # 都市名の誤解１
            pref_data[(num + slide_num * 2) % 47][1], # 都市名の誤解２
            pref_data[(num + slide_num * 3) % 47][1]  # 都市名の誤解３
          ] 
      end
      # byebug
    else
      quiz_order.each do |num|
        quiz_data <<
          [ pref_data[num][1],                        # 都市名
            pref_data[num][0],                        # 県名の正解
            pref_data[(num + slide_num * 1) % 47][0], # 県名の誤解１
            pref_data[(num + slide_num * 2) % 47][0], # 県名の誤解２
            pref_data[(num + slide_num * 3) % 47][0]  # 県名の誤解３
          ] 
      end
      # byebug
    end
    gon.quiz_data = quiz_data
    gon.quiz_type = @quiz_type
    render 'question'
  end
end
