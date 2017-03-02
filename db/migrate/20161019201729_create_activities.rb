class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :location
      t.date :date
      t.references :user, index: true

      t.timestamps
    end
  end
end
