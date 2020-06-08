require "csv"

class Import
  def self.csv_data(path:)
    # CSVファイルの（１行目をキーとして）各行のデータを配列に格納する
    # CSVファイルのカラム名と，テーブルのカラム名を一致させておく必要がある
    # row は CSV::Row クラスである。これはモデルの引数として渡せないのでハッシュに変換しておく。
    list = []
    CSV.foreach(path, headers: true) { |row| list << row.to_h }
    list
  end
end


namespace :import_data do
  desc "Movieデータにタグデータを作成する"
  task prefecture: :environment do

    puts "#######  「prefecture_data.csv」のインポート処理を開始します #######"
    
    list = []
    CSV.foreach("db/csv_data/prefecture_data.csv", headers: true) do |data|
      list << data.to_h 
    end

    begin
      Prefecture.create!(list)
      puts "#######  インポート処理が完了しました。#######"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "#######  インポート処理が失敗しました（UnknownAttributeError）#######"
    end

  end
end
