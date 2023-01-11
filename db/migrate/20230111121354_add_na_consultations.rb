class AddNaConsultations < ActiveRecord::Migration[6.1]
  def change
    add_column :consultations, :start_time, :time
    add_column :consultations, :start_date, :date
  end
end
