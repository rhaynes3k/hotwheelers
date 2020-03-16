class CreateHotwheelers < ActiveRecord::Migration
  def change
    create_table :hotwheelers do |h|
      h.string :name
      h.string :age
      h.string :fav
      h.string :username
      h.string :password_digest
    end
  end
end
