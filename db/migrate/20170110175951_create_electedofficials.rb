class CreateElectedofficials < ActiveRecord::Migration
  def change
    create_table :electedofficials do |t|
      t.string :name

      t.timestamps

    end
  end
end
