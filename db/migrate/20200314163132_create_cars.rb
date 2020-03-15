class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :year
      t.string :make
      t.string :model
      t.string :color
      t.integer :rank
    end
  end
end
