class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :hotwheelers, :fav, :string
  end
end
