class CreateParcels < ActiveRecord::Migration
  def change
    create_table :parcels do |t|
      t.string :tracker
      t.string :original_filename
      t.string :location

      t.timestamps
    end
  end
end
