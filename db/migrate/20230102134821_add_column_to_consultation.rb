class AddColumnToConsultation < ActiveRecord::Migration[6.1]
  def change
    add_column :start_date
  end
end
