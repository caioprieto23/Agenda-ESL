class ChangeConsultationsColunm < ActiveRecord::Migration[6.1]
  def change
    remove_column :consultations, :start_time
    remove_column :consultations, :end_time
  end
end
