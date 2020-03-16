class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |c|
      c.string :year
      c.string :make
      c.string :model
      c.string :color
      c.string :rank
      c.integer :hotwheeler_id
    end
  end
end
