class CreateConsultations < ActiveRecord::Migration[6.1]
  def change
    create_table :consultations do |t|
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.belongs_to :user
      t.belongs_to :username

      t.timestamps
    end
  end
end
