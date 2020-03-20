class AddAgeAttr < ActiveRecord::Migration
  def change
    add_column :hotwheelers, :age, :integer
  end
end
