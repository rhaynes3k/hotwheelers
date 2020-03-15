class UpdateHotwheelersTable < ActiveRecord::Migration
  def change
    add_column :hotwheelers, :username, :string
  end
end
