class RemoverDateTimeConsultation < ActiveRecord::Migration[6.1]
  def remove_column
    t.datetime :end_time
  end
end
