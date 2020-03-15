class CreateHotwheelers < ActiveRecord::Migration
  def change
    create_table :hotwheelers do |t|
      t.string :name
      t.string :age
      t.string :fav
    end
  end
end
