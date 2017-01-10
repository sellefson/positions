class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :official_id
      t.integer :position_id

      t.timestamps

    end
  end
end
