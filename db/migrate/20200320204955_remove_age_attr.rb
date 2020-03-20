class RemoveAgeAttr < ActiveRecord::Migration
  def change
    remove_column :hotwheelers, :age, :string
  end
end
