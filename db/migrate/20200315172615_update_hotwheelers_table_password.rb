class UpdateHotwheelersTablePassword < ActiveRecord::Migration
  def change
    add_column :hotwheelers, :password, :string
  end
end
