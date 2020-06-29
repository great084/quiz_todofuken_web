class Quiz

  CATEGORY_PREFECTURE = 1

  PREFECTURE_DATA = 0
  CAPITAL_DATA = 1

  def initialize(category, type, numbers)
    @category = category
    @type = type
    @numbers = numbers
  end

  def create
    case @category
    when CATEGORY_PREFECTURE
      # 出題する問題のデータ番号をランダムに設定する
      quiz_order = (0..46).to_a.shuffle.slice(0..(@numbers)-1)

      # 都道府県と県庁所在地の組み合わせデータをすべて読み込み
      pref_data = Prefecture.all.map{ |pref| [pref.prefecture_name, pref.capital]}

      quiz_data = []
      slide_num = rand(1..47)

      if @type == "capital"
        quiz_order.each do |num|
          quiz_data <<
            [ pref_data[num][PREFECTURE_DATA],                      
              pref_data[num][CAPITAL_DATA],                        
              pref_data[(num + slide_num * 1) % 47][CAPITAL_DATA], 
              pref_data[(num + slide_num * 2) % 47][CAPITAL_DATA], 
              pref_data[(num + slide_num * 3) % 47][CAPITAL_DATA]  
            ] 
        end
        # byebug
      else
        quiz_order.each do |num|
          quiz_data <<
            [ pref_data[num][CAPITAL_DATA],                        
              pref_data[num][PREFECTURE_DATA],                        
              pref_data[(num + slide_num * 1) % 47][PREFECTURE_DATA], 
              pref_data[(num + slide_num * 2) % 47][PREFECTURE_DATA], 
              pref_data[(num + slide_num * 3) % 47][PREFECTURE_DATA]  
            ] 
        end
      end  
      quiz_data
    end
  end

end
