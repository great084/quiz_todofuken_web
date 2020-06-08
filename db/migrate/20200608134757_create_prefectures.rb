class CreatePrefectures < ActiveRecord::Migration[6.0]
  def change
    create_table :prefectures do |t|
      t.string :prefecture_name
      t.string :capital
      t.string :region

      t.timestamps
    end
  end
end
