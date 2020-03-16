class EditCarsMigration < ActiveRecord::Migration
  def change
    add_column :cars, :hotwheeler_id, :integer
  end
end
