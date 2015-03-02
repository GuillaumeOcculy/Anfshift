class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.date :date
      t.time :time
      t.string :description
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
